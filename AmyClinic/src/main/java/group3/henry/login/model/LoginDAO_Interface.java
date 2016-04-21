package group3.henry.login.model;

import java.sql.SQLException;
import java.util.List;

public interface LoginDAO_Interface {
	
	public MemberVO validate(String id, String pw) ;
	public List<MemberVO> getMemberList();
	public void addNewMember(MemberVO memberVO);
}
