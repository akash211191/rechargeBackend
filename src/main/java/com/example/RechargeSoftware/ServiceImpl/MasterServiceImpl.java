package com.example.RechargeSoftware.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.RechargeSoftware.DaoImpl.MasterDaoImpl;
import com.example.RechargeSoftware.Entity.Commission;
import com.example.RechargeSoftware.Entity.Operator;
import com.example.RechargeSoftware.Entity.RechargeApi;
import com.example.RechargeSoftware.Entity.SMSApi;
import com.example.RechargeSoftware.Entity.Scheme;
import com.example.RechargeSoftware.Entity.User;
import com.example.RechargeSoftware.Service.MasterService;
import com.example.RechargeSoftware.Master.Entity.ServiceInfo;

@Service
public class MasterServiceImpl implements MasterService{

	@Autowired
	MasterDaoImpl masterDao;
	
	@Override
	public Operator saveOperatorInfo(Operator operator) {
		// TODO Auto-generated method stub
		return masterDao.saveOperatorInfo(operator);
	}

	@Override
	public List<ServiceInfo> getAllServiceList() {
		return masterDao.getAllServiceList();
	}

	@Override
	public Iterable<SMSApi> getAllSMSApi() {
		// TODO Auto-generated method stub
		return masterDao.getAllSMSApi();
	}

	@Override
	public Iterable<Operator> getAllOperatorList() {
		// TODO Auto-generated method stub
		return masterDao.getAllOperatorList();
	}
	
	@Override
	public Iterable<Operator> getOperatorListById(int operatorId) {
		// TODO Auto-generated method stub
		return masterDao.getOperatorListById(operatorId);
	}
	
	@Override
	public Iterable<SMSApi> getSMSApiListById(int smsApiId) {
		// TODO Auto-generated method stub
		return masterDao.getSMSApiListById(smsApiId);
	}

	@Override
	public SMSApi addSmsApi(SMSApi smsApi) {
		// TODO Auto-generated method stub
		return masterDao.addSmsApi(smsApi);
	}

	@Override
	public Iterable<RechargeApi> getRechargeApiListById(int rechargeApiId) {
		// TODO Auto-generated method stub
		return masterDao.getRechargeApiListById(rechargeApiId);
	}

	@Override
	public RechargeApi addRechargeApi(RechargeApi rechargeApi) {
		// TODO Auto-generated method stub
		return masterDao.addRechargeApi(rechargeApi);
	}

	@Override
	public Iterable<RechargeApi> getAllRechargeApi() {
		// TODO Auto-generated method stub
		return masterDao.getAllRechargeApi();
	}

	@Override
	public Commission addCommission(Commission commission) {
		// TODO Auto-generated method stub
		return masterDao.addCommission(commission);
	}

	@Override
	public Iterable<Commission> getAllCommission() {
		// TODO Auto-generated method stub
		return masterDao.getAllCommission();
	}

	public boolean checkIfCommissionAlreadyExists(Commission commission) {
		// TODO Auto-generated method stub
		return masterDao.checkIfCommissionAlreadyExists(commission);
	}

	@Override
	public Iterable<Commission> getCommissionListById(int commissionId) {
		// TODO Auto-generated method stub
		return masterDao.getCommissionListById(commissionId);
	}

	public Scheme saveScheme(Scheme scheme) {
		// TODO Auto-generated method stub
		return masterDao.saveScheme(scheme);
	}

	@Override
	public Iterable<Scheme> getAllSchemeList() {
		// TODO Auto-generated method stub
		return masterDao.getAllSchemeList();
	}

	@Override
	public Iterable<Scheme> getSchemeListById(int schemeId) {
		// TODO Auto-generated method stub
		return masterDao.getSchemeListById(schemeId);
	}

	@Override
	public boolean checkIfCommissionAmountExceeded(Commission commission) {
		// TODO Auto-generated method stub
		return masterDao.checkIfCommissionAmountExceeded(commission);
	}

	@Override
	public boolean checkIfCommissionAmountExceededForUpdate(Commission commission) {
		// TODO Auto-generated method stub
		return masterDao.checkIfCommissionAmountExceededForUpdate(commission);
	}

	@Override
	public Iterable<User> creditCommissionToUser(int userId,int operatorId) {
		// TODO Auto-generated method stub
		return masterDao.creditCommissionToUser(userId,operatorId);
	}

	@Override
	public boolean checkIfCommissionConsumedForOperator(Operator operator) {
		// TODO Auto-generated method stub
		return masterDao.checkIfCommissionConsumedForOperator(operator);
	}

	@Override
	public Iterable<Scheme> getSchemeForRole(int roleId) {
		// TODO Auto-generated method stub
		return masterDao.getSchemeForRole(roleId);
	}

	@Override
	public Iterable<Scheme> getSchemeUnderRole(int roleId) {
		// TODO Auto-generated method stub
		return masterDao.getSchemeUnderRole(roleId);
	}
	
	
}
