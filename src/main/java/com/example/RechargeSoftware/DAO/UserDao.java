package com.example.RechargeSoftware.DAO;

import java.util.List;

import com.example.RechargeSoftware.Dto.UserDto;
import com.example.RechargeSoftware.Entity.User;
import com.example.RechargeSoftware.Master.Entity.Role;

public interface UserDao {
	public List<User> getUserById(Integer id);
	public String getUserNameById(int id);
	public User saveUser(UserDto user);
	boolean checkLogin(String userMobile,String password);
	boolean isUserExists(String mobileNo);
	public List<User> getUserByName(String userName);
	public List<User> getUserByMobile(String userMobile);
	public List<User> getAllUserListExceptAdmin();
	boolean checkValidPin(int transactionPin);
	public double getUserAccountBalance(int userId);
	public List<Role> getAllRoleListExceptAdmin();	
	public List<User> getAllUnderUserList(int userId);
	public User updateUser(UserDto user);
	public double getAmountUnderScheme(int schemeId);
	public double getActualAmount(int userId);
	public int getMasterUserId(int userId);
	public int getAdminUser(int userId);
	
}
