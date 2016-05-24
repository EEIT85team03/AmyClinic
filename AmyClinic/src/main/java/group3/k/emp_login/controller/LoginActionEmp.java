package group3.k.emp_login.controller;

import group3.k.emp_logn.model.EmployeesDAO;
import java.io.IOException;
import javax.servlet.http.*;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginActionEmp extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private EmployeesDAO employeesDAO;
	private String message;
		
	public EmployeesDAO getEmployeesDAO() {
		return employeesDAO;
	}
	public void setEmployeesDAO(EmployeesDAO employeesDAO) {
		this.employeesDAO = employeesDAO;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	private boolean allowUser(Integer eid, String name) {
		LoginServiceEmp login = new LoginServiceEmp();
//		employeesDAO = login.validate(eid, name);
//		if (employeesDAO!=null)
			return true;
//		else
//			return false;
	}

	public String login() {

//		if (!allowUser(employeesDAO.getEid), employeesDAO.getName())) { 
//			this.setMessage("Invalid ID or Name!");
//			return "login";
//		} else {
//			HttpServletRequest request = ServletActionContext.getRequest(); // get HttpServletRequest
//			HttpSession session = request.getSession(); // get HttpSession
//			session.setAttribute("account", employeesDAO.getName());     // *工作1: 在session內做已經登入過的標識
//			session.setAttribute("employees", employeesDAO);
			
//			try {                                            
//		         String location = (String) session.getAttribute("location");
//		         System.out.println("location(LoginHandler)="+location);
//		         if (location != null) {
//		           session.removeAttribute("location");
//		           HttpServletResponse  response = ServletActionContext.getResponse(); 
//		           response.sendRedirect(location);
//		           return null;
//		         }
//		       }catch (IOException e) { e.printStackTrace();}
			return "success";
//		}
	}
}
