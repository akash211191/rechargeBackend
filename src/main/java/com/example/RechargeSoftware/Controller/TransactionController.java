package com.example.RechargeSoftware.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.RechargeSoftware.Dto.UserTransactionDto;
import com.example.RechargeSoftware.Entity.BalanceInfo;
import com.example.RechargeSoftware.Entity.RechargeTransaction;
import com.example.RechargeSoftware.Entity.Scheme;
import com.example.RechargeSoftware.ServiceImpl.BalanceServiceImpl;
import com.example.RechargeSoftware.ServiceImpl.UserServiceImpl;

@RestController
public class TransactionController {
	
	@Autowired
	UserServiceImpl userService;	
	
	@Autowired
	BalanceServiceImpl balanceService; 
	
	@PostMapping("/transactionApi/transaction")
	public ResponseEntity<Object> addTransaction(@RequestBody UserTransactionDto userTransactionDto){
		ResponseEntity<Object> response = null;
		int transactionPin = userTransactionDto.getUserPin(); /* 1999 */
		int sessionUserId = userTransactionDto.getSessionUserId(); /* 12 */ 
	    String transactionType = userTransactionDto.getTransactionType();  /* Debit */
 	    String newTransactionType = userTransactionDto.getTransactionType(); /* Debit */
 	    String newDescription = null;
	    double amount = userTransactionDto.getUserAmount();
	    double virtualBalance = userTransactionDto.getVirtualBalance();
	    double initialVirtualBalance = userTransactionDto.getVirtualBalance();
	    double initialAmount = userTransactionDto.getUserAmount();	    
	    double initialTotalAmount = initialAmount + initialVirtualBalance;
	    double totalAmount = amount + virtualBalance;
		  try { 
			  boolean checkValidPin = userService.checkValidPin(transactionPin);  /* true */			  
			  if(checkValidPin) {				  
				  if(sessionUserId != 0) { /* true */
					  UserTransactionDto newUserTransactionDto = new UserTransactionDto();
					    newUserTransactionDto.setUserId(sessionUserId);  /* 12 */
					    if(transactionType.equals("Debit") && sessionUserId != userTransactionDto.getUserId()) {
					    	newTransactionType = "Credit";
					    	amount = -amount;
					    	virtualBalance = -virtualBalance;
					    	totalAmount = amount + virtualBalance;
					    	newDescription = initialTotalAmount+" debited from "+userTransactionDto.getUserName();
					    }
					    if(transactionType.equals("Credit") && sessionUserId != userTransactionDto.getUserId()) {
					    	newTransactionType = "Debit";
					    	amount = -amount;
					    	virtualBalance = -virtualBalance;
					    	totalAmount = amount + virtualBalance;
					    	newDescription = initialTotalAmount+" credited to "+userTransactionDto.getUserName();
					    }
					    double adminUserBalance = userService.getUserAccountBalance(sessionUserId);  /* 0 */
					    double adminTotalBalance = adminUserBalance + totalAmount;   /* 100000 */
					    double userBalance = userService.getUserAccountBalance(userTransactionDto.getUserId());					    
					    double totalBalance = userBalance + userTransactionDto.getUserAmount() + userTransactionDto.getVirtualBalance();
					    newUserTransactionDto.setTransactionType(newTransactionType);					    
					    newUserTransactionDto.setUserAmount(totalAmount);
					    newUserTransactionDto.setDescription(newDescription);
					    if(adminTotalBalance < 0) {
					    	response = new ResponseEntity<>("Insufficient Balance",HttpStatus.OK);
					    }else if(totalBalance < 0){
					    	response = new ResponseEntity<>("Balance Cannot Be Negative",HttpStatus.OK);
					    }
					    else if(sessionUserId != userTransactionDto.getUserId()){
					    	balanceService.saveUserTransaction(userTransactionDto);	
					    	balanceService.saveUserTransaction(newUserTransactionDto);
					    	response = new ResponseEntity<>("Transaction Done",HttpStatus.OK);
					    }
					    else {
					    	balanceService.saveUserTransaction(newUserTransactionDto);
					    	response = new ResponseEntity<>("Transaction Done",HttpStatus.OK);
					    }	
					    }
				  }
			  	 else { 				 
				 response = new ResponseEntity<>("Incorrect Transaction Pin !!!",HttpStatus.OK); 
				  } 
			  }
		 catch(Exception e) { 
			 e.printStackTrace(); 
			 }
		 
		return response;
		}
	
	@PostMapping("/transactionApi/fundTransfer")
	public ResponseEntity<Object> fundTransfer(@RequestBody UserTransactionDto userTransactionDto){
		ResponseEntity<Object> response = null;
		int sessionUserId = userTransactionDto.getSessionUserId();  
	    String newTransactionType = "Credit"; 
	    String newDescription = null;
	    double amount = userTransactionDto.getVirtualBalance();  
	    double initialAmount = -amount;	    
		  try { 
			  				  
				  if(sessionUserId != 0) { /* true */
					    UserTransactionDto newUserTransactionDto = new UserTransactionDto();
					    newUserTransactionDto.setUserId(userTransactionDto.getToUserId());  					    
					    newDescription = initialAmount+" credited ";
					    double sessionUserBalance = userService.getUserAccountBalance(sessionUserId);  /* 0 */
					    newUserTransactionDto.setTransactionType(newTransactionType);					    
					    newUserTransactionDto.setVirtualBalance(initialAmount);
					    newUserTransactionDto.setDescription(newDescription);
					    newUserTransactionDto.setSessionUserId(userTransactionDto.getSessionUserId());
					    if(sessionUserBalance < initialAmount) {
					    	response = new ResponseEntity<>("Insufficient Balance",HttpStatus.OK);
					    } else {
					    	balanceService.saveUserTransaction(userTransactionDto);	
					    	balanceService.saveUserTransaction(newUserTransactionDto);
					    	response = new ResponseEntity<>("Transaction Done",HttpStatus.OK);
					    }
				  	}
		  		}
		 catch(Exception e) { 
			 e.printStackTrace(); 
			 }
		 
		return response;
		}
	
