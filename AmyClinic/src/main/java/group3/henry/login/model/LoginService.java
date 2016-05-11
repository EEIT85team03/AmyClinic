package group3.henry.login.model;

import java.util.*;

public class LoginService {
	static private MemberDAO dao = new MemberDAO();
	static private List<MemberVO> memberList = new ArrayList<MemberVO>();	

	public LoginService() {
		if (memberList.isEmpty()) 
			memberList = this.getAll(); 	
	}
	
	public MemberVO validate(String id, String pw) {			
		for (MemberVO mb : memberList) {
			if (mb.getName().trim().equals(id.trim()) && mb.getPwd().trim().equals(pw.trim()) ) {
				return mb;
//				String encrypedString = GlobalService.encryptString(password.trim());
//				String pswd = GlobalService.getMD5Endocing(encrypedString);
//				String mbpswd = mb.getPassword().trim();
//				if (mbpswd.equals(pswd)) {
//					return mb;
//				}
			}
		}
		return null;
	}
	
	
	public List<MemberVO> getMemberList() { 
		return memberList;
	}
	
	public void addNewMember(MemberVO memberVO){
		memberList.add(memberVO);
	}
	
	public List<MemberVO> getAll() {
		List<MemberVO> list = null;
		list = dao.getAll();
		return list;
	}
	
	//testing
	public static void main(String[] args){

		LoginService dao = new LoginService();
		
		List<MemberVO> list = dao.getAll();
		for (MemberVO aMem : list) {
			System.out.print(aMem.getName() + ",");
			System.out.print(aMem.getPwd());

			System.out.println();
		}
	}
}
