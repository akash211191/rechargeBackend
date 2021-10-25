package com.example.RechargeSoftware.ViewController;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.RechargeSoftware.Entity.BalanceInfo;
import com.example.RechargeSoftware.Entity.Operator;
import com.example.RechargeSoftware.Entity.RechargeApi;
import com.example.RechargeSoftware.Entity.Scheme;
import com.example.RechargeSoftware.Entity.User;
import com.example.RechargeSoftware.Master.Entity.Role;
import com.example.RechargeSoftware.Master.Entity.ServiceInfo;
import com.example.RechargeSoftware.ServiceImpl.BalanceServiceImpl;
import com.example.RechargeSoftware.ServiceImpl.MasterServiceImpl;
import com.example.RechargeSoftware.ServiceImpl.UserServiceImpl;

@Controller
@RequestMapping("Recharge/")
public class ViewController {

	@Autowired
	UserServiceImpl userService;

	@Autowired
	MasterServiceImpl masterService;
	

	@Autowired
	BalanceServiceImpl balanceService;
	
	@Autowired
	HttpSession httpSession;
	
	@RequestMapping("login")
	public String login() {
		return "login";
	}	

	@RequestMapping(value="logout")
	public String invalidate(HttpSession session) {
	  session.invalidate();
	  return "redirect:login";
	}
	
	@RequestMapping("register")
	public String register() {
		return "register";
	}
	
	@RequestMapping("commonAdmin")
	public String commonAdmin() {
		return "commonAdmin";
	}
	
	@RequestMapping("commonDistributor")
	public String commonDistributor() {
		return "commonDistributor";
	}
	
	@RequestMapping("commonRetailer")
	public String commonRetailer() {
		return "commonRetailer";
	}
	
	@RequestMapping("dashBoardAdmin")
	public String dashBoardAdmin() {
		try {
			int userId = (int) httpSession.getAttribute("userId");
			} catch(Exception e) {
				return "login";
			}
		return "dashBoardAdmin";
	}	
	
	@RequestMapping("home")
	public String home() {
		try {
			int userId = (int) httpSession.getAttribute("userId");
			} catch(Exception e) {
				return "login";
			}
		return "home";
	}
	
	@RequestMapping("homeRetailer")
	public String homeRetailer() {
		try {
			int userId = (int) httpSession.getAttribute("userId");
			} catch(Exception e) {
				return "login";
			}
		return "homeRetailer";
	}
	
	@RequestMapping("recharge")
	public String recharge(Model model) {
		try {
		int userId = (int) httpSession.getAttribute("userId");
		Iterable<Operator> operatorList = masterService.getAllOperatorList();
		model.addAttribute("operatorList",operatorList);
		} catch(Exception e) {
			return "login";
		}
		return "recharge";
	}	
	
	@RequestMapping("transaction")
	public String transaction(Model model) {
		try {
	    int userId = (int) httpSession.getAttribute("userId");
		List<User> userList = userService.getAllUnderUserList(userId);
		model.addAttribute("userList", userList);
		} catch(Exception e) {
			return "login";
		}
		return "transaction";
	}	
	
	@RequestMapping("operators")
	public String operators(Model model) {
		try {
			int userId = (int) httpSession.getAttribute("userId");			
			List<ServiceInfo> serviceList = masterService.getAllServiceList();		
			model.addAttribute("serviceList", serviceList);
		} catch (Exception e) {
			return "login";
		}	
		return "operators";
	}
	
	@RequestMapping("smsApi")
	public String smsApi(Model model) {
		try {
			int userId = (int) httpSession.getAttribute("userId");
			} catch(Exception e) {
				return "login";
			}
		return "smsApi";
	}
	
	@RequestMapping("rechargeApi")
	public String rechargeApi(Model model) {
		try {
			int userId = (int) httpSession.getAttribute("userId");
			} catch(Exception e) {
				return "login";
			}
		return "rechargeApi";
	}

