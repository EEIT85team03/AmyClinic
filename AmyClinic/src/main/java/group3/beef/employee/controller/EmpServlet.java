package group3.beef.employee.controller;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;

import java.io.IOException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
 
@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet("/BeefTest/emp.do")
public class EmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmpServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
 
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		// ===================查詢一位員工=========================

		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);

			try {
				String str = req.getParameter("eid");
				if (str == null || (str.trim().length() == 0)) {
					errorMsg.add("請輸入員工編號");
				}
				if (!errorMsg.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/BeefTest/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				Integer empno = null;
				try {
					empno = new Integer(str);
				} catch (Exception e) {
					errorMsg.add("員工編號格式不正確");
				}
				if (!errorMsg.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/BeefTest/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始查詢資料 *****************************************/
				EmployeeService empSvc = new EmployeeService();
				EmployeeVO empVO = empSvc.getOneEmployee(empno);
				if (empno == null) {
					errorMsg.add("查無資料");
				}
				if (!errorMsg.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/BeefTest/select_page.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("empVO", empVO);
				RequestDispatcher successView = req
						.getRequestDispatcher("/BeefTest/update_emp_input.jsp");
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsg.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/BeefTest/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		// ===================新增員工=========================
		if ("insert".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);

			try {
				String ename = req.getParameter("name");
				if (ename == null || ename.trim().length() == 0) {
					errorMsg.add("醫師姓名: 請勿空白");
				}
				String pwd = req.getParameter("pwd");
				if (pwd == null || pwd.trim().length() == 0) {
					errorMsg.add("密碼: 請勿空白");
				}
				String pwdReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (!pwd.trim().matches(pwdReg)) {
					errorMsg.add("密碼:只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				String email = req.getParameter("email");
				if (email == null || email.trim().length() == 0) {
					errorMsg.add("e-mail: 請勿空白");
				}

				String edu = req.getParameter("edu");
				if (edu == null || edu.trim().length() == 0) {
					errorMsg.add("教育程度: 請勿空白");
				}

				String exp = req.getParameter("exp");
				if (exp == null || exp.trim().length() == 0) {
					errorMsg.add("經歷: 請勿空白");
				}

				String spec = req.getParameter("spec");
				if (spec == null || spec.trim().length() == 0) {
					errorMsg.add("專長: 請勿空白");
				}
				 
				
				
			
				

				EmployeeVO empVO = new EmployeeVO();
				empVO.setName(ename);
				empVO.setPwd(pwd);
				empVO.setEmail(email);
				empVO.setEducation(edu);
				empVO.setExperience(exp);
				empVO.setSpecialty(spec);

				if (!errorMsg.isEmpty()) {
					req.setAttribute("empVO", empVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/BeefTest/AddEMP.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始新增資料 ***************************************/
				EmployeeService empSvc = new EmployeeService();
				empVO = empSvc.addEmp(ename, pwd, email, edu, exp, spec);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/BeefTest/GetAllEMP.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsg.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/BeefTest/AddEMP.jsp");
				failureView.forward(req, res);
			}
		}
		// ===================修改員工=========================
		if ("update".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);
			Integer eid = new Integer(req.getParameter("eid").trim());
			try {
				String ename = req.getParameter("name");
				if (ename == null || ename.trim().length() == 0) {
					errorMsg.add("醫師姓名: 請勿空白");
				}
				String pwd = req.getParameter("pwd");
				if (pwd == null || pwd.trim().length() == 0) {
					errorMsg.add("密碼: 請勿空白");
				}
				String pwdReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (!pwd.trim().matches(pwdReg)) {
					errorMsg.add("密碼:只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				String email = req.getParameter("email");
				if (email == null || email.trim().length() == 0) {
					errorMsg.add("e-mail: 請勿空白");
				}

				String edu = req.getParameter("edu");
				if (edu == null || edu.trim().length() == 0) {
					errorMsg.add("教育程度: 請勿空白");
				}

				String exp = req.getParameter("exp");
				if (exp == null || exp.trim().length() == 0) {
					errorMsg.add("經歷: 請勿空白");
				}

				String spec = req.getParameter("spec");
				if (spec == null || spec.trim().length() == 0) {
					errorMsg.add("專長: 請勿空白");
				}

				EmployeeVO empVO = new EmployeeVO();
				empVO.setEid(eid);
				empVO.setName(ename);
				empVO.setPwd(pwd);
				empVO.setEmail(email);
				empVO.setEducation(edu);
				empVO.setExperience(exp);
				empVO.setSpecialty(spec);

				if (!errorMsg.isEmpty()) {
					req.setAttribute("empVO", empVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/BeefTest/update_emp_input.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始新增資料 ***************************************/
				EmployeeService empSvc = new EmployeeService();
				empVO = empSvc.updateEmp(eid, ename, pwd, email, edu, exp, spec);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/BeefTest/GetAllEMP.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsg.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/BeefTest/AddEMP.jsp");
				failureView.forward(req, res);
			}
		}
			// ===================刪除一位員工=========================
		
		if ("delete".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();
			
			try {
				req.setAttribute("errorMsg", errorMsg);
				Integer eid = new Integer(req.getParameter("eid").trim());
				EmployeeService empSvc = new EmployeeService();
				empSvc.deleteEmployee(eid);
				String url = "/BeefTest/GetAllEMP.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsg.add("刪除資料失敗"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/BeefTest/GetAllEMP.jsp");
				failureView.forward(req, res);
			}
			
			
			
		}
	}
}
