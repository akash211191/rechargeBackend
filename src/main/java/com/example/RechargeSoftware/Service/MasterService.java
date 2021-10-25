package com.example.RechargeSoftware.Service;

import java.util.List;

import com.example.RechargeSoftware.Entity.Commission;
import com.example.RechargeSoftware.Entity.Operator;
import com.example.RechargeSoftware.Entity.RechargeApi;
import com.example.RechargeSoftware.Entity.SMSApi;
import com.example.RechargeSoftware.Entity.Scheme;
import com.example.RechargeSoftware.Entity.User;
import com.example.RechargeSoftware.Master.Entity.ServiceInfo;

public interface MasterService {
	public Operator saveOperatorInfo(Operator operator);
	public List<ServiceInfo> getAllServiceList();
	public Iterable<SMSApi> getAllSMSApi();
	public Iterable<Operator> getAllOperatorList();
	public Iterable<Operator> getOperatorListById(int operatorId);
	public Iterable<SMSApi> getSMSApiListById(int smsApiId);
	public SMSApi addSmsApi(SMSApi smsApi);
	public Iterable<RechargeApi> getRechargeApiListById(int rechargeApiId);
	public RechargeApi addRechargeApi(RechargeApi rechargeApi);
	public Iterable<RechargeApi> getAllRechargeApi();
	public Commission addCommission(Commission commission);
	public Iterable<Commission> getAllCommission();
	public boolean checkIfCommissionAlreadyExists(Commission commission);
	public Iterable<Commission> getCommissionListById(int commissionId);
	public Scheme saveScheme(Scheme scheme);		
	public Iterable<Scheme> getAllSchemeList();
	public Iterable<Scheme> getSchemeListById(int schemeId);
	public boolean checkIfCommissionAmountExceeded(Commission commission);
	public boolean checkIfCommissionAmountExceededForUpdate(Commission commission);
	public Iterable<User> creditCommissionToUser(int userId,int operatorId);
	public boolean checkIfCommissionConsumedForOperator(Operator operator);
	public Iterable<Scheme> getSchemeForRole(int roleId);
	public Iterable<Scheme> getSchemeUnderRole(int roleId);
}
