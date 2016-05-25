package group3.beef.employee.controller;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;
import group3.beef.encryption.AES_Encryption;
import group3.beef.mail.model.EmailUtils;
import group3.beef.mail.model.GenerateLinkUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
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
		 res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");
		
		//=====================員工登入======================
		if ("login".equals(action)) {
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
				//session.setAttribute("mail", mail);
				session.setAttribute("empVO", empVO);
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
		//=====================發送驗證信======================
		if ("forgetpw".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);
			String mail = req.getParameter("restmail");
			//System.out.println(action);
			//System.out.println(mail);
			if(mail == null ||mail.trim().length()==0){
				errorMsg.add("帳號請勿空白");
			}
			
			EmployeeService eSvc  =  new EmployeeService();
			EmployeeVO empVO = eSvc.findEmpByMail(mail);
			if(empVO != null){
				System.out.println("帳號存在!!");
				EmailUtils.sendResetPasswordEmail(empVO);
				PrintWriter out = res.getWriter();
				out.println("重設信發送成功");
				return;
			}else{
				errorMsg.add("帳號不存在!!");
				System.out.println("帳號不存在!!");
			}
			if (!errorMsg.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/foget_pw.jsp");
				failureView.forward(req, res);
				return;
			}
			
			
		}
		//======================驗證重設信============================
		 
		if ("reset".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);
			String mail = req.getParameter("mail");
			String checkCode = req.getParameter("checkCode");
			try {
			EmployeeService eSvc  =  new EmployeeService();
			EmployeeVO empVO = eSvc.findEmpByMail(mail);
		  boolean check = GenerateLinkUtils.verifyCheckcode(empVO, checkCode);
		  System.out.println(check);
		  if(check){
			 System.out.println("帳號比對成功");
			 HttpSession session = req.getSession();
			 session.setAttribute("empVO", empVO);
			RequestDispatcher failureView = req
					.getRequestDispatcher("/Backstage/reset_pw.jsp");
			failureView.forward(req, res);
			return;
		  }
		  else{
			  errorMsg.add("認證碼錯誤");
		  }
		  if (!errorMsg.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/reset_pw.jsp");
				failureView.forward(req, res);
				return;
			}
			}catch(Exception e)  {
				RequestDispatcher rd = req
						.getRequestDispatcher("/Backstage/reset_pw.jsp");
				rd.forward(req, res);} 
			
		}
		//======================變更密碼============================
		if ("change_pw".equals(action)){
			System.out.println(action);
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);
			try{
				HttpSession session =req.getSession();
				EmployeeVO oldEmpVO = (EmployeeVO) session.getAttribute("empVO");
			String npwd = req.getParameter("pwd");
			String npwd2 = req.getParameter("pwd2");
			if(oldEmpVO != null){
			
			if (npwd == null || npwd.trim().length() == 0) {
				errorMsg.add("密碼: 請勿空白");
			}	
			if (!npwd.equals(npwd2)){
				errorMsg.add("密碼: 密碼不一致");
				}
			String pwdReg = "^[(a-zA-Z0-9)]{4,10}$";
			if (!npwd.trim().matches(pwdReg)) {
				errorMsg.add("密碼:英文字母、數字 , 且長度必需在4到10之間");
			}
			}else{
				PrintWriter out = res.getWriter();
				out.println("認證信已失效，請重新發送");
			}
			AES_Encryption AES = new AES_Encryption();
			
			Integer eid = oldEmpVO.getEid();
			String ename = oldEmpVO.getName();
			String pwd = AES.getencrypt(npwd);
			String email = oldEmpVO.getEmail();
			Blob photo = oldEmpVO.getPhoto();
			String edu = oldEmpVO.getEducation();
			String exp = oldEmpVO.getSpecialty();
			String spec = oldEmpVO.getSpecialty();
			
			
			EmployeeVO newEmpVO= new EmployeeVO();
			
			newEmpVO.setEid(oldEmpVO.getEid());
			newEmpVO.setName(oldEmpVO.getName());
			newEmpVO.setPwd(oldEmpVO.getPwd());
			newEmpVO.setEmail(oldEmpVO.getEmail());
			newEmpVO.setEducation(oldEmpVO.getEducation());
			newEmpVO.setExperience(oldEmpVO.getExperience());
			newEmpVO.setSpecialty(oldEmpVO.getSpecialty());
			newEmpVO.setPhoto(oldEmpVO.getPhoto());
			if (!errorMsg.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/reset_pw.jsp");
				failureView.forward(req, res);
				return;
			}
			
			EmployeeService empSvc = new EmployeeService();
			newEmpVO = empSvc
					.updateEmp(eid, ename, pwd, email, photo, edu, exp, spec);
			session.removeAttribute("empVO");
			PrintWriter out = res.getWriter();
			out.println("密碼更新成功，請重新登入");
			out.println("<a href='http://localhost:8081/AmyClinic//Backstage/login.jsp'>返回登入頁</a><br>");
			return;
			
			}catch (Exception e) {
				errorMsg.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/reset_pw.jsp");
				failureView.forward(req, res);
				
			}
			
		}
		
	}
}
