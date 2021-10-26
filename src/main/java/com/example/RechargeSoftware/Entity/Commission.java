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
	@NamedNativeQuery(name = "Commission.getAllCommission", 
			          query = "select c.commission_id,o.operator_id,o.operator_name"
						+ ",rai.recharge_api_id,rai.recharge_api_name,s.scheme_id,scheme_name,commission_amount " + 
						"from " + 
						"Tbl_Commission c join Tbl_Operator o on c.operator_id = o.operator_id " + 
						"join Tbl_Recharge_Api rai on rai.recharge_api_id = c.recharge_api_id " + 
						"join Tbl_Scheme s on s.scheme_id = c.scheme_id "
						+ "where c.operator_id =:operatorId"),	
	
	@NamedNativeQuery(name = "Commission.getCommissionListById", 
    query = "select c.commission_id,o.operator_id,o.operator_name"
		+ ",rai.recharge_api_id,rai.recharge_api_name,s.scheme_id,s.scheme_name,commission_amount " + 
		"from " + 
		"Tbl_Commission c join Tbl_Operator o on c.operator_id = o.operator_id " + 
		"join Tbl_Recharge_Api rai on rai.recharge_api_id = c.recharge_api_id " + 
		"join Tbl_Scheme s on s.scheme_id = c.scheme_id  where commission_id =:commissionId "),
	
	@NamedNativeQuery(name = "Commission.checkIfCommissionAlreadyExists",   
	                  query = "select count(*) from Tbl_Commission where operator_id =:operatorId and recharge_api_id =:rechargeApiId "
	                  		+ "and scheme_id =:schemeId"),	
	
	@NamedNativeQuery(name = "Commission.totalCommissionConsumedforOperator",   
    query = "select COALESCE(sum(commission_amount),'0') from Tbl_Commission where operator_id =:operatorId "),

	@NamedNativeQuery(name = "Commission.totalCommissionConsumedforOperatorExceptAdmin",   
    query = "select COALESCE(sum(commission_amount),'0') from Tbl_Commission where operator_id =:operatorId and scheme_id != 6"),

	
	@NamedNativeQuery(name = "Commission.getCurrentCommissionAssignedScheme",   
    query = "select COALESCE(sum(commission_amount),'0') from Tbl_Commission where operator_id =:operatorId and scheme_id =:schemeId")
})

@Entity
@Table(name = "Tbl_Commission")
public class Commission {
 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "commission_id")
	int commissionId;
	
	@Column(name = "operator_id")
	int operatorId;
	
	@Column(name = "recharge_api_id")
	int rechargeApiId;
	
	@Column(name = "role_id")
	int roleId;
	
	@Column(name = "scheme_id")
	int schemeId;
	
	@Column(name = "commission_amount")
	double commissionAmount;
	
	@Column(name = "created_date")
	Date createdDate;
	
	@Column(name = "status")
	char status;

	public int getCommissionId() {
		return commissionId;
	}

	public void setCommissionId(int commissionId) {
		this.commissionId = commissionId;
	}

	public int getOperatorId() {
		return operatorId;
	}

	public void setOperatorId(int operatorId) {
		this.operatorId = operatorId;
	}

	public double getCommissionAmount() {
		return commissionAmount;
	}

	public void setCommissionAmount(double commissionAmount) {
		this.commissionAmount = commissionAmount;
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

	public int getRechargeApiId() {
		return rechargeApiId;
	}

	public void setRechargeApiId(int rechargeApiId) {
		this.rechargeApiId = rechargeApiId;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getSchemeId() {
		return schemeId;
	}

	public void setSchemeId(int schemeId) {
		this.schemeId = schemeId;
	}

	
}
