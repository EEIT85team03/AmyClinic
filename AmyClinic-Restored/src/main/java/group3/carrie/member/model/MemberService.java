package group3.carrie.member.model;

import group3.henry.login.model.MemberDAO;
import group3.henry.login.model.MemberDAO_interface;
import group3.henry.login.model.MemberVO;

import java.util.List;

public class MemberService {
	
	private MemberDAO_interface dao;
	
	public MemberService(){
		dao = new MemberDAO();
	}
	
	public void update(MemberVO memberVO) {	
		dao.update(memberVO);
		return;
	}
	
	public MemberVO login(String email,String pwd) {
		List<MemberVO> memberList = dao.getAll();
		for (MemberVO mb : memberList){
			if((mb.getEmail().equals(email.trim())) && (mb.getPwd().equals(pwd.trim()))){
				return mb;
			}
		}
		return null;
	}
	
	

}
