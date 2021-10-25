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
	@NamedNativeQuery(name = "BalanceInfo.getUserPassbook", 
			         query = "select t2.balance_id as passbook_id," + 
			         		"	   t2.transaction_type," + 
			         		"	   t2.previous_balance," + 
			         		"	   t2.amount," + 
			         		"	   (t2.previous_balance + t2.amount) as new_balance," + 
			         		"	   t2.description," + 
			         		"	   t2.created_date from " + 
			         		" (select t.balance_id," + 
			         		"		t.transaction_type,	" + 
			         		" (select COALESCE(sum(virtual_balance),0) from Tbl_Balance_Info t1 where t1.created_date < t.created_date and t1.user_id =:userId) as previous_balance, " +
			         	    " (t.virtual_balance) as amount, " +
			         		"	   t.description," + 
			         		"	   t.created_date" + 
			         		" from Tbl_Balance_Info t where t.user_id =:userId" + 
			         		" ) t2" + 
			         		" where t2.amount != 0 order by t2.created_date desc"),
	
	@NamedNativeQuery(name = "BalanceInfo.getAdminUserPassbook", 
    query = "select t2.balance_id as passbook_id," + 
    		"	   t2.transaction_type," + 
    		"	   t2.previous_balance," + 
    		"	   t2.amount," + 
    		"	   (t2.previous_balance + t2.amount) as new_balance," + 
    		"	   t2.description," + 
    		"	   t2.created_date from " + 
    		" (select t.balance_id," + 
    		"		t.transaction_type,	" + 
    		" (select COALESCE(sum(amount),0) from Tbl_Balance_Info t1 where t1.created_date < t.created_date and t1.user_id =:userId) as previous_balance, " +
    	    " (t.amount) as amount, " +
    		"	   t.description," + 
    		"	   t.created_date" + 
    		" from Tbl_Balance_Info t where t.user_id =:userId" + 
    		" ) t2" + 
    		" where t2.amount != 0 order by t2.created_date desc"),
	
	@NamedNativeQuery(name = "BalanceInfo.rechargeReport", 
    query = " select " + 
    		"	   rt.recharge_transaction_id," + 
    		"	  u.user_name," + 
    		"	   u.user_last_name," + 
    		"	   u.user_mobile," + 
    		"	   rt.mobile_number," + 
    		"	   o.operator_name," + 
    		"	   rt.recharge_amount," + 
    		"	   ra.recharge_api_name," + 
    		"	   rt.recharge_date," + 
    		"	   rt.api_transaction_id," + 
    		"	   rt.op_id," + 
    		"	   rt.status," + 
    		"	  (t2.previous_balance +t2.virtual_balance) as new_balance" + 
    		"			from     		 (select (select COALESCE(sum(virtual_balance),0) from Tbl_Balance_Info t1 " + 
    		"							 where t1.created_date < t.created_date and t1.user_id =:userId) as previous_balance,  " + 
    		"			         	     (t.virtual_balance) as virtual_balance, " + 
    		"			         			   t.created_date," + 
    		"								   t.recharge_transaction_id" + 
    		"			         		 from Tbl_Balance_Info t where t.user_id =:userId" + 
    		"			         		 ) t2 join Tbl_Recharge_Transaction rt on rt.recharge_transaction_id = t2.recharge_transaction_id" + 
    		"                                  join Tbl_User u on u.user_id = rt.user_id" + 
    		"	   join Tbl_Operator o on o.operator_id = rt.operator_id" + 
    		"	   join Tbl_Recharge_Api ra on ra.recharge_api_id = rt.recharge_api_id  " + 
    		"			         		 order by t2.created_date desc"),

	@NamedNativeQuery(name = "BalanceInfo.allRechargeReport", 
    query = " select " + 
    		"	   rt.recharge_transaction_id," + 
    		"	  u.user_name," + 
    		"	   u.user_last_name," + 
    		"	   u.user_mobile," + 
    		"	   rt.mobile_number," + 
    		"	   o.operator_name," + 
    		"	   rt.recharge_amount," + 
    		"	   ra.recharge_api_name," + 
    		"	   rt.recharge_date," + 
    		"	   rt.api_transaction_id," + 
    		"	   rt.op_id," + 
    		"	   rt.status," + 
    		"	  (t2.previous_balance + t2.virtual_balance) as new_balance" + 
    		"			from     		 (select (select COALESCE(sum(virtual_balance),0) from Tbl_Balance_Info t1 " + 
    		"							 where t1.created_date < t.created_date and t1.user_id = t.user_id) as previous_balance,  " + 
    		"			         	     (t.virtual_balance) as virtual_balance, " + 
    		"			         			   t.created_date," + 
    		"								   t.recharge_transaction_id" + 
    		"			         		 from Tbl_Balance_Info t" + 
    		"			         		 ) t2 join Tbl_Recharge_Transaction rt on rt.recharge_transaction_id = t2.recharge_transaction_id" + 
    		"                                  join Tbl_User u on u.user_id = rt.user_id" + 
    		"	   join Tbl_Operator o on o.operator_id = rt.operator_id" + 
    		"	   join Tbl_Recharge_Api ra on ra.recharge_api_id = rt.recharge_api_id  " + 
    		"			         		 order by t2.created_date desc"),
})

@Entity
@Table(name = "Tbl_Balance_Info")
public class BalanceInfo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int balanceId; 
	
	@Column(name = "user_Id")
	private int userId;
	
	@Column(name = "amount")
	private double amount;
	
	@Column(name = "virtual_balance")
	private double virtualBalance;
	
	@Column(name = "minimum_amount")
	private double minAmount;
	
	@Column(name = "transaction_type")
	private String transactionType;
	
	@Column(name = "created_date")
	private Date createdDate;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "from_user_id")
	private int fromUserId;
	
	@Column(name = "recharge_transaction_id")
	private int rechargeTransactionId;
	
	
	public int getRechargeTransactionId() {
		return rechargeTransactionId;
	}

	public void setRechargeTransactionId(int rechargeTransactionId) {
		this.rechargeTransactionId = rechargeTransactionId;
	}

	public int getFromUserId() {
		return fromUserId;
	}

	public void setFromUserId(int fromUserId) {
		this.fromUserId = fromUserId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getBalanceId() {
		return balanceId;
	}

	public void setBalanceId(int balanceId) {
		this.balanceId = balanceId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public double getMinAmount() {
		return minAmount;
	}

	public void setMinAmount(double minAmount) {
		this.minAmount = minAmount;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public double getVirtualBalance() {
		return virtualBalance;
	}

	public void setVirtualBalance(double virtualBalance) {
		this.virtualBalance = virtualBalance;
	}

	
}


