package group3.henry.register.controller;

import group3.henry.login.model.MemberVO;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport{
	private MemberVO memberVO;	
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String register(){
		return SUCCESS;
	}
}
