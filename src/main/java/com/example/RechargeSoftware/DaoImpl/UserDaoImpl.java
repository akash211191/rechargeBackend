package com.example.RechargeSoftware.DaoImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.RechargeSoftware.DAO.UserDao;
import com.example.RechargeSoftware.Dto.UserDto;
import com.example.RechargeSoftware.Entity.Scheme;
import com.example.RechargeSoftware.Entity.User;
import com.example.RechargeSoftware.Mapping.Entity.UserRoleMapper;
import com.example.RechargeSoftware.Master.Entity.Role;

@Configuration
@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	SessionFactory  sessionFactory;
		
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public List<User> getUserById(Integer id) {
		Session session = this.sessionFactory.getCurrentSession();
		List<User> userList = new ArrayList<>();
		try {
			Query query = session.getNamedNativeQuery("User.getUserById").setParameter("userId", id);
		    userList = query.list();			
		} catch(Exception e) {
			e.printStackTrace();
		}		
		return userList;
	}

	
	@Override
	@Transactional
	public User saveUser(UserDto user) {
		User newUser = new User();		
		// TODO Auto-generated method stub
		try {
			Session session = this.sessionFactory.getCurrentSession();
			Random rnd = new Random();
		    int number = rnd.nextInt(999999);
		    String numbertoString = Integer.toString(number);
			newUser.setUserName(user.getUserName());
			newUser.setUserLastName(user.getUserLastName());
			newUser.setUserEmail(user.getUserEmail());
			newUser.setUserMobile(user.getUserMobile());
			newUser.setUserPassword(numbertoString);
			newUser.setFirstTimeOtp(number);
			newUser.setIsActiveUser('Y');			
			newUser.setIsFirstLogin('Y');
			newUser.setUserAddress(user.getUserAddress());
			newUser.setCreatedDate(new Date());
			newUser.setLastUpdatedDate(new Date());	
			newUser.setUserUniqueId("0");
			newUser.setUnderUserId(user.getUnderUserId());
			newUser.setSchemeId(user.getSchemeId());
			newUser.setUserFirmName(user.getUserFirmName());
			newUser.setUserArea(user.getUserArea());
			long milliseconds = (long) 365 * 24 * 60 * 60 * 1000;
			Date currentDate = new Date();
	        Date expiry = new Date(currentDate.getTime() + milliseconds);
	        newUser.setExpiryDate(expiry);
			newUser.setUserPancard(user.getUserPancard());
			session.saveOrUpdate(newUser);
			int userId = newUser.getUserId();
			String newUniqueUserId = "U-"+userId;
			Query query = session.createSQLQuery("Update Tbl_User set unique_user_id =:newUniqueUserId where user_id =:userId")
					.setParameter("newUniqueUserId",newUniqueUserId)
					.setParameter("userId",userId);
			query.executeUpdate();
			UserRoleMapper userRoleMapper = new UserRoleMapper();
			userRoleMapper.setUserId(newUser.getUserId());
			userRoleMapper.setRoleId(user.getRoleId());
			session.saveOrUpdate(userRoleMapper);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return newUser;
	}

	@SuppressWarnings({"rawtypes","unchecked"})
	@Override
	@Transactional
	public boolean checkLogin(String userMobile, String password) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		try {
			
			List<User> user = session.getNamedNativeQuery("User.isUserExists").setParameter("userMobile", userMobile)
			    	   .setParameter("userPassword", password).list();
				Iterator it = user.iterator();
				int count = (int) it.next();
				if(count != 0)
				{ 
					return true;
				}
		} catch(Exception e) {
			e.printStackTrace();
		}				
		return false;
	}

	@SuppressWarnings({"rawtypes","unchecked"})
	@Override
	@Transactional
	public boolean isUserExists(String mobileNo) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		try {
			
			List<User> user = session.getNamedNativeQuery("User.isUserMobileNoExists").setParameter("userMobile", mobileNo).list();
				Iterator it = user.iterator();
				int count = (int) it.next();
				if(count != 0)
				{ 
					return true;
				}
		} catch(Exception e) {
			e.printStackTrace();
		}				
		return false;
	}

	@SuppressWarnings({"unchecked"})
	@Override
	@Transactional
	public List<User> getUserByName(String userName) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("User.getUserByName").setParameter("userName", userName);
		List<User> userList = query.list();
		return userList;
	}


	@Override
	@Transactional
	public List<User> getAllUserListExceptAdmin() {
	  	Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("User.getUserAllUserListExceptAdmin");
		List<User> userList = query.list();
		return userList;
	}
	
	@SuppressWarnings({"rawtypes","unchecked"})
	@Override
	@Transactional
	public boolean checkValidPin(int transactionPin) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		try {
			
			List<User> user = session.getNamedNativeQuery("User.isValidPin").setParameter("userTransactionPin", transactionPin).list();
				Iterator it = user.iterator();
				int count = (int) it.next();
				if(count != 0)
				{ 
					return true;
				}
		} catch(Exception e) {
			e.printStackTrace();
		}				
		return false;
	}

	@SuppressWarnings({"unchecked"})
	@Override
	@Transactional
	public List<User> getUserByMobile(String userMobile) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("User.getUserByMobile").setParameter("userMobile", userMobile);
		List<User> userList = query.list();
		return userList;
	}

	@SuppressWarnings({"rawtypes","unchecked"})
	@Override
	@Transactional
	public double getUserAccountBalance(int userId) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		double amount = 0;
		try {			
			List<User> user = session.getNamedNativeQuery("User.getUserAccountBalance").setParameter("userId", userId).list();
			Iterator it = user.iterator();
			amount = (double) it.next();	
		} catch(Exception e) {
			e.printStackTrace();
		}				
		return amount;
	}
	
	@Override
	@Transactional
	public List<Role> getAllRoleListExceptAdmin() {
	  	Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("Role.getAllRoleListExceptAdmin");
		List<Role> roleList = query.list();
		return roleList;
	}


	@Override
	@Transactional
	public List<User> getAllUnderUserList(int userId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("User.getUserAllUnderUserList").setParameter("userId", userId);
		List<User> userList = query.list();
		return userList;
	}


	@SuppressWarnings("rawtypes")
	@Override
	@Transactional
	public User updateUser(UserDto user) {
		Session session = this.sessionFactory.getCurrentSession();
		User newUser = new User();
	    try {
	    	String userName = user.getUserName();
			String userPassword = user.getUserPassword();
			int schemeId = user.getSchemeId();
			String userMobile = user.getUserMobile();
			char isActiveUser = user.getIsActiveUser();
			String userArea = user.getUserArea();
			String userAddress = user.getUserAddress();
			String userPancard = user.getUserPancard();
			String userFirmName = user.getUserFirmName();
			Date lastUpdatedDate = new Date();
			int userId = user.getUserId();
	    	Query query = session.createNativeQuery("Update Tbl_User set user_name =:userName,user_password =:userPassword,"
	    			+ "scheme_id =:schemeId,user_mobile =:userMobile,is_active_user =:isActiveUser,user_area =:userArea,"
	    			+ "user_address =:userAddress,user_pancard =:userPancard,user_firm_name =:userFirmName,last_updated_date =:lastUpdatedDate "
	    			+ "where user_id =:userId");
	    	query.setParameter("userId", userId);
	    	query.setParameter("userName", userName);
	    	query.setParameter("userPassword", userPassword);
	    	query.setParameter("schemeId", schemeId);
	    	query.setParameter("userMobile", userMobile);
	    	query.setParameter("isActiveUser", isActiveUser);
	    	query.setParameter("userArea", userArea);
	    	query.setParameter("userAddress", userAddress);
	    	query.setParameter("userPancard", userPancard);
	    	query.setParameter("userFirmName", userFirmName);
	    	query.setParameter("lastUpdatedDate", lastUpdatedDate);
	    	query.executeUpdate();
	    } catch(Exception e) {
	    	e.printStackTrace();
	    }
		return newUser;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public String getUserNameById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("User.getUserNameById").setParameter("userId", id);
		List<User> userList = query.list();
		Iterator it = userList.iterator();
		String userName =  (String) it.next();	
		return userName;
	}


	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	@Transactional
	public double getAmountUnderScheme(int schemeId) {
		Session session = this.sessionFactory.getCurrentSession();
		double amount = 0;
		try {			
			List<Scheme> schemeList = session.getNamedNativeQuery("Scheme.getAmountUnderScheme").setParameter("schemeId", schemeId).list();
			Iterator it = schemeList.iterator();
			amount = (double) it.next();	
		} catch(Exception e) {
			e.printStackTrace();
		}				
		return amount;
	}


	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	@Transactional
	public double getActualAmount(int userId) {
		Session session = this.sessionFactory.getCurrentSession();
		double amount = 0;
		try {			
			List<User> user = session.getNamedNativeQuery("User.getActualAmount").setParameter("userId", userId).list();
			Iterator it = user.iterator();
			amount = (double) it.next();	
		} catch(Exception e) {
			e.printStackTrace();
		}				
		return amount;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	@Transactional
	public int getMasterUserId(int userId) {
		Session session = this.sessionFactory.getCurrentSession();
		int id = 0;
		try {			
			List<User> user = session.getNamedNativeQuery("User.getMasterUserId").setParameter("userId", userId).list();
			Iterator it = user.iterator();
			id = (int) it.next();	
		} catch(Exception e) {
			e.printStackTrace();
		}				
		return id;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	@Transactional
	public int getAdminUser(int userId) {
		Session session = this.sessionFactory.getCurrentSession();
		int id = 0;
		try {			
			List<User> user = session.getNamedNativeQuery("User.getAdminUser").setParameter("userId", userId).list();
			Iterator it = user.iterator();
			id = (int) it.next();	
		} catch(Exception e) {
			e.printStackTrace();
		}				
		return id;
	}
}
