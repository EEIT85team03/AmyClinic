package group3.henry.login.controller;

import java.io.IOException;

import javax.servlet.http.*;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

/*
tries to log in
forgot password
clicks recover button
redirects to recover.jsp
enters email, sends to recoverAction, recover()

Action takes email, finds it in DB

If exists, sets token
sends token to email
user clicks link w/ token
Action receives token, triggers validateToken()
Action checks token against DB
If match, redirects to new password .jsp
user enters new password, sends to Action
encryption happens, interceptor
Action sets new pw in DB
redirect user to Index.jsp

*/
public class RecoverAction extends ActionSupport {
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
	
	private String compose(String token, String email){
		String nl = System.getProperty("line.separator");
		System.out.println("RecoverAction compose()");
		return "Someone requested a password reset at AmyClinic with your Email address!" + nl + 
				"If this wasn't you, please ignore this email!" + nl + nl + 
				"http://localhost:8080/AmyClinic/free/recover.action?auth=" + token + "&email=" + email;			
	}

	public String recover() {
		HttpServletRequest request = ServletActionContext.getRequest();
		MemberServices service = new MemberServices();
		System.out.println("RecoverAction recover()");
		
		System.out.println(memberVO.getEmail());
		MemberVO user = service.emailExists(memberVO.getEmail());
		if (null != user){}
		
		return "success";		
		
//		Action takes email, finds it in DB
//
//		If exists, sets token
//		sends token to email

		
		//		if (!allowUser(memberVO.getName(), (String)request.getAttribute("encpw"))) { 
//			
//			this.setMessage("Invalid ID or Password!");
//			return "login";
//		} else if (memberVO.getAct_status() == 2) {
//			this.setMessage("Please Verify your Email by clicking the link in the message sent to the email address you registered!");
//			return "verifyEmail";
//		} else {
//			HttpSession session = request.getSession(); // get HttpSession
//			session.setAttribute("account", memberVO.getName());     // *工作1: 在session內做已經登入過的標識
//			session.setAttribute("member", memberVO);
//			
//			try {                                      //*工作2: 看看有無來源網頁 (-如有:則重導之)                  
//		         String location = (String) session.getAttribute("location");
//		         System.out.println("location(LoginHandler)="+location);
//		         if (location != null) {
//		           session.removeAttribute("location");
//		           HttpServletResponse  response = ServletActionContext.getResponse(); 
//		           response.sendRedirect(location);
//		           return null;
//		         }
//		       }catch (IOException e) { e.printStackTrace();}
//			
//			return "success";
//		}
	}
}
