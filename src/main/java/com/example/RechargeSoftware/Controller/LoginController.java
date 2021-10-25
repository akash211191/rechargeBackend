package com.example.RechargeSoftware.Controller;

import java.net.URI;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.RechargeSoftware.Entity.User;
import com.example.RechargeSoftware.ServiceImpl.UserServiceImpl;

@RestController
public class LoginController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	UserServiceImpl userService;
	
	

	@PostMapping("/validateLogin")
	public ResponseEntity<List<User>> validateLogin(@RequestBody User user){
		ResponseEntity<List<User>> response = null;
		String userMobile = user.getUserMobile();
		String password = user.getUserPassword();
		int userId = 0 ;
		int roleId = 0;
		try {
			boolean checkLogin =  userService.checkLogin(userMobile,password);
			if(checkLogin) {
				List<User> userList = userService.getUserByMobile(userMobile);				 
				Iterator it = userList.iterator();
				while(it.hasNext()) {
					Object[] obj = (Object[]) it.next();
					userId =  Integer.parseInt(String.valueOf(obj[0]));
					roleId =  Integer.parseInt(String.valueOf(obj[2]));
					}
				session.setAttribute("userId", userId);
				response = new ResponseEntity<List<User>>(userList,HttpStatus.OK);
				}
			else {
			response =  new ResponseEntity<>(null,HttpStatus.OK);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();			
		}
		return response;
		
	}
	
	@RequestMapping("/id/{id}")
	public ResponseEntity<java.util.List<User>> getById(@PathVariable Integer id){
		List<User> userList = userService.getUserById(id);
		return new ResponseEntity<>(userList,HttpStatus.OK);	
	}
	
}
