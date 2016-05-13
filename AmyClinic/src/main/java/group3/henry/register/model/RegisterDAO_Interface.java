package group3.henry.register.model;

import group3.henry.login.model.MemberVO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

public interface RegisterDAO_Interface {
	public void addMember(MemberVO memberVO);	    
	public MemberVO emailExists(String email);

}
