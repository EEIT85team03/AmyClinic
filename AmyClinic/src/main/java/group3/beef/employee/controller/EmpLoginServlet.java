package group3.beef.employee.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EmpLoginServlet")
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
		if (!errorMsg.isEmpty()) {
			RequestDispatcher failureView = req
					.getRequestDispatcher("/Backstage/login.jsp");
			failureView.forward(req, res);
			return;
			}
	}

}
