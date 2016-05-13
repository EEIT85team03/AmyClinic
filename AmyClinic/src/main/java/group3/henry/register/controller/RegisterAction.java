package group3.henry.register.controller;

import java.math.BigInteger;
import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import group3.henry.email.utility.Mailer;
import group3.henry.login.model.MemberVO;
import group3.henry.register.model.RegisterDAO;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport{
	private MemberVO memberVO;	
	private String message;
	private final String HEADER = "AmyClinic Registration Confirmation";
	
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

	private String secureToken(){
		SecureRandom random = new SecureRandom();
		 return new BigInteger(250, random).toString(32);
	}
	
	private String compose(String token, String email){
		String nl = System.getProperty("line.separator");
		return "Thank you for registering on our site! Please click the link below to validate your email!" 
				+ nl + nl + "http://localhost:8080/AmyClinic/free/verify.action?auth=" + token + "&email=" + email;			
	}
	
	public String register(){
		RegisterDAO register = new RegisterDAO();
		Mailer m = new Mailer();
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println(register.emailExists(memberVO.getEmail()));
		if (register.emailExists(memberVO.getEmail())!=null){
			this.setMessage("This Email has already been registered!");
			System.out.println("Email in use");
			return INPUT;
		} else {
			if (request.getAttribute("encpw")!=null)
				memberVO.setPwd((String)request.getAttribute("encpw"));
			System.out.println("Why is the check not working?");
			memberVO.setAct_status(2); // status of 2 = awaiting email verification
			
			String token = secureToken().toUpperCase();
			memberVO.setVerify(token);		
			
			register.addMember(memberVO);
			
			m.send(memberVO.getName(), memberVO.getEmail(), HEADER, compose(token, memberVO.getEmail()));
			return SUCCESS;	
		}
		
	}
	public void validate() {
		String fileType = memberVO.getPhotoContentType();
		if (fileType != null){
			fileType = fileType.substring(0,5);
			System.out.println(fileType);
		    if (!fileType.equals("image") ){
		    	addFieldError("memberVO.photo","Invalid File Type; must upload an image!");
		    }
	    }	     
	}
}
