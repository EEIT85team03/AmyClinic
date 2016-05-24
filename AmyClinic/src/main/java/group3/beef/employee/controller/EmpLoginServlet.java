package group3.beef.employee.controller;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Backstage/EmpLoginServlet.do")
public class EmpLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmpLoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		List<String> errorMsg = new LinkedList<String>();
		req.setAttribute("errorMsg", errorMsg);

		String mail = req.getParameter("mail");
		if (mail == null || mail.trim().length() == 0) {
			errorMsg.add("帳號請勿空白");
		}
		String emailReg = "[a-zA-Z0-9_]*@[a-zA-Z0-9]+(\\.[a-zA-Z]+){1,3}";
		if (!mail.matches(emailReg)) {
			errorMsg.add("帳號格式錯誤");
		}

		String pwd = req.getParameter("pwd");
		if (pwd == null || pwd.trim().length() == 0) {
			errorMsg.add("密碼請勿空白");
		}
		
		EmployeeService eSvc  =  new EmployeeService();
		try {
			EmployeeVO empVO = eSvc.EmpLogin(mail, pwd);
			if(empVO != null ){
				HttpSession session = req.getSession();
				session.setAttribute("mail", mail);
				//session.setAttribute("empVO", empVO);
				System.out.println("登入成功");
				String location = (String) session.getAttribute("location");
				if(location != null){
					session.removeAttribute("location");
					res.sendRedirect(location);
					return;
				}
			} else{
				errorMsg.add("查無此帳號");
			}
			
			if (!errorMsg.isEmpty()) {
				req.setAttribute("mail", mail);
				req.setAttribute("pwd", pwd);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/login.jsp");
				failureView.forward(req, res);
				return;
				}
		} catch (Exception e)  {
			RequestDispatcher rd = req
					.getRequestDispatcher("/Backstage/login.jsp");
			rd.forward(req, res);
			 
			
		}
		res.sendRedirect(req.getContextPath()+"/Backstage/login_success.jsp");
	}

}
