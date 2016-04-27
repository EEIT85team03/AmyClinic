package group3.henry.login.controller;

import com.opensymphony.xwork2.ActionSupport;

public class MemberPageAction1 extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private String message;

	public String execute() {

		message = "Redirecting to MemberPageAction1 after logging in! ";

		return SUCCESS;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
