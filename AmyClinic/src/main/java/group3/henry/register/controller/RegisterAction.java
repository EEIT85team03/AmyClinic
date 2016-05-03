package group3.henry.register.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import group3.henry.login.model.MemberVO;
import group3.henry.register.model.RegisterDAO;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport{
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

	public String register(){
		RegisterDAO register = new RegisterDAO();
		HttpServletRequest request = ServletActionContext.getRequest();
		
		if (register.emailExists(memberVO.getEmail())){
			this.setMessage("This Email has already been registered!");
			return INPUT;
		} else {
			if (request.getAttribute("encpw")!=null)
				memberVO.setPwd((String)request.getAttribute("encpw"));
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
