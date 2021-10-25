package com.example.RechargeSoftware.DaoImpl;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.RechargeSoftware.DAO.BalanceInfoDao;
import com.example.RechargeSoftware.Dto.UserTransactionDto;
import com.example.RechargeSoftware.Entity.BalanceInfo;
import com.example.RechargeSoftware.Entity.RechargeTransaction;

@Configuration
@Repository
public class BalanceInfoDaoImpl implements BalanceInfoDao{
	@Autowired 
	SessionFactory sessionFactory;
	
	
	@Override
	@Transactional
	public BalanceInfo saveUserTransaction(UserTransactionDto userTransactionDto) {
		
		// TODO Auto-generated method stub
		BalanceInfo balanceInfo = new BalanceInfo();
		try {
			Session session = this.sessionFactory.getCurrentSession();			
			balanceInfo.setUserId(userTransactionDto.getUserId());
			balanceInfo.setAmount(userTransactionDto.getUserAmount());
			balanceInfo.setMinAmount(0);
			balanceInfo.setTransactionType(userTransactionDto.getTransactionType());
			balanceInfo.setCreatedDate(new Date());
			balanceInfo.setDescription(userTransactionDto.getDescription());
			balanceInfo.setVirtualBalance(userTransactionDto.getVirtualBalance());
			balanceInfo.setFromUserId(userTransactionDto.getSessionUserId());
			balanceInfo.setRechargeTransactionId(userTransactionDto.getRechargeTransactionId());
			session.saveOrUpdate(balanceInfo);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return balanceInfo;
	}

	@Override
	@Transactional
	public RechargeTransaction saveRechargeTransaction(RechargeTransaction rechargeTransaction) {
		Session session = this.sessionFactory.getCurrentSession();
		RechargeTransaction newRechargeTransaction = new RechargeTransaction();
		try {
			newRechargeTransaction.setMobileNumber(rechargeTransaction.getMobileNumber());
			newRechargeTransaction.setOperatorId(rechargeTransaction.getOperatorId());
			newRechargeTransaction.setRechargeAmount(rechargeTransaction.getRechargeAmount());
			newRechargeTransaction.setUserId(rechargeTransaction.getUserId());
			if(rechargeTransaction.getStatus() == 'N') {
				newRechargeTransaction.setStatus('N');	
			}
			else {
				newRechargeTransaction.setStatus('Y');
			}
		    newRechargeTransaction.setDescription(rechargeTransaction.getDescription());
		    newRechargeTransaction.setRechargeApiId(rechargeTransaction.getRechargeApiId());
			newRechargeTransaction.setRechargeDate(new Date());
			session.saveOrUpdate(newRechargeTransaction);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rechargeTransaction; 
	}

	@Override
	@Transactional
	public Iterable<BalanceInfo> getUserPassbook(int userId) {
		Session session = this.sessionFactory.getCurrentSession();
		Iterable<BalanceInfo> userPassbook = null;
		try {
			Query query = session.getNamedNativeQuery("BalanceInfo.getUserPassbook").setParameter("userId", userId);
			userPassbook = query.list();
		} catch(Exception e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return userPassbook;
	}

	@Override
	@Transactional
	public Iterable<RechargeTransaction> getRechargeReport(int userId) {
		Session session = this.sessionFactory.getCurrentSession();
		Iterable<RechargeTransaction> rechargeReport = null;
		try {
			Query query = session.getNamedNativeQuery("BalanceInfo.rechargeReport").setParameter("userId", userId);
			rechargeReport = query.list();
		} catch(Exception e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return rechargeReport;
	}
	
	@Override
	@Transactional
	public Iterable<RechargeTransaction> getAllRechargeReport() {
		Session session = this.sessionFactory.getCurrentSession();
		Iterable<RechargeTransaction> rechargeReport = null;
		try {
			Query query = session.getNamedNativeQuery("BalanceInfo.allRechargeReport");
			rechargeReport = query.list();
		} catch(Exception e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return rechargeReport;
	}
}
