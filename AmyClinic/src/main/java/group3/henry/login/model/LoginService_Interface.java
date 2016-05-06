package group3.henry.login.model;

import java.util.List;

public interface LoginService_Interface {
	
	public MemberVO validate(String id, String pw) ;
	public List<MemberVO> getMemberList();
	public void addNewMember(MemberVO memberVO);
}
