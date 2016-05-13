package group3.henry.email.model;

import group3.henry.login.model.MemberDAO;
import group3.henry.login.model.MemberVO;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class VerifyService {
	static private MemberDAO dao = new MemberDAO();
	static private List<MemberVO> memberList = new ArrayList<MemberVO>();	

	public VerifyService() {
		if (memberList.isEmpty()) 
			memberList = this.getAll(); 	
	}
	
	public Boolean verify(String email, String token) {
		System.out.println("VerifyService");
		for (MemberVO mb : memberList) {
			if (mb.getVerify()!=null && !mb.getVerify().isEmpty()){
				if (mb.getEmail().trim().equals(email.trim()) && mb.getVerify().trim().equals(token.trim()) ) {
					HttpServletRequest request = ServletActionContext.getRequest();
					HttpSession session = request.getSession();
					session.setAttribute("memberVO", mb);
					mb.setAct_status(1);
					mb.setVerify("");
					dao.update(mb);
					return true;
				}
			}
		}
		return false;
	}
	
	public List<MemberVO> getAll() {
		List<MemberVO> list = null;
		list = dao.getAll();
		return list;
	}
	
	//testing
	public static void main(String[] args){

		VerifyService dao = new VerifyService();
		
		List<MemberVO> list = dao.getAll();
		for (MemberVO aMem : list) {
			System.out.print(aMem.getName() + ",");
			System.out.print(aMem.getPwd());

			System.out.println();
		}
	}
}
