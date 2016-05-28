package group3.k.members.model;

import hibernate.util.HibernateUtil;

import java.util.*;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class MembersServices {
	static private MembersDAO dao = new MembersDAO();
	static private List<MembersVO> memberList = new ArrayList<MembersVO>();	

	public MembersServices() {
		if (memberList.isEmpty()) //populates memberlist on init
			memberList = this.getAll(); 	
	}
	
	public MembersVO addMember(MembersVO memberVO) {	
		dao.insert(memberVO);
		return memberVO;
	}
	public void update(MembersVO memberVO) {	
		dao.update(memberVO);
		return;
	}
	
	public MembersVO validate(String id, String pw) { // validates user name / password against current memberlist
		System.out.println("MemberServices validate(id, pw)");
		memberList = this.getAll();
		for (MembersVO mb : memberList) {
			if (mb.getName().trim().equals(id.trim()) && mb.getPwd().trim().equals(pw.trim()) ) {
				System.out.println(mb.getPwd().trim() + " " + pw.trim());
				return mb;
			}
		}
		return null;
	}
	
	public MembersVO emailExists(String email) { //determines if entered email exists in memberlist		
		List results = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Criteria cr = session.createCriteria(MembersVO.class);
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
			return (MembersVO)results.get(0);			
	}
	
	public List<MembersVO> getMemberList() { 
		return memberList;
	}
		
	public List<MembersVO> getAll() {
		List<MembersVO> list = null;
		list = dao.getAll();
		return list;
	}

//	public void addNewMember(MemberVO memberVO){
//		memberList.add(memberVO);
//	}
	
	
	//testing
	public static void main(String[] args){

		MembersServices dao = new MembersServices();
		
		List<MembersVO> list = dao.getAll();
		for (MembersVO aMem : list) {
			System.out.print(aMem.getName() + ",");
			System.out.print(aMem.getPwd());

			System.out.println();
		}
	}
}
