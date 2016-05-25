package group3.carrie.member.controller;

import group3.carrie.member.model.MemberService;
import group3.henry.login.model.MemberVO;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//單純為了購物系統、預約系統登入測試用
@WebServlet("/CarrieTest/login/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);

		try {
			String email = req.getParameter("email");
			if (email == null || email.trim().length() == 0) {
				errorMsgs.add("帳號請勿空白");
			}
			String emailReg = "[a-zA-Z0-9_]*@[a-zA-Z0-9]+(\\.[a-zA-Z]+){1,3}";
			if (!email.matches(emailReg)) {
				errorMsgs.add("帳號格式錯誤");
			}
			String pwd = req.getParameter("pwd");
			if (pwd == null || pwd.trim().length() == 0) {
				errorMsgs.add("密碼請勿空白");
			}

			if (!errorMsgs.isEmpty()) {
				RequestDispatcher rd = req
						.getRequestDispatcher("/CarrieTest/login/login.jsp");
				rd.forward(req, res);
				return;
			}

			MemberService mbServ = new MemberService();
			MemberVO mb = mbServ.login(email, pwd);
			if (mb != null) {
				HttpSession session = req.getSession();
				session.setAttribute("email", email);
				session.setAttribute("memberVO", mb);
				try {
					String location = (String) session.getAttribute("location");
					if (location != null) {
						session.removeAttribute("location");
						res.sendRedirect(location);
						return;
					}
				} catch (Exception e) {

				}
			} else {
				errorMsgs.add("查無此帳號");
			}
			
			if (!errorMsgs.isEmpty()) {
//				errorMsgs.add("其他錯誤");
				RequestDispatcher rd = req
						.getRequestDispatcher("/CarrieTest/login/login.jsp");
				rd.forward(req, res);
				return;
			}

		} catch (Exception e) {
			RequestDispatcher rd = req.getRequestDispatcher("/CarrieTest/login/login.jsp");
			rd.forward(req, res);
		}
		
		res.sendRedirect(req.getContextPath()+"/CarrieTest/login/login_success.jsp");

	}

}