	@RequestMapping("commission")
	public String commissionApi(Model model) {
		Iterable<Scheme> schemeList = masterService.getAllSchemeList();		
		model.addAttribute("schemeList", schemeList);
		Iterable<RechargeApi> rechargeApiList = masterService.getAllRechargeApi();		
		model.addAttribute("rechargeApiList", rechargeApiList);
		Iterable<Operator> operatorList = masterService.getAllOperatorList();
		model.addAttribute("operatorList",operatorList);
		try {
			int userId = (int) httpSession.getAttribute("userId");
			} catch(Exception e) {
				return "login";
			}
		return "commission";
	}
	
	@RequestMapping("scheme")
	public String schemeApi(Model model) {
		List<Role> roleList = userService.getAllRoleListExceptAdmin();		
		model.addAttribute("roleList", roleList);
		try {
			int userId = (int) httpSession.getAttribute("userId");
			} catch(Exception e) {
				return "login";
			}
		return "scheme";
	}
	
	@RequestMapping("manageUser")
	public String manageUsers(Model model) {
		List<Role> roleList = userService.getAllRoleListExceptAdmin();		
		model.addAttribute("roleList", roleList);
		List<User> userList = userService.getAllUserListExceptAdmin();		
		model.addAttribute("userList", userList);
		try {
			int userId = (int) httpSession.getAttribute("userId");
			} catch(Exception e) {
				return "login";
			}
		return "manageUser";
	}
	
	@RequestMapping("dashBoardDistributor")
	public String dashBoardDistributor() {
		try {
			int userId = (int) httpSession.getAttribute("userId");
			} catch(Exception e) {
				return "login";
			}
		return "dashBoardDistributor";
	}	

	@RequestMapping("retailers")
	public String retailers() {
		try {
			int userId = (int) httpSession.getAttribute("userId"); 
			} catch(Exception e) {
				e.printStackTrace();
				return "login";
			}
		return "retailers";
	}	
	
	@RequestMapping("fundTransfer")
	public String fundTransfer(Model model) {
		try {
		int userId = (int) httpSession.getAttribute("userId"); 
		List<User> userList = userService.getAllUnderUserList(userId);
		model.addAttribute("userList", userList);
		} catch(Exception e) {
			e.printStackTrace();
			return "login";
		}
		return "fundTransfer";
	}	
	
	@RequestMapping("passbook")
	public String passbook(Model model) {
		try {
		int userId = (int) httpSession.getAttribute("userId");
		  Iterable<BalanceInfo> userPassbook = balanceService.getUserPassbook(userId);
		  model.addAttribute("userPassbook",userPassbook);
		 } catch(Exception e) {
			e.printStackTrace();
			return "login";
		}
		return "passbook";
	}	
	
	@RequestMapping("passbookDistributor")
	public String passbookDistributor(Model model) {
		try {
		int userId = (int) httpSession.getAttribute("userId");
		  Iterable<BalanceInfo> userPassbook = balanceService.getUserPassbook(userId);
		  model.addAttribute("userPassbook",userPassbook);
		 } catch(Exception e) {
			e.printStackTrace();
			return "login";
		}
		return "passbookDistributor";
	}
	
	@RequestMapping("passbookRetailer")
	public String passbookRetailer(Model model) {
		try {
		int userId = (int) httpSession.getAttribute("userId");
		  Iterable<BalanceInfo> userPassbook = balanceService.getUserPassbook(userId);
		  model.addAttribute("userPassbook",userPassbook);
		 } catch(Exception e) {
			e.printStackTrace();
			return "login";
		}
		return "passbookRetailer";
	}
	
	@RequestMapping("rechargeReport")
	public String rechargeReport(Model model) {
		try {
		int userId = (int) httpSession.getAttribute("userId");
		  Iterable<BalanceInfo> userPassbook = balanceService.getUserPassbook(userId);
		  model.addAttribute("userPassbook",userPassbook);
		 } catch(Exception e) {
			e.printStackTrace();
			return "login";
		}
		return "rechargeReport";
	}
}
