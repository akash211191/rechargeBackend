package com.example.RechargeSoftware.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.RechargeSoftware.DaoImpl.BalanceInfoDaoImpl;
import com.example.RechargeSoftware.Dto.UserTransactionDto;
import com.example.RechargeSoftware.Entity.BalanceInfo;
import com.example.RechargeSoftware.Entity.RechargeTransaction;
import com.example.RechargeSoftware.Service.BalanceService;

@Service
public class BalanceServiceImpl implements BalanceService{
	
	@Autowired
	BalanceInfoDaoImpl balanceInfoDaoImpl;

	@Override
	public BalanceInfo saveUserTransaction(UserTransactionDto userTransactionDto) {
		// TODO Auto-generated method stub
		return balanceInfoDaoImpl.saveUserTransaction(userTransactionDto);
	}

	@Override
	public RechargeTransaction saveRechargeTransaction(RechargeTransaction rechargeTransaction) {
		// TODO Auto-generated method stub
		return balanceInfoDaoImpl.saveRechargeTransaction(rechargeTransaction);
	}

	@Override
	public Iterable<BalanceInfo> getUserPassbook(int userId) {
		// TODO Auto-generated method stub
		return balanceInfoDaoImpl.getUserPassbook(userId);
	}

	@Override
	public Iterable<RechargeTransaction> getRechargeReport(int userId) {
		// TODO Auto-generated method stub
		return balanceInfoDaoImpl.getRechargeReport(userId);
	}

	@Override
	public Iterable<RechargeTransaction> getAllRechargeReport() {
		// TODO Auto-generated method stub
		return balanceInfoDaoImpl.getAllRechargeReport();
	}

}
