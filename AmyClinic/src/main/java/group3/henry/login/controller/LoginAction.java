package group3.henry.login.controller;

import java.io.IOException;

import javax.servlet.http.*;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import group3.henry.login.model.LoginService;
import group3.henry.login.model.MemberVO;

public class LoginAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private MemberVO memberVO;
	private String message;
		
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	private boolean allowUser(String id, String pw) {
		LoginService login = new LoginService();
		memberVO = login.validate(id, pw);
		if (memberVO!=null)
			return true;
		else
			return false;
	}

	public String login() {
		HttpServletRequest request = ServletActionContext.getRequest();

//		if (!allowUser(memberVO.getName(), memberVO.getPwd())) {
		System.out.println((String)request.getAttribute("encpw"));
		if (!allowUser(memberVO.getName(), (String)request.getAttribute("encpw"))) { 
			
			this.setMessage("Invalid ID or Password!");
			return "login";
		} else {
			HttpSession session = request.getSession(); // get HttpSession
			session.setAttribute("account", memberVO.getName());     // *工作1: 在session內做已經登入過的標識
			session.setAttribute("member", memberVO);
			
//			HttpServletResponse  response = ServletActionContext.getResponse(); 
//			try {
//				String location = (String) session.getAttribute("location");
//				System.out.println("location(LoginHandler)="+location);
//				response.sendRedirect(location);
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
			try {                                      //*工作2: 看看有無來源網頁 (-如有:則重導之)                  
		         String location = (String) session.getAttribute("location");
		         System.out.println("location(LoginHandler)="+location);
		         if (location != null) {
		           session.removeAttribute("location");
		           HttpServletResponse  response = ServletActionContext.getResponse(); 
		           response.sendRedirect(location);
		           return null;
		         }
		       }catch (IOException e) { e.printStackTrace();}
			
			return "success";
		}
	}
}