	@PostMapping("/transactionApi/rechargeTransaction")
	public ResponseEntity<Object> addRechargeTransaction(@RequestBody UserTransactionDto userTransactionDto){
		ResponseEntity<Object> response = null;						
		  try { 
			  UserTransactionDto newUserTransactionDto = new UserTransactionDto();
			  int getMasterUserId = userService.getMasterUserId(userTransactionDto.getUserId());
			  int adminUserId = userService.getAdminUser(userTransactionDto.getUserId());
			  if(userTransactionDto.getUserId() == getMasterUserId) {
				  newUserTransactionDto.setUserId(getMasterUserId);
			      newUserTransactionDto.setTransactionType("Credit");
			      newUserTransactionDto.setUserAmount(userTransactionDto.getVirtualBalance());
			      balanceService.saveUserTransaction(newUserTransactionDto);  
			      response = new ResponseEntity<>("Transaction Done",HttpStatus.OK);
			  } else if( userTransactionDto.getUserId() == adminUserId) {
				  newUserTransactionDto.setUserId(adminUserId);
			      newUserTransactionDto.setTransactionType("Credit");
			      newUserTransactionDto.setUserAmount(userTransactionDto.getVirtualBalance());
			      balanceService.saveUserTransaction(newUserTransactionDto);  
			      response = new ResponseEntity<>("Transaction Done",HttpStatus.OK);
			  } else {
		      balanceService.saveUserTransaction(userTransactionDto);			    
			  response = new ResponseEntity<>("Transaction Done",HttpStatus.OK);				 
			  }
		  }
		 catch(Exception e) { 
			 e.printStackTrace(); 
			 }
		 
		return response;
		}

	@PostMapping("/rechargeTransaction/addTransactionForRecharge")
	public ResponseEntity<Object> addTransactionForRecharge(@RequestBody RechargeTransaction rechargeTransaction){
		ResponseEntity<Object> response = null;	
		  try { 
			  double userBalance = userService.getUserAccountBalance(rechargeTransaction.getUserId());
			  double rechargeAmount = rechargeTransaction.getRechargeAmount();
			  if(userBalance > rechargeAmount) {
				  double getActualAmount = userService.getActualAmount(rechargeTransaction.getUserId());
				  if(rechargeAmount > getActualAmount) {
					  RechargeTransaction newRechargeTransaction = new RechargeTransaction();
					  newRechargeTransaction.setUserId(rechargeTransaction.getUserId());
					  newRechargeTransaction.setOperatorId(rechargeTransaction.getOperatorId());
					  newRechargeTransaction.setMobileNumber(rechargeTransaction.getMobileNumber());
					  newRechargeTransaction.setRechargeAmount(rechargeAmount);
					  newRechargeTransaction.setStatus('N');
					  newRechargeTransaction.setRechargeApiId(rechargeTransaction.getRechargeApiId());
					  newRechargeTransaction.setDescription("Recharge Failed");
					  balanceService.saveRechargeTransaction(newRechargeTransaction);
					  response = new ResponseEntity<>("Recharge Failed",HttpStatus.OK);					  
				  }
				  else {
					  balanceService.saveRechargeTransaction(rechargeTransaction);
					  response = new ResponseEntity<>(rechargeTransaction.getRechargeTransactionId(),HttpStatus.OK);					    
				  }
				  } else { 				 
				 response = new ResponseEntity<>("Insufficient Balance ",HttpStatus.OK); 
				  } 
			  }
		 catch(Exception e) { 
			 e.printStackTrace(); 
			 }
		 
		return response;
		}
	
	@PostMapping("/transactionApi/rechargeTransactionDebit")
	public ResponseEntity<Object> rechargeTransactionDebit(@RequestBody UserTransactionDto userTransactionDto){
		ResponseEntity<Object> response = null;						
		  try { 
			      UserTransactionDto newUserTransactionDto = new UserTransactionDto();
			      int getMasterUserId = userService.getMasterUserId(userTransactionDto.getUserId());
			      newUserTransactionDto.setUserId(getMasterUserId);
			      newUserTransactionDto.setTransactionType("Debit");
			      newUserTransactionDto.setUserAmount(userTransactionDto.getVirtualBalance());
			      balanceService.saveUserTransaction(newUserTransactionDto);
			      balanceService.saveUserTransaction(userTransactionDto);
				  response = new ResponseEntity<>("Transaction Done",HttpStatus.OK);				 
			  }
		 catch(Exception e) { 
			 e.printStackTrace(); 
			 }
		 
		return response;
		}
	
	@GetMapping(value = "/getUserPassbook/{userId}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<BalanceInfo>> getUserPassbook(@PathVariable int userId) {
		try {
			return new ResponseEntity<Iterable<BalanceInfo>>(balanceService.getUserPassbook(userId), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<BalanceInfo>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping(value = "/getRechargeReport/{userId}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<RechargeTransaction>> getRechargeReport(@PathVariable int userId) {
		try {
			return new ResponseEntity<Iterable<RechargeTransaction>>(balanceService.getRechargeReport(userId), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<RechargeTransaction>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping(value = "/getAllRechargeReport/", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<RechargeTransaction>> getAllRechargeReport() {
		try {
			return new ResponseEntity<Iterable<RechargeTransaction>>(balanceService.getAllRechargeReport(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<RechargeTransaction>>(HttpStatus.BAD_REQUEST);
		}
	}
}
