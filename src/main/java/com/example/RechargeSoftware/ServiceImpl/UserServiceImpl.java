package com.example.RechargeSoftware.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.RechargeSoftware.DaoImpl.UserDaoImpl;
import com.example.RechargeSoftware.Dto.UserDto;
import com.example.RechargeSoftware.Entity.User;
import com.example.RechargeSoftware.Master.Entity.Role;
import com.example.RechargeSoftware.Service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDaoImpl userDaoImpl;
	
	@Override
	public List<User> getUserById(Integer id) {
		return userDaoImpl.getUserById(id);
	}
	
	@Override	
	public User saveUser(UserDto user) {
		return userDaoImpl.saveUser(user);
	}


	@Override
	public boolean checkLogin(String userMobile, String password) {
		// TODO Auto-generated method stub
		return userDaoImpl.checkLogin(userMobile, password);
	}

	@Override
	public boolean isUserExists(String mobileNo) {
		// TODO Auto-generated method stub
		return userDaoImpl.isUserExists(mobileNo);
	}

	@Override
	public List<User> getUserByName(String userName) {
		// TODO Auto-generated method stub
		return userDaoImpl.getUserByName(userName);
	}

	@Override
	public List<User> getAllUserListExceptAdmin(int roleId) {
		
		return userDaoImpl.getAllUserListExceptAdmin(roleId);
	}

	@Override
	public boolean checkValidPin(int userTransactionPin) {
		// TODO Auto-generated method stub
		return userDaoImpl.checkValidPin(userTransactionPin);
	}

	@Override
	public List<User> getUserByMobile(String userMobile) {
		// TODO Auto-generated method stub
		return userDaoImpl.getUserByMobile(userMobile);
	}

	@Override
	public double getUserAccountBalance(int userId) {
		// TODO Auto-generated method stub
		return userDaoImpl.getUserAccountBalance(userId);
	}

	@Override
	public List<Role> getAllRoleListExceptAdmin() {
		// TODO Auto-generated method stub
		return userDaoImpl.getAllRoleListExceptAdmin();
	}

	

	public List<User> getAllUnderUserList(int userId) {
		// TODO Auto-generated method stub
		return userDaoImpl.getAllUnderUserList(userId);
	}

	@Override
	public User updateUser(UserDto user) {
		// TODO Auto-generated method stub
		return userDaoImpl.updateUser(user);
	}

	@Override
	public String getUserNameById(int id) {		
		return userDaoImpl.getUserNameById(id);
	}

	@Override
	public double getAmountUnderScheme(int schemeId) {
		// TODO Auto-generated method stub
		return userDaoImpl.getAmountUnderScheme(schemeId);
	}

	@Override
	public double getActualAmount(int userId) {
		// TODO Auto-generated method stub
		return userDaoImpl.getActualAmount(userId);
	}

	@Override
	public int getMasterUserId(int userId) {
		// TODO Auto-generated method stub
		return userDaoImpl.getMasterUserId(userId);
	}

	@Override
	public int getAdminUser(int userId) {
		// TODO Auto-generated method stub
		return userDaoImpl.getAdminUser(userId);
	}

	@Override
	public int getAdminPin(String userMobile) {
		// TODO Auto-generated method stub
		return userDaoImpl.getAdminPin(userMobile);
	}
	
}
