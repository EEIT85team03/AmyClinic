package group3.henry.register.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import group3.henry.global.utility.Mailer;
import group3.henry.global.utility.TokenGenerator;
import group3.henry.login.model.MemberServices;
import group3.henry.login.model.MemberVO;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport{
	private static final String HEADER = "AmyClinic Registration Confirmation";
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
		return "Thank you for registering on our site! Please click the link below to validate your email!" 
				+ nl + nl + "http://localhost:8080/AmyClinic/free/verify.action?auth=" + token + "&email=" + email;			
	}
	
	public String register(){
		MemberServices register = new MemberServices();
		Mailer m = new Mailer();
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println(register.emailExists(memberVO.getEmail()));
		TokenGenerator gen = new TokenGenerator();
		
		if (register.emailExists(memberVO.getEmail())!=null){
			this.setMessage("This Email " +memberVO.getEmail() + " has already been registered!");
			System.out.println("Email in use");
			return INPUT;
		} else {
			if (request.getAttribute("encpw")!=null)
				memberVO.setPwd((String)request.getAttribute("encpw"));
			System.out.println(memberVO.getEmail() + " has not been registered.");
			memberVO.setAct_status(2); // status of 2 = awaiting email verification
			
			String token = gen.secureToken().toUpperCase();
			memberVO.setVerify(token);		

			m.send(memberVO.getName(), memberVO.getEmail(), HEADER, compose(token, memberVO.getEmail()));
			
			register.addMember(memberVO);
			
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
