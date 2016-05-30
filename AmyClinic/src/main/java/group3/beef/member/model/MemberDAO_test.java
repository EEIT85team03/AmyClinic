package group3.beef.member.model;
import java.util.List;
import group3.henry.login.model.*;

public class MemberDAO_test {

	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		List<MemberVO> list2 = dao.getAll();
		for (MemberVO aMember : list2) {
			System.out.print(aMember.getMid() + ",");
			System.out.print(aMember.getName() + ",");
			System.out.print(aMember.getEmail() + ",");
			System.out.print(aMember.getPwd() + ",");
			System.out.print(aMember.getPhone() + ",");
			System.out.print(aMember.getAddr() + ",");
			System.out.println("\n");
		}
		
	}
}
