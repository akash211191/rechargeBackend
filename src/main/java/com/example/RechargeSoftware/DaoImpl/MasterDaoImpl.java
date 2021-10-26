package com.example.RechargeSoftware.DaoImpl;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.RechargeSoftware.DAO.MasterDao;
import com.example.RechargeSoftware.Entity.Commission;
import com.example.RechargeSoftware.Entity.Operator;
import com.example.RechargeSoftware.Entity.RechargeApi;
import com.example.RechargeSoftware.Entity.SMSApi;
import com.example.RechargeSoftware.Entity.Scheme;
import com.example.RechargeSoftware.Entity.User;
import com.example.RechargeSoftware.Master.Entity.ServiceInfo;

@Configuration
@Repository
public class MasterDaoImpl implements MasterDao {

	@Autowired
	SessionFactory  sessionFactory;
	
	@Autowired
	HttpSession httpSession;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public Operator saveOperatorInfo(Operator operator)  {
		
		// TODO Auto-generated method stub
		try {
			Session session = this.sessionFactory.getCurrentSession();
			
			Operator operatorData = new Operator();
			if(operator.getOperatorId() != 0) {
				operatorData.setOperatorId(operator.getOperatorId());
			}
			operatorData.setOperatorName(operator.getOperatorName());
			operatorData.setServiceId(operator.getServiceId());
			operatorData.setSmsCode(operator.getSmsCode());
			operatorData.setStatus(operator.getStatus());
			operatorData.setAdminCommission(operator.getAdminCommission());
			operatorData.setMaximumRechargeAmount(operator.getMaximumRechargeAmount());
			operatorData.setMinimumRechargeAmount(operator.getMinimumRechargeAmount());
			operatorData.setCreatedDate(new Date());
			session.saveOrUpdate(operatorData); 
			List<Commission> totalCommissionConsumedforOperator = session.getNamedNativeQuery("Commission.totalCommissionConsumedforOperatorExceptAdmin")
					.setParameter("operatorId",operator.getOperatorId()).list();
			Iterator it1 = totalCommissionConsumedforOperator.iterator();
			double getTotalConsumed = (double) it1.next();
			double newCommission = operator.getAdminCommission();
			double newDifferenceCommission = newCommission-getTotalConsumed;
			Query query = session.createNativeQuery("Update Tbl_Commission set commission_amount =:newDifferenceCommission where "
													 + "scheme_id = 6  and operator_id =:operatorId")
													 .setParameter("newDifferenceCommission",newDifferenceCommission)
													 .setParameter("operatorId",operator.getOperatorId());
				query.executeUpdate();
				}
		catch(Exception e) {
			e.printStackTrace();
		}
		return operator;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public Iterable<SMSApi> getAllSMSApi() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("SMSApi.getAllSMSApiList");
		Iterable<SMSApi> smsApiList = query.list(); 
		return smsApiList;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public Iterable<Operator> getAllOperatorList() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("Operator.getAllOperatorList");
		Iterable<Operator> operatorList = query.list(); 
		return operatorList;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public Iterable<Operator> getOperatorListById(int operatorId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("Operator.getOperatorListById").setParameter("operatorId", operatorId);
		Iterable<Operator> operatorList = query.list(); 
		return operatorList;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public Iterable<SMSApi> getSMSApiListById(int smsApiId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("SMSApi.getSMSApiListById").setParameter("smsApiId", smsApiId);
		Iterable<SMSApi> smsApiList = query.list(); 
		return smsApiList;
	}

	@SuppressWarnings({ "rawtypes"})
	@Override
	@Transactional
	public SMSApi addSmsApi(SMSApi smsApi)  {		
		// TODO Auto-generated method stub
		try {
			Session session = this.sessionFactory.getCurrentSession();			
			SMSApi smsApiData = new SMSApi();
			if(smsApi.getSmsApiId() != 0) {
				smsApiData.setSmsApiId(smsApi.getSmsApiId());
			}
			smsApiData.setSmsApiName(smsApi.getSmsApiName());
			smsApiData.setSmsUrlName(smsApi.getSmsUrlName());
			smsApiData.setSenderId(smsApi.getSenderId());
			if(smsApi.getStatus() == 'Y') {
				Query query = session.createSQLQuery("Update Tbl_SMS_Api set status =:status").setParameter("status", 'N');
				query.executeUpdate();
			} else {
				Query query = session.createSQLQuery("Update Tbl_SMS_Api set status =:status").setParameter("status", 'Y');
				query.executeUpdate();
			}
			smsApiData.setStatus(smsApi.getStatus());
			smsApiData.setSmsApiPassword(smsApi.getSmsApiPassword());
			smsApiData.setCreatedDate(new Date());
			session.saveOrUpdate(smsApiData);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return smsApi;	
	}
	
	
	@Override
	@Transactional
	public RechargeApi addRechargeApi(RechargeApi rechargeApi)  {		
		// TODO Auto-generated method stub
		try {
			Session session = this.sessionFactory.getCurrentSession();			
			RechargeApi rechargeApiData = new RechargeApi();
			if(rechargeApi.getRechargeApiId() != 0) {
				rechargeApiData.setRechargeApiId(rechargeApi.getRechargeApiId());
			}
			rechargeApiData.setRechargeApiName(rechargeApi.getRechargeApiName());
			rechargeApiData.setStatus('Y');
			rechargeApiData.setRechargeApiPassword(rechargeApi.getRechargeApiPassword());
			rechargeApiData.setCreatedDate(new Date());
			rechargeApiData.setRechargeApiUsername(rechargeApi.getRechargeApiUsername());
			session.saveOrUpdate(rechargeApiData);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return rechargeApi;	
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public Iterable<RechargeApi> getRechargeApiListById(int rechargeApiId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("RechargeApi.getRechargeApiListById").setParameter("rechargeApiId", rechargeApiId);
		Iterable<RechargeApi> rechargeApiList = query.list(); 
		return rechargeApiList;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public List<ServiceInfo> getAllServiceList() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("Service.getAllServiceList");
		List<ServiceInfo> serviceList = query.list(); 
		return serviceList;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public Iterable<RechargeApi> getAllRechargeApi() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("RechargeApi.getAllRechargeApiList");
		Iterable<RechargeApi> rechargeApiList = query.list(); 
		return rechargeApiList;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	@Transactional
	public Commission addCommission(Commission commission)  {		
		// TODO Auto-generated method stub
		try {
			Session session = this.sessionFactory.getCurrentSession();			
			Commission commissionData = new Commission();
			if(commission.getCommissionId() != 0) {
				commissionData.setCommissionId(commission.getCommissionId());
			}
			commissionData.setSchemeId(commission.getSchemeId());
			commissionData.setStatus('Y');
			commissionData.setRechargeApiId(commission.getRechargeApiId());
			commissionData.setCreatedDate(new Date());
			commissionData.setOperatorId(commission.getOperatorId());
			commissionData.setCommissionAmount(commission.getCommissionAmount());
			session.saveOrUpdate(commissionData);
			List<Commission> totalCommissionConsumedforOperator = session.getNamedNativeQuery("Commission.totalCommissionConsumedforOperatorExceptAdmin")
					.setParameter("operatorId",commission.getOperatorId()).list();
			Iterator it1 = totalCommissionConsumedforOperator.iterator();
			double getTotalConsumed = (double) it1.next();
			List<Operator> adminCommissionCount = session.getNamedNativeQuery("Operator.getAdminCommissionForOperator")
					.setParameter("operatorId",commission.getOperatorId()).list();
			Iterator it2 = adminCommissionCount.iterator();
			double adminCommission = (double) it2.next();
			double differenceCommission = adminCommission - getTotalConsumed;
			List<Operator> getCurrentCommissionForScheme = session.getNamedNativeQuery("Commission.getCurrentCommissionAssignedScheme")
					.setParameter("operatorId",commission.getOperatorId())
					.setParameter("schemeId",commission.getSchemeId()).list();
			Iterator it3 = getCurrentCommissionForScheme.iterator();
			double currentCommissionForScheme = (double) it3.next();
			double newCommission = commission.getCommissionAmount();
			double newDifferenceCommission = newCommission-currentCommissionForScheme;
			if(commission.getCommissionId() != 0) {
				differenceCommission = adminCommission - (getTotalConsumed + newDifferenceCommission);
			}
			List<Commission> commissionList = session.getNamedNativeQuery("Commission.checkIfCommissionAlreadyExists")
					.setParameter("operatorId",commission.getOperatorId())
					.setParameter("schemeId",6)
					.setParameter("rechargeApiId",commission.getRechargeApiId()).list();
				Iterator it = commissionList.iterator();
			int count = (int) it.next();
			if(count == 0) {
				Commission adminCommissionData = new Commission();
				adminCommissionData.setSchemeId(6);
				adminCommissionData.setStatus('Y');
				adminCommissionData.setRechargeApiId(commission.getRechargeApiId());
				adminCommissionData.setCreatedDate(new Date());
				adminCommissionData.setOperatorId(commission.getOperatorId());
				adminCommissionData.setCommissionAmount(differenceCommission);
				session.saveOrUpdate(adminCommissionData);
			}
			else {
				Query query = session.createNativeQuery("Update Tbl_Commission set commission_amount =:differenceCommission where "
													 + "scheme_id = 6 and recharge_api_id =:rechargeApiId and operator_id =:operatorId")
													 .setParameter("differenceCommission",differenceCommission)
													 .setParameter("rechargeApiId",commission.getRechargeApiId())
													 .setParameter("operatorId",commission.getOperatorId());
				query.executeUpdate();
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return commission;	
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public Iterable<Commission> getAllCommission(int operatorId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("Commission.getAllCommission").setParameter("operatorId", operatorId);
		Iterable<Commission> commissionList = query.list(); 
		return commissionList;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public boolean checkIfCommissionAlreadyExists(Commission commission) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			
			List<Commission> commissionList = session.getNamedNativeQuery("Commission.checkIfCommissionAlreadyExists")
					.setParameter("operatorId",commission.getOperatorId())
					.setParameter("schemeId",commission.getSchemeId())
					.setParameter("rechargeApiId",commission.getRechargeApiId()).list();
				Iterator it = commissionList.iterator();
				int count = (int) it.next();
				if(count != 0)
				{ 
					return true;
				}
		} catch(Exception e) {
			e.printStackTrace();
		}				
		return false;
	}	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public Iterable<Commission> getCommissionListById(int commissionId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("Commission.getCommissionListById").setParameter("commissionId",commissionId);
		Iterable<Commission> commissionList = query.list(); 
		return commissionList;
	}
	
	@Override
	@Transactional
	public Scheme saveScheme(Scheme scheme)  {
		
		// TODO Auto-generated method stub
		try {
			Session session = this.sessionFactory.getCurrentSession();			
			Scheme schemeData = new Scheme();
			if(scheme.getSchemeId() != 0) {
				schemeData.setSchemeId(scheme.getSchemeId());
			}
			schemeData.setSchemeName(scheme.getSchemeName());
			schemeData.setSchemeDescription(scheme.getSchemeDescription());
			schemeData.setRoleId(scheme.getRoleId());
			schemeData.setStatus('Y');
			schemeData.setCreatedDate(new Date());
			schemeData.setSchemeAmount(scheme.getSchemeAmount());
			session.saveOrUpdate(schemeData);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return scheme;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public Iterable<Scheme> getAllSchemeList() {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("Scheme.getAllSchemeList");
		Iterable<Scheme> schemeList = query.list(); 
		return schemeList;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public Iterable<Scheme> getSchemeListById(int schemeId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("Scheme.getSchemeListById").setParameter("schemeId", schemeId);
		Iterable<Scheme> schemeList = query.list(); 
		return schemeList;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public boolean checkIfCommissionAmountExceeded(Commission commission) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			
			List<Operator> adminCommissionCount = session.getNamedNativeQuery("Operator.getAdminCommissionForOperator")
					.setParameter("operatorId",commission.getOperatorId()).list();
			List<Commission> totalCommissionConsumedforOperator = session.getNamedNativeQuery("Commission.totalCommissionConsumedforOperatorExceptAdmin")
					.setParameter("operatorId",commission.getOperatorId()).list();
				Iterator it = adminCommissionCount.iterator();
				Iterator it1 = totalCommissionConsumedforOperator.iterator();
				double getAdminCommissionCount = (double) it.next();
				double getTotalConsumed = (double) it1.next();	
				double pendingCount = getAdminCommissionCount - getTotalConsumed;
				double newCommission = commission.getCommissionAmount();
				if(pendingCount < newCommission) {
					return true;
				}
		} catch(Exception e) {
			e.printStackTrace();
		}				
		return false;
	}


	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	@Transactional
	public boolean checkIfCommissionAmountExceededForUpdate(Commission commission) {
		Session session = this.sessionFactory.getCurrentSession();
		try {
			
			List<Operator> adminCommissionCount = session.getNamedNativeQuery("Operator.getAdminCommissionForOperator")
					.setParameter("operatorId",commission.getOperatorId()).list();
			List<Operator> CurrentCommissionAssignedToScheme = session.getNamedNativeQuery("Commission.getCurrentCommissionAssignedScheme")
					.setParameter("operatorId",commission.getOperatorId())
					.setParameter("schemeId",commission.getSchemeId())
					.list();
			List<Commission> totalCommissionConsumedforOperator = session.getNamedNativeQuery("Commission.totalCommissionConsumedforOperatorExceptAdmin")
					.setParameter("operatorId",commission.getOperatorId()).list();
				Iterator it = adminCommissionCount.iterator();
				Iterator it1 = totalCommissionConsumedforOperator.iterator();
				Iterator it2 = CurrentCommissionAssignedToScheme.iterator();
				double getAdminCommissionCount = (double) it.next();   /* 4 */
				double getTotalConsumed = (double) it1.next();	/* 4 */
				double getCurrentCommissionForScheme = (double) it2.next();  /* 4 */				
				double pendingCount = getAdminCommissionCount - getTotalConsumed; 
				double newCommission = commission.getCommissionAmount();
				double differenceCommission = newCommission - getCurrentCommissionForScheme;			
				if(pendingCount < differenceCommission) {
					return true;
				}
		} catch(Exception e) {
			e.printStackTrace();
		}				
		return false;
	}


	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	@Transactional
	public Iterable<User> creditCommissionToUser(int userId,int operatorId) {
		Session session = this.sessionFactory.getCurrentSession();
		Iterable<User> creditToUserList = null;
		try {
			Query query = session.getNamedNativeQuery("User.creditCommissionToUser").setParameter("userId", userId).setParameter("operatorId",operatorId);
		    creditToUserList = query.list(); 
		} catch(Exception e) {
			e.printStackTrace();
		}		
		return creditToUserList;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	@Transactional
	public boolean checkIfCommissionConsumedForOperator(Operator operator) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Commission> getTotalCommissionConsumedforOperator = session.getNamedNativeQuery("Commission.totalCommissionConsumedforOperatorExceptAdmin")
				.setParameter("operatorId",operator.getOperatorId()).list();
		Iterator it = getTotalCommissionConsumedforOperator.iterator();
		double totalCommissionConsumedforOperator = (double) it.next();
		double currentCHangedCommission = operator.getAdminCommission();
		if(currentCHangedCommission < totalCommissionConsumedforOperator) {
			return true;
		}
		// TODO Auto-generated method stub
		return false;
	}


	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public Iterable<Scheme> getSchemeForRole(int roleId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("Scheme.getSchemeForRole").setParameter("roleId", roleId);
		Iterable<Scheme> schemeList = query.list(); 
		return schemeList;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	@Transactional
	public Iterable<Scheme> getSchemeUnderRole(int roleId) {
		Session session = this.sessionFactory.getCurrentSession();
		Query query = session.getNamedNativeQuery("Scheme.getSchemeUnderRole").setParameter("roleId", roleId);
		Iterable<Scheme> schemeList = query.list(); 
		return schemeList;
	}
}
