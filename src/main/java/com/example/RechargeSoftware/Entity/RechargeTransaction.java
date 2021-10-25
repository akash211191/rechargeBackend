package com.example.RechargeSoftware.Entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Tbl_Recharge_Transaction")
public class RechargeTransaction {

	@Id
	@Column(name="recharge_transaction_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int rechargeTransactionId;
	
	@Column(name="mobile_number")
	private String mobileNumber;
	
	@Column(name = "recharge_amount")
	private double rechargeAmount;
	
	@Column(name = "operator_id")
	private int operatorId;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "status")
	private char status;
	
	@Column(name = "recharge_date")
	private Date rechargeDate;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "recharge_api_id")
	private int rechargeApiId;
	
	@Column(name = "api_transaction_id")
	private int apiTransactionId;
	
	@Column(name = "op_id")
	private String opId;
	
	
	public int getApiTransactionId() {
		return apiTransactionId;
	}

	public void setApiTransactionId(int apiTransactionId) {
		this.apiTransactionId = apiTransactionId;
	}

	public String getOpId() {
		return opId;
	}

	public void setOpId(String opId) {
		this.opId = opId;
	}

	public int getRechargeApiId() {
		return rechargeApiId;
	}

	public void setRechargeApiId(int rechargeApiId) {
		this.rechargeApiId = rechargeApiId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getRechargeTransactionId() {
		return rechargeTransactionId;
	}

	public void setRechargeTransactionId(int rechargeTransactionId) {
		this.rechargeTransactionId = rechargeTransactionId;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public double getRechargeAmount() {
		return rechargeAmount;
	}

	public void setRechargeAmount(double rechargeAmount) {
		this.rechargeAmount = rechargeAmount;
	}

	public int getOperatorId() {
		return operatorId;
	}

	public void setOperatorId(int operatorId) {
		this.operatorId = operatorId;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public Date getRechargeDate() {
		return rechargeDate;
	}

	public void setRechargeDate(Date rechargeDate) {
		this.rechargeDate = rechargeDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
}
