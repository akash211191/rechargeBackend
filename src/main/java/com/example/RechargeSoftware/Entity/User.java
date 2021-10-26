package com.example.RechargeSoftware.Entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.NamedNativeQueries;
import org.hibernate.annotations.NamedNativeQuery;

@NamedNativeQueries({
	@NamedNativeQuery(name = "User.isUserExists", query = "select count(*) from Tbl_User where user_mobile = :userMobile "
			+ "and user_password = :userPassword"),
	@NamedNativeQuery(name = "User.isUserMobileNoExists", query = "select count(*) from Tbl_User where user_mobile = :userMobile"),
	@NamedNativeQuery(name = "User.getUserByName", query = "select * from Tbl_User where user_name = :userName"),
	@NamedNativeQuery(name = "User.getUserAllUserListExceptAdmin",
					  query = "select u.user_id,u.user_name,u.user_mobile,u.user_password,r.role_name " + 
					  		"  ,u.created_date,u.last_updated_date,u.is_active_user,au.user_mobile  as adminUser,s.scheme_name,COALESCE(sum(amount+virtual_balance), '0.00') as balance" + 
					  		"	from Tbl_User u join Tbl_User_Role_Mapper urm on urm.user_id = u.user_id " + 
					  		"	join Tbl_Role r on r.role_id = urm.role_id "
					  		+ " join Tbl_User au on au.user_id = u.under_user_id "
					  		+ " join Tbl_Scheme s on s.scheme_id = u.scheme_id "
					  		+ " left join Tbl_Balance_Info b on b.user_id = u.user_id"
					  		+ " where r.role_id =:roleId "  
					  		+ " group by u.user_id,u.user_name,u.user_mobile,u.user_password,r.role_name,u.created_date,u.last_updated_date,u.is_active_user,au.user_mobile,s.scheme_name"),
	@NamedNativeQuery(name = "User.getUserAllUnderUserList",
	  query = "select u.user_id,u.user_name,u.user_mobile,u.user_password,r.role_name " + 
	  		"  ,u.created_date,u.last_updated_date,u.is_active_user,au.user_mobile  as adminUser,s.scheme_name,COALESCE(sum(amount+virtual_balance), '0.00') as balance,"
	  		+ "u.user_area,u.user_address,u.user_pancard,convert(varchar, u.expiry_date, 1) as expiryDate,u.user_firm_name,r.role_id,s.scheme_id,u.unique_user_id " + 
	  		"	from Tbl_User u join Tbl_User_Role_Mapper urm on urm.user_id = u.user_id " + 
	  		"	join Tbl_Role r on r.role_id = urm.role_id "
	  		+ " join Tbl_User au on au.user_id = u.under_user_id "
	  		+ " join Tbl_Scheme s on s.scheme_id = u.scheme_id "
	  		+ " left join Tbl_Balance_Info b on b.user_id = u.user_id"
	  		+ " where u.under_user_id =:userId"  
	  		+ " group by u.user_id,u.user_name,u.user_mobile,u.user_password,r.role_name,u.created_date,u.last_updated_date,u.is_active_user"
	  		+ ",au.user_mobile,s.scheme_name,u.user_area,u.user_address,u.expiry_date,u.user_pancard,u.user_firm_name,r.role_id,s.scheme_id,u.unique_user_id"),
	@NamedNativeQuery(name = "User.isValidPin", query = "select count(*) from Tbl_User where user_transaction_pin = :userTransactionPin "),
	@NamedNativeQuery(name = "User.getUserByMobile", query = "select  u.user_id,u.user_name,r.role_id,r.role_name from Tbl_User u" + 
			"	join Tbl_User_Role_Mapper urm on u.user_id = urm.user_id" + 
			"	join Tbl_Role r on r.role_id = urm.role_id" + 
			"	where u.user_mobile = :userMobile"),
	@NamedNativeQuery(name = "User.getUserAccountBalance", query = "select COALESCE(sum(virtual_balance), '0.00') from Tbl_Balance_Info where user_id =:userId"),
	@NamedNativeQuery(name = "User.getAdminUserAccountBalance", query = "select COALESCE(sum(amount), '0.00') from Tbl_Balance_Info where user_id =:userId"),
	@NamedNativeQuery(name = "User.creditCommissionToUser", query = "with res1 as (select user_id,"  
						+ " under_user_id," 
						+ "	scheme_id"
						+ "	from Tbl_User where user_id =:userId" 
						+ "	union all " 
						+ "	select child.user_id," 
						+ "	  child.under_user_id,"  
						+ "	  child.scheme_id"  
						+ "	  from Tbl_User child , res1 r1 " 
						+ "	  where child.user_id = r1.under_user_id " 
						+ "		)" 
						+ "select r1.user_id,COALESCE(s.commission_amount, '0') from res1 r1 left join "  
						+ "Tbl_Commission s on r1.scheme_id = s.scheme_id and operator_id =:operatorId"),
	
	@NamedNativeQuery(name = "User.getUserById",
	  query = "select u.user_id,u.user_name,u.user_mobile,u.user_password,r.role_name " + 
	  		"  ,u.created_date,u.last_updated_date,u.is_active_user,au.user_mobile  as adminUser,s.scheme_name,COALESCE(sum(amount+virtual_balance), '0.00') as balance,"
	  		+ "u.user_area,u.user_address,u.user_pancard,convert(varchar, u.expiry_date, 1) as expiryDate,u.user_firm_name,r.role_id,s.scheme_id,u.unique_user_id,"
	  		+ "COALESCE(sum(amount), '0.00') as mainbalance,"
	  		+ "COALESCE(sum(virtual_balance), '0.00') as virtualbalance " + 
	  		"	from Tbl_User u join Tbl_User_Role_Mapper urm on urm.user_id = u.user_id " + 
	  		"	join Tbl_Role r on r.role_id = urm.role_id "
	  		+ " join Tbl_User au on au.user_id = u.under_user_id "
	  		+ " join Tbl_Scheme s on s.scheme_id = u.scheme_id "
	  		+ " left join Tbl_Balance_Info b on b.user_id = u.user_id"
	  		+ " where u.user_id =:userId"  
	  		+ " group by u.user_id,u.user_name,u.user_mobile,u.user_password,r.role_name,u.created_date,u.last_updated_date,u.is_active_user"
	  		+ ",au.user_mobile,s.scheme_name,u.user_area,u.user_address,u.expiry_date,u.user_pancard,u.user_firm_name,r.role_id,s.scheme_id,u.unique_user_id"),
	@NamedNativeQuery(name = "User.getUserNameById",
	  query = "select u.user_name from Tbl_User u where u.user_id =:userId"),
	@NamedNativeQuery(name = "User.getActualAmount",
	  query = "with res1 as ( " + 
	  		"select user_id," + 
	  		"      user_name," + 
	  		"	   under_user_id," + 
	  		"	   scheme_id" + 
	  		"	   from Tbl_User where user_id =:userId" + 
	  		"	   union all " + 
	  		"	   select child.user_id ," + 
	  		"	          child.user_name," + 
	  		"			  child.under_user_id," + 
	  		"			  child.scheme_id" + 
	  		"			  from Tbl_User child , res1 r1 " + 
	  		"		where child.user_id = r1.under_user_id " + 
	  		"		)" + 
	  		"select COALESCE(sum(amount), '0.00') from res1 r " + 
	  		"join Tbl_Balance_Info b on b.user_id = r.user_id " + 
	  		"where r.scheme_id = 1"),
	@NamedNativeQuery(name = "User.getMasterUserId",
	  query = "with res1 as ( " + 
	  		"select user_id," + 
	  		"      user_name," + 
	  		"	   under_user_id," + 
	  		"	   scheme_id" + 
	  		"	   from Tbl_User where user_id =:userId" + 
	  		"	   union all " + 
	  		"	   select child.user_id ," + 
	  		"	          child.user_name," + 
	  		"			  child.under_user_id," + 
	  		"			  child.scheme_id" + 
	  		"			  from Tbl_User child , res1 r1 " + 
	  		"		where child.user_id = r1.under_user_id " + 
	  		"		)" + 
	  		"select distinct(r.user_id) from res1 r " + 
	  		"join Tbl_Balance_Info b on b.user_id = r.user_id " + 
	  		"where r.scheme_id = 1"),
	
	@NamedNativeQuery(name = "User.getAdminUser",
	  query = "with res1 as ( " + 
	  		"select user_id," + 
	  		"      user_name," + 
	  		"	   under_user_id," + 
	  		"	   scheme_id" + 
	  		"	   from Tbl_User where user_id =:userId" + 
	  		"	   union all " + 
	  		"	   select child.user_id ," + 
	  		"	          child.user_name," + 
	  		"			  child.under_user_id," + 
	  		"			  child.scheme_id" + 
	  		"			  from Tbl_User child , res1 r1 " + 
	  		"		where child.user_id = r1.under_user_id " + 
	  		"		)" + 
	  		"select distinct(r.user_id) from res1 r " + 
	  		"join Tbl_Balance_Info b on b.user_id = r.user_id " + 
	  		"where r.scheme_id = 6"),
	
	@NamedNativeQuery(name = "User.getAdminPin",
	  query = "select u.user_transaction_pin from Tbl_User u where u.user_mobile =:userMobile"),
})


