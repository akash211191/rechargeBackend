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
	@NamedNativeQuery(name = "SMSApi.getAllSMSApiList", query = "select * from Tbl_SMS_Api"),
	@NamedNativeQuery(name = "SMSApi.getSMSApiListById", query = "select * from Tbl_SMS_Api where sms_api_id =:smsApiId")
})

@Entity
@Table(name = "Tbl_SMS_Api")
public class SMSApi {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "sms_api_id")
	int smsApiId;
	
	@Column(name = "sms_api_name")
	String smsApiName;
	
	@Column(name = "sms_url_name")
	String smsUrlName;
	
	@Column(name = "sms_api_password")
	String smsApiPassword;
	
	@Column(name = "status")
	char status;
	
	@Column(name = "is_default")
	char isDefault;
	
	@Column(name = "sender_id")
	String senderId;
	
	@Column(name = "created_date")
	Date createdDate;

	public int getSmsApiId() {
		return smsApiId;
	}

	public void setSmsApiId(int smsApiId) {
		this.smsApiId = smsApiId;
	}

	public String getSmsApiName() {
		return smsApiName;
	}

	public void setSmsApiName(String smsApiName) {
		this.smsApiName = smsApiName;
	}

	public String getSmsApiPassword() {
		return smsApiPassword;
	}

	public void setSmsApiPassword(String smsApiPassword) {
		this.smsApiPassword = smsApiPassword;
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

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getSmsUrlName() {
		return smsUrlName;
	}

	public void setSmsUrlName(String smsUrlName) {
		this.smsUrlName = smsUrlName;
	}


}