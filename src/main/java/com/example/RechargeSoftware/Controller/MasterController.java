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

import com.example.RechargeSoftware.Entity.Commission;
import com.example.RechargeSoftware.Entity.Operator;
import com.example.RechargeSoftware.Entity.RechargeApi;
import com.example.RechargeSoftware.Entity.SMSApi;
import com.example.RechargeSoftware.Entity.Scheme;
import com.example.RechargeSoftware.Entity.User;
import com.example.RechargeSoftware.ServiceImpl.MasterServiceImpl;

@RestController
public class MasterController {
	
	@Autowired
	MasterServiceImpl service;
	
	
	@PostMapping("/operatorApi/addOperator")
	public ResponseEntity<Object> addOperator(@RequestBody Operator operator){
		ResponseEntity<Object> response = null;
		  try { 
			      if(operator.getOperatorId() != 0) {
			    	  boolean checkifCommissionConsumed = service.checkIfCommissionConsumedForOperator(operator);
			    	  if(checkifCommissionConsumed) {
			    		  response = new ResponseEntity<>("Commission already consumed",HttpStatus.OK);	
			    	  }
			    	  else {
			    		  service.saveOperatorInfo(operator);
			    		  response = new ResponseEntity<>("Operator Added",HttpStatus.OK);
			    	  }
			      }
			      else {
				  service.saveOperatorInfo(operator);
				  response = new ResponseEntity<>("Operator Added",HttpStatus.OK);	
			      }
			  }
		 catch(Exception e) { 
			 e.printStackTrace(); 
			 response = new ResponseEntity<>("Issue while inserting operator",HttpStatus.OK);
			 }
		 
		return response;
		}	
	
