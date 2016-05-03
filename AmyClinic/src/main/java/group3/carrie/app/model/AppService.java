package group3.carrie.app.model;

import group3.henry.login.model.MemberVO;

import java.sql.Timestamp;
import java.util.List;

public class AppService {
	private AppDAOInterface aDao;
	
	public AppService(){
		aDao=new AppDAO();
			
	}
	
	public AppVO addApp(Integer mid,Integer purpose,Timestamp apt_date,String procedureid,String descrip,Integer apt_status){
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
	
	public AppVO updateApp(Integer aid,Integer mid,Integer purpose,Timestamp apt_date,String procedureid,String descrip,Integer apt_status){
		AppVO appVO = new AppVO();
		appVO.setAid(aid);
		MemberVO mVO=new MemberVO();
		mVO.setMid(mid);
		appVO.setMemberVO(mVO);
		appVO.setPurpose(purpose);
		appVO.setApt_date(apt_date);
		appVO.setProcedureid(procedureid);
		appVO.setDescrip(descrip);
		appVO.setApt_status(apt_status);
		
		aDao.update(appVO);
		return aDao.findByPrimaryKey(aid);
	}
	
	public void deleteApp(Integer aid){
		aDao.delete(aid);
	}
	
	public AppVO getOneApp(Integer aid) {
		return aDao.findByPrimaryKey(aid);
	}

	public List<AppVO> getAll() {
		return aDao.getAll();
	}
}
