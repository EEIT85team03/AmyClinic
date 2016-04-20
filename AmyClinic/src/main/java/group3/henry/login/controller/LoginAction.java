package group3.henry.login.controller;

import group3.henry.login.model.MemberVO;

public class LoginAction {
	private MemberVO memberVO;
	
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String login(){
		System.out.println("login() called");
		return "success";
	}
	
}
