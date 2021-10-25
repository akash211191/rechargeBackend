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
	@NamedNativeQuery(name = "RechargeApi.getAllRechargeApiList", query = "select * from Tbl_Recharge_Api"),
	@NamedNativeQuery(name = "RechargeApi.getRechargeApiListById", query = "select * from Tbl_Recharge_Api where recharge_api_id =:rechargeApiId")
})

@Entity
@Table(name = "Tbl_Recharge_Api")
public class RechargeApi {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "recharge_api_id")
	int rechargeApiId;
	
	@Column(name = "recharge_api_name")
	String rechargeApiName;
	
	@Column(name = "recharge_api_password")
	String rechargeApiPassword;
	
	@Column(name = "recharge_username")
	String rechargeApiUsername;
	
	@Column(name = "status")
	char status;
	
	@Column(name = "is_default")
	char isDefault;
	
	@Column(name = "created_date")
	Date createdDate;

	public int getRechargeApiId() {
		return rechargeApiId;
	}

	public void setRechargeApiId(int rechargeApiId) {
		this.rechargeApiId = rechargeApiId;
	}

	public String getRechargeApiName() {
		return rechargeApiName;
	}

	public void setRechargeApiName(String rechargeApiName) {
		this.rechargeApiName = rechargeApiName;
	}

	public String getRechargeApiPassword() {
		return rechargeApiPassword;
	}

	public void setRechargeApiPassword(String rechargeApiPassword) {
		this.rechargeApiPassword = rechargeApiPassword;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public char getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(char isDefault) {
		this.isDefault = isDefault;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getRechargeApiUsername() {
		return rechargeApiUsername;
	}

	public void setRechargeApiUsername(String rechargeApiUsername) {
		this.rechargeApiUsername = rechargeApiUsername;
	}


}