	@GetMapping(value = "/getOperatorList", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<Operator>> getOperatorList() {
		try {
			return new ResponseEntity<Iterable<Operator>>(service.getAllOperatorList(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<Operator>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping(value = "/getOperatorListById/{operatorId}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<Operator>> getOperatorListById(@PathVariable int operatorId) {
		try {
			return new ResponseEntity<Iterable<Operator>>(service.getOperatorListById(operatorId), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<Operator>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping(value = "/getSMSApiListById/{smsApiId}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<SMSApi>> getSMSApiListById(@PathVariable int smsApiId) {
		try {
			return new ResponseEntity<Iterable<SMSApi>>(service.getSMSApiListById(smsApiId), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<SMSApi>>(HttpStatus.BAD_REQUEST);
			}
		}
	
	@PostMapping("/smsApi/addSmsApi")
	public ResponseEntity<Object> addSmsApi(@RequestBody SMSApi smsApi){
		ResponseEntity<Object> response = null;
		  try { 
				  service.addSmsApi(smsApi);
				  response = new ResponseEntity<>("SMS API updated",HttpStatus.OK);				   
			  }
		 catch(Exception e) { 
			 e.printStackTrace(); 
			 response = new ResponseEntity<>("Issue while inserting operator",HttpStatus.OK);
			 }
		 
		return response;
		}
	
	@GetMapping(value = "/getSMSApiList", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<SMSApi>> getSMSApiList() {
		try {
			return new ResponseEntity<Iterable<SMSApi>>(service.getAllSMSApi(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<SMSApi>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping(value = "/getRechargeApiListById/{rechargeApiId}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<RechargeApi>> getRechargeApiListById(@PathVariable int rechargeApiId) {
		try {
			return new ResponseEntity<Iterable<RechargeApi>>(service.getRechargeApiListById(rechargeApiId), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<RechargeApi>>(HttpStatus.BAD_REQUEST);
			}
		}
	
	@PostMapping("/rechargeApi/addRechargeApi")
	public ResponseEntity<Object> addRechargeApi(@RequestBody RechargeApi rechargeApi){
		ResponseEntity<Object> response = null;
		  try { 
				  service.addRechargeApi(rechargeApi);
				  response = new ResponseEntity<>("Recharge API updated",HttpStatus.OK);				   
			  }
		 catch(Exception e) { 
			 e.printStackTrace(); 
			 response = new ResponseEntity<>("Issue while inserting operator",HttpStatus.OK);
			 }
		 
		return response;
		}
	
	@GetMapping(value = "/getRechargeApiList", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<RechargeApi>> getRechargeApiList() {
		try {
			return new ResponseEntity<Iterable<RechargeApi>>(service.getAllRechargeApi(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<RechargeApi>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@PostMapping("/commissionApi/addCommission")
	public ResponseEntity<Object> addCommissionApi(@RequestBody Commission commission){
		ResponseEntity<Object> response = null;
		  try { 
			  	  boolean checkIfCommissionAmountExceeded = service.checkIfCommissionAmountExceeded(commission);
			  	  if(commission.getCommissionId() == 0) {
			  		boolean checkIfCommissionAlreadyExists = service.checkIfCommissionAlreadyExists(commission);
			  		if(checkIfCommissionAlreadyExists) {
			  			response = new ResponseEntity<>("Scheme Already Exists",HttpStatus.OK);
			  		}
			  		else {
			  			if(checkIfCommissionAmountExceeded) {
			  				response = new ResponseEntity<>("Commission amount exceeded please reduce",HttpStatus.OK);
			  			}
			  			else {
			  				service.addCommission(commission);
						    response = new ResponseEntity<>("Commission Added",HttpStatus.OK);	
			  			}			  			
			  		}
			  	  }		else 
			  	  {
			  		  
			  		if(checkIfCommissionAmountExceeded) {
		  				response = new ResponseEntity<>("Commission amount exceeded please reduce",HttpStatus.OK);
		  			}
		  			else {
		  				service.addCommission(commission);
					    response = new ResponseEntity<>("Commission Updated",HttpStatus.OK);	
		  			}
			  	  }
			  }
		 catch(Exception e) { 
			 e.printStackTrace(); 
			 response = new ResponseEntity<>("Issue while inserting operator",HttpStatus.OK);
			 }
		 
		return response;
		}
	
	@PostMapping("/commissionApi/updateCommission")
	public ResponseEntity<Object> updateCommissionApi(@RequestBody Commission commission){
		ResponseEntity<Object> response = null;
		  try { 
			  	  boolean checkIfCommissionAmountExceededforUpdate = service.checkIfCommissionAmountExceededForUpdate(commission);
			  		if(checkIfCommissionAmountExceededforUpdate) {
		  				response = new ResponseEntity<>("Commission amount exceeded please reduce",HttpStatus.OK);
		  			}
		  			else {
		  				service.addCommission(commission);
					    response = new ResponseEntity<>("Commission Updated",HttpStatus.OK);	
		  			}
			  	}
		 catch(Exception e) { 
			 e.printStackTrace(); 
			 response = new ResponseEntity<>("Issue while inserting operator",HttpStatus.OK);
			 }
		 
		return response;
		}
	
	@GetMapping(value = "/getCommissionList", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<Commission>> getCommissioniList() {
		try {
			return new ResponseEntity<Iterable<Commission>>(service.getAllCommission(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<Commission>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping(value = "/getCommissionListById/{commissionId}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<Commission>> getCommissionListById(@PathVariable int commissionId) {
		try {
			return new ResponseEntity<Iterable<Commission>>(service.getCommissionListById(commissionId), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<Commission>>(HttpStatus.BAD_REQUEST);
			}
		}
	
	@PostMapping("/schemeApi/addScheme")
	public ResponseEntity<Object> addScheme(@RequestBody Scheme scheme){
		ResponseEntity<Object> response = null;
		  try { 
				  service.saveScheme(scheme);
				  response = new ResponseEntity<>("Scheme Added",HttpStatus.OK);				   
			  }
		 catch(Exception e) { 
			 e.printStackTrace(); 
			 response = new ResponseEntity<>("Issue while inserting operator",HttpStatus.OK);
			 }
		 
		return response;
		}	
	
	@GetMapping(value = "/getSchemeList", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<Scheme>> getSchemeList() {
		try {
			return new ResponseEntity<Iterable<Scheme>>(service.getAllSchemeList(), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<Scheme>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping(value = "/getSchemeListById/{schemeId}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<Scheme>> getSchemeListById(@PathVariable int schemeId) {
		try {
			return new ResponseEntity<Iterable<Scheme>>(service.getSchemeListById(schemeId), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<Scheme>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping(value = "/rechargeApi/creditCommissionToUser/{userId}/{operatorId}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<User>> creditCommissionToUser(@PathVariable int userId,@PathVariable int operatorId) {
		try {
			return new ResponseEntity<Iterable<User>>(service.creditCommissionToUser(userId,operatorId), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<User>>(HttpStatus.BAD_REQUEST);
			}
		}
	
	@GetMapping(value = "/getSchemeForRole/{roleId}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<Scheme>> getSchemeForRole(@PathVariable int roleId) {
		try {
			return new ResponseEntity<Iterable<Scheme>>(service.getSchemeForRole(roleId), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<Scheme>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@GetMapping(value = "/getSchemeUnderRole/{roleId}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<Scheme>> getSchemeUnderRole(@PathVariable int roleId) {
		try {
			return new ResponseEntity<Iterable<Scheme>>(service.getSchemeUnderRole(roleId), HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Iterable<Scheme>>(HttpStatus.BAD_REQUEST);
		}
	}
	
}