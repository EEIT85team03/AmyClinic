package group3.henry.register.model;

import group3.henry.login.model.MemberVO;

import java.io.*;
import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.*;

public class RegisterDAO implements RegisterDAO_Interface {

	@Override
	public int saveMember(MemberVO memberVO, InputStream is, long size,
			String filename) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean emailExists(String id) {
		// TODO Auto-generated method stub
		return false;
	}
//	private List<MemberVO> memberList;
//	LoginServiceDB lsdb;
//	private DataSource ds = null;
//
//	public RegisterDAO() throws NamingException, SQLException {
//		Context ctx = new InitialContext();
//		ds = (DataSource) ctx.lookup(GlobalService.JNDI_DB_NAME);
//		lsdb = new LoginServiceDB();
//		memberList = lsdb.getMemberList();
//	}
//
//	synchronized public boolean idExists(String id) throws IOException {
//		boolean exist = false; // 檢查id是否已經存在
//		for (MemberBean mb : memberList) {
//			if (mb.getMemberId().equals(id.trim())) {
//				exist = true;
//				break;
//			}
//		}
//		return exist;
//	}
//
//	synchronized public int saveMember(MemberBean mb, InputStream is,
//			long size, String filename) throws SQLException {
//		PreparedStatement pstmt1 = null;
//		Connection conn = ds.getConnection();
//		int r = 0;
//		try {
//			String sql1 = "insert into eMember "
//					+ " (memberID, name, password, address, email, tel, userType, "
//					+ " experience, register, totalAmt, memberImage, fileName) "
//					+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//
//			pstmt1 = conn.prepareStatement(sql1);
//			pstmt1.setString(1, mb.getMemberId());
//			pstmt1.setString(2, mb.getName());
//
//			String encrypedString = GlobalService.encryptString(mb.getPassword());
//			pstmt1.setString(3, GlobalService.getMD5Endocing(encrypedString));
//			pstmt1.setString(4, mb.getAddress());
//			pstmt1.setString(5, mb.getEmail());
//			pstmt1.setString(6, mb.getTel());
//			pstmt1.setString(7, mb.getUserType());
//			pstmt1.setInt(8, mb.getExperience());
//			java.sql.Timestamp now = new java.sql.Timestamp(
//					System.currentTimeMillis());
//			pstmt1.setTimestamp(9, now);
//			pstmt1.setDouble(10, mb.totalAmt);
//			// 設定Image欄位
//			// pstmt1.setBlob(11, is, size); // 此方法目前未支援
//			pstmt1.setBinaryStream(11, is, size);
//			pstmt1.setString(12, filename);
//			r = pstmt1.executeUpdate();
//			if (r == 1) {
//				// 寫入成功，應該將MemberBean mem立即加入LoginService的memberList內
//				// 否則，最新的User將無法登入
//				mb.setPassword(GlobalService.getMD5Endocing(encrypedString));
//				memberList.add(mb);
//			} else {
//				throw new SQLException("RegisterServiceDB:新增記錄數 : 0");
//			}
//			// System.out.println("新增一筆eMember紀錄，是否成功=" + r);
//		} finally {
//			// 關閉相關的物件
//			if (pstmt1 != null) {
//				try {
//					pstmt1.close();
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//			if (conn != null) {
//				try {
//					conn.close();
//				} catch (Exception e) {
//					System.err.println("關閉相關物件時發生例外: " + e);
//				}
//			}
//		}
//		return r;
//	}
}
