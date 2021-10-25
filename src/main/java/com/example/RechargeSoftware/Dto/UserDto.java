package com.example.RechargeSoftware.Dto;

import java.util.Date;

public class UserDto {
private int userId;
	
	private String userName;
	private String userLastName;
	private String userEmail;
	private String userMobile;
	private String userPassword;
	private char isActiveUser;
	private int firstTimeOtp; 
	private char isFirstLogin;
	private String userAddress;
	private String userUniqueId;
	private Date createdDate;
	private Date lastUpdatedDate;
	private int underUserId;
	private String userFirmName;
	private String userArea;
	private String userPancard;
	private Date expiryDate;
	private int schemeId;
	private int roleId;
	private String schemeName;
	
	
	
	public String getSchemeName() {
		return schemeName;
	}
	public void setSchemeName(String schemeName) {
		this.schemeName = schemeName;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
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
	public String getUserLastName() {
		return userLastName;
	}
	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
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
	public int getUnderUserId() {
		return underUserId;
	}
	public void setUnderUserId(int underUserId) {
		this.underUserId = underUserId;
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
	public int getSchemeId() {
		return schemeId;
	}
	public void setSchemeId(int schemeId) {
		this.schemeId = schemeId;
	}
	
	

}
