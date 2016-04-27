package group3.henry.register.model;

import group3.henry.login.model.MemberVO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

public interface RegisterDAO_Interface {
	public int saveMember(MemberVO memberVO, InputStream is, long size, String filename)
	    throws SQLException ;
	public boolean emailExists(String id);

}
