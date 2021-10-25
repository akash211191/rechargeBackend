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
	@NamedNativeQuery(name = "Operator.getAllOperatorList", query = "select o.*,s.service_name from Tbl_Operator o "
			+ "join Tbl_Service s on o.service_id = s.service_id"),
	@NamedNativeQuery(name = "Operator.getOperatorListById", query = "select o.*,s.service_name from Tbl_Operator o "
			+ "join Tbl_Service s on o.service_id = s.service_id where operator_id =:operatorId"),
	@NamedNativeQuery(name = "Operator.getAdminCommissionForOperator",   
    query = "select admin_commission from Tbl_Operator where operator_id =:operatorId")
})


@Entity
@Table(name = "Tbl_Operator")
public class Operator {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="operator_id")
	int operatorId;
	
	@Column(name = "service_id")
	int serviceId;
	
	@Column(name = "operator_name")
	String operatorName;
	
	@Column(name = "admin_commission")
	double adminCommission;
	
	@Column(name = "sms_code")
	String smsCode;
	
	@Column(name = "minimum_recharge_amount")
	double minimumRechargeAmount;
	
	@Column(name = "maximum_recharge_amount")
	double maximumRechargeAmount;
	
	@Column(name = "created_date")
	Date createdDate;
	
	@Column(name = "status")
	char status;

	public int getOperatorId() {
		return operatorId;
	}

	public void setOperatorId(int operatorId) {
		this.operatorId = operatorId;
	}

	public int getServiceId() {
		return serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	public String getOperatorName() {
		return operatorName;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

	public double getAdminCommission() {
		return adminCommission;
	}

	public void setAdminCommission(double adminCommission) {
		this.adminCommission = adminCommission;
	}

	public String getSmsCode() {
		return smsCode;
	}

	public void setSmsCode(String smsCode) {
		this.smsCode = smsCode;
	}

	public double getMinimumRechargeAmount() {
		return minimumRechargeAmount;
	}

	public void setMinimumRechargeAmount(double minimumRechargeAmount) {
		this.minimumRechargeAmount = minimumRechargeAmount;
	}

	public double getMaximumRechargeAmount() {
		return maximumRechargeAmount;
	}

	public void setMaximumRechargeAmount(double maximumRechargeAmount) {
		this.maximumRechargeAmount = maximumRechargeAmount;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}
	
	
}