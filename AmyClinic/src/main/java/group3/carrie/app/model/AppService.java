package group3.carrie.app.model;

import group3.henry.login.model.MemberVO;

import java.sql.Timestamp;

public class AppService {
	private AppDAO_interface aDao;
	
	public AppService(){
		aDao=new AppDAO();
			
	}
	
	public AppVO addApp(Integer mid,Integer purpose,Timestamp apt_date,Integer procedureid,String descrip,Integer apt_status){
		AppVO appVO = new AppVO();
		MemberVO mVO=new MemberVO();
		mVO.setMid(mid);
		appVO.setMemberVO(mVO);
		appVO.setPurpose(purpose);
		appVO.setApt_date(apt_date);
		appVO.setProcedureid(procedureid);
		appVO.setDescrip(descrip);
		appVO.setApt_status(apt_status);
		
		aDao.insert(appVO);
		return appVO;
	}
}
