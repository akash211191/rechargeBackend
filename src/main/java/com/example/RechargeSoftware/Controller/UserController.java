package com.example.RechargeSoftware.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.RechargeSoftware.Dto.UserDto;
import com.example.RechargeSoftware.Dto.UserTransactionDto;
import com.example.RechargeSoftware.Entity.User;
import com.example.RechargeSoftware.ServiceImpl.BalanceServiceImpl;
import com.example.RechargeSoftware.ServiceImpl.UserServiceImpl;

@RestController
@RequestMapping("/userApi")
public class UserController {
	@Autowired
	UserServiceImpl userService;
	
	@Autowired
	BalanceServiceImpl balanceService;
	
	@PostMapping("/addUser")
	public ResponseEntity<Object> addUser(@RequestBody UserDto newUser){
		ResponseEntity<Object> response = null;
		String mobileNo = newUser.getUserMobile();		
		try {
				if(newUser.getUserId() != 0) {
					userService.updateUser(newUser);	
					response = new ResponseEntity<>("User updated successfully !!!",HttpStatus.OK);
				}
				else {
					boolean isUserExists = userService.isUserExists(mobileNo);
					if(isUserExists) {
						response = new ResponseEntity<>("Mobile Already Exists",HttpStatus.OK);
					}
					else {
						int userId = newUser.getUnderUserId();						
						double userBalance = userService.getUserAccountBalance(userId);
						double amount = userService.getAmountUnderScheme(newUser.getSchemeId());
						if(userBalance < amount) {
					    	response = new ResponseEntity<>("Insufficient Balance",HttpStatus.OK);
					    }
						else {
							double getActualAmount = userService.getActualAmount(userId);
							if(amount > getActualAmount) {
								response = new ResponseEntity<>("User not added",HttpStatus.OK);
							}
							else {
							String schemeName = newUser.getSchemeName();
							String transactionType = "Debit";
							String newtransactionType = "Credit";
							String description = schemeName+" Registration Fees";
								
							if(newUser.getSchemeId() == 1) {
								UserTransactionDto userTransactionDto = new UserTransactionDto();
								amount = userService.getAmountUnderScheme(newUser.getSchemeId());
								userTransactionDto.setUserAmount(-amount);
								userTransactionDto.setUserId(userId);
								userTransactionDto.setDescription(description);
								userTransactionDto.setTransactionType(transactionType);
								userTransactionDto.setSessionUserId(newUser.getUnderUserId());
								balanceService.saveUserTransaction(userTransactionDto);
							}
							if(newUser.getSchemeId() != 1) {
								int masterUserId = userService.getMasterUserId(userId);
								UserTransactionDto masterUserTransactionDto = new UserTransactionDto();
								amount = userService.getAmountUnderScheme(newUser.getSchemeId());
								masterUserTransactionDto.setUserAmount(-amount);
								masterUserTransactionDto.setUserId(masterUserId);
								masterUserTransactionDto.setDescription(description);
								masterUserTransactionDto.setTransactionType(transactionType);
								masterUserTransactionDto.setSessionUserId(newUser.getUnderUserId());
								balanceService.saveUserTransaction(masterUserTransactionDto);
							}
							UserTransactionDto newUserTransactionDto = new UserTransactionDto();
							newUserTransactionDto.setUserAmount(amount);
							newUserTransactionDto.setUserId(12);
							newUserTransactionDto.setDescription(description);
							newUserTransactionDto.setTransactionType(newtransactionType);
							newUserTransactionDto.setSessionUserId(newUser.getUnderUserId());
							balanceService.saveUserTransaction(newUserTransactionDto);
							userService.saveUser(newUser);
							response = new ResponseEntity<>("User created successfully !!!",HttpStatus.OK);		
							}
						}
					}	
				}
				
		} catch(Exception e) {
			e.printStackTrace();
			response = new ResponseEntity<>("Insert error",HttpStatus.OK);
		}
		
		return response;
		}
	
	
	@GetMapping("/getUserAccountBalance/{userId}")
	public ResponseEntity<Object> getUserAccount(@PathVariable int userId){
		ResponseEntity<Object> response = null;		
		try {
			double userBalance = userService.getUserAccountBalance(userId);
			response = new ResponseEntity<>(userBalance,HttpStatus.OK);
			}
		catch(Exception e) {
			e.printStackTrace();
		}		
		return response;
		}
	
	@RequestMapping("/getUserById/{id}")
	public ResponseEntity<java.util.List<User>> getById(@PathVariable Integer id){
		List<User> userList = userService.getUserById(id);
		return new ResponseEntity<>(userList,HttpStatus.OK);	
	}
	
	@RequestMapping("/getUserNameById/{id}")
	public ResponseEntity<Object> getUserNameById(@PathVariable Integer id){
		String userName = userService.getUserNameById(id);
		return new ResponseEntity<>(userName,HttpStatus.OK);	
	}
	
	@RequestMapping("/getAllUserList/{roleId}")
	public ResponseEntity<java.util.List<User>> getAllUserList(@PathVariable int roleId){
		List<User> userList = userService.getAllUserListExceptAdmin(roleId);
		return new ResponseEntity<>(userList,HttpStatus.OK);	
	}
	
	@RequestMapping("/getAllUnderUserList/{userId}")
	public ResponseEntity<java.util.List<User>> getAllUnderUserList( @PathVariable int userId){
		List<User> userList = userService.getAllUnderUserList(userId);
		return new ResponseEntity<>(userList,HttpStatus.OK);	
	}
	
	@RequestMapping("/getAdminPin/{userMobile}")
	public ResponseEntity<Object> getAdminPin( @PathVariable String userMobile){
		int pin = userService.getAdminPin(userMobile);
		return new ResponseEntity<>(pin,HttpStatus.OK);	
	}

	
}