@Entity
@Table(name = "Tbl_User")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "user_id")
	private int userId;
	
	@Column(name="user_name")
	private String userName;
	
	@Column(name="user_last_name")
	private String userLastName;
	
	@Column(name="user_email")
	private String userEmail;
	
	@Column(name="user_mobile")
	private String userMobile;
	
	@Column(name="user_password") 
	private String userPassword;
	
	@Column(name="is_active_user") 
	private char isActiveUser;
	
	@Column(name="first_time_otp")
	private int firstTimeOtp; 
	
	@Column(name="is_first_login") 
	private char isFirstLogin;
	
	@Column(name = "user_address")
	private String userAddress;

	@Column(name = "unique_user_id")
	private String userUniqueId;
	
	@Column(name = "created_date")
	private Date createdDate;
	
	@Column(name = "last_updated_date")
	private Date lastUpdatedDate;
	
	@Column(name = "under_user_id")
	private int underUserId;
	
	@Column(name = "user_firm_name")
	private String userFirmName;
	
	@Column(name = "user_area")
	private String userArea;
	
	@Column(name = "user_pancard")
	private String userPancard;
	
	@Column(name = "expiry_date")
	private Date expiryDate;
	
	@Column(name = "scheme_id")
	private int schemeId;
	
	
	public int getSchemeId() {
		return schemeId;
	}


	public void setSchemeId(int schemeId) {
		this.schemeId = schemeId;
	}


	public int getUnderUserId() {
		return underUserId;
	}

	
	public String getUserFirmName() {
		return userFirmName;
	}


	public void setUserFirmName(String userFirmName) {
		this.userFirmName = userFirmName;
	}


	public String getUserArea() {
		return userArea;
	}


	public void setUserArea(String userArea) {
		this.userArea = userArea;
	}


	public String getUserPancard() {
		return userPancard;
	}


	public void setUserPancard(String userPancard) {
		this.userPancard = userPancard;
	}


	public Date getExpiryDate() {
		return expiryDate;
	}


	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}


	public void setUnderUserId(int underUserId) {
		this.underUserId = underUserId;
	}

	public String getUserUniqueId() {
		return userUniqueId;
	}

	public void setUserUniqueId(String userUniqueId) {
		this.userUniqueId = userUniqueId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getLastUpdatedDate() {
		return lastUpdatedDate;
	}

	public void setLastUpdatedDate(Date lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}

	public User() {
		super();
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public char getIsActiveUser() {
		return isActiveUser;
	}

	public void setIsActiveUser(char isActiveUser) {
		this.isActiveUser = isActiveUser;
	}

	public int getFirstTimeOtp() {
		return firstTimeOtp;
	}

	public void setFirstTimeOtp(int firstTimeOtp) {
		this.firstTimeOtp = firstTimeOtp;
	}

	public char getIsFirstLogin() {
		return isFirstLogin;
	}

	public void setIsFirstLogin(char isFirstLogin) {
		this.isFirstLogin = isFirstLogin;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserLastName() {
		return userLastName;
	}

	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}
	
	

}
