package com.example.RechargeSoftware.Dto;

public class UserTransactionDto {
	
	
	private int userId;
	private double userAmount;
	private int userPin;
	String transactionType;
	private int sessionUserId;
	String description;
	String userName;
	private double virtualBalance;
	private int fromUserId;
	private int toUserId;
	private int rechargeTransactionId;
	private int rechargeApiId;
	
	
	
	
	public int getRechargeTransactionId() {
		return rechargeTransactionId;
	}
	public void setRechargeTransactionId(int rechargeTransactionId) {
		this.rechargeTransactionId = rechargeTransactionId;
	}
	public int getRechargeApiId() {
		return rechargeApiId;
	}
	public void setRechargeApiId(int rechargeApiId) {
		this.rechargeApiId = rechargeApiId;
	}
	public int getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(int fromUserId) {
		this.fromUserId = fromUserId;
	}
	public int getToUserId() {
		return toUserId;
	}
	public void setToUserId(int toUserId) {
		this.toUserId = toUserId;
	}
	public double getVirtualBalance() {
		return virtualBalance;
	}
	public void setVirtualBalance(double virtualBalance) {
		this.virtualBalance = virtualBalance;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getSessionUserId() {
		return sessionUserId;
	}
	public void setSessionUserId(int sessionUserId) {
		this.sessionUserId = sessionUserId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public double getUserAmount() {
		return userAmount;
	}
	public void setUserAmount(double userAmount) {
		this.userAmount = userAmount;
	}
	public int getUserPin() {
		return userPin;
	}
	public void setUserPin(int userPin) {
		this.userPin = userPin;
	}
	public String getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	
	

}
