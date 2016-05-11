package group3.henry.email.controller;

import javax.servlet.http.*;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class EmailVerifyAction extends ActionSupport {
	private String auth;
	private String email;

	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println("EmailVerifyAction execute method");
		System.out.println(auth);
		System.out.println(email);

		return "success";
	}
}


