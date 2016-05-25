package group3.henry.login.model;

import hibernate.util.HibernateUtil;

import java.util.*;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class MemberServices {
	static private MemberDAO dao = new MemberDAO();
	static private List<MemberVO> memberList = new ArrayList<MemberVO>();	

	public MemberServices() {
		if (memberList.isEmpty()) //populates memberlist on init
			memberList = this.getAll(); 	
	}
	
	public void addMember(MemberVO memberVO) {	
		dao.insert(memberVO);
		return;
	}
	public void update(MemberVO memberVO) {	
		dao.update(memberVO);
		return;
	}
	
	public MemberVO validate(String id, String pw) { // validates user name / password against current memberlist
		System.out.println("MemberServices validate(id, pw)");
		memberList = this.getAll();
		for (MemberVO mb : memberList) {
			if (mb.getName().trim().equals(id.trim()) && mb.getPwd().trim().equals(pw.trim()) ) {
				System.out.println(mb.getPwd().trim() + " " + pw.trim());
				return mb;
			}
		}
		return null;
	}
	
	public MemberVO emailExists(String email) { //determines if entered email exists in memberlist		
		List results = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Criteria cr = session.createCriteria(MemberVO.class);
			cr.add(Restrictions.eq("email", email));
			results = cr.list(); 		
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		System.out.println(results);
					
		if (results.isEmpty())
			return null;		
		else
			return (MemberVO)results.get(0);			
	}
	
	public List<MemberVO> getMemberList() { 
		return memberList;
	}
		
	public List<MemberVO> getAll() {
		List<MemberVO> list = null;
		list = dao.getAll();
		return list;
	}

//	public void addNewMember(MemberVO memberVO){
//		memberList.add(memberVO);
//	}
	
	
	//testing
	public static void main(String[] args){

		MemberServices dao = new MemberServices();
		
		List<MemberVO> list = dao.getAll();
		for (MemberVO aMem : list) {
			System.out.print(aMem.getName() + ",");
			System.out.print(aMem.getPwd());

			System.out.println();
		}
	}
}
