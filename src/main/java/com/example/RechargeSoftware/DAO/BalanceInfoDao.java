package com.example.RechargeSoftware.DAO;

import com.example.RechargeSoftware.Dto.UserTransactionDto;
import com.example.RechargeSoftware.Entity.BalanceInfo;
import com.example.RechargeSoftware.Entity.RechargeTransaction;

public interface BalanceInfoDao {
	BalanceInfo saveUserTransaction(UserTransactionDto userTransactionDto);
	public RechargeTransaction saveRechargeTransaction(RechargeTransaction rechargeTransaction);
	public Iterable<BalanceInfo> getUserPassbook(int userId);
	public Iterable<RechargeTransaction> getRechargeReport(int userId);
	public Iterable<RechargeTransaction> getAllRechargeReport();
}
