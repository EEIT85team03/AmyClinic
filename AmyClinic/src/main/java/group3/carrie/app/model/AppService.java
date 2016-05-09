package group3.carrie.app.model;

import group3.beef.employee.model.EmployeeVO;
import group3.carrie.appdetail.model.AppDetailVO;
import group3.henry.login.model.MemberVO;

import java.util.List;
import java.util.Set;

public class AppService {
	
	private AppDAO_interface dao;
	
	public AppService() {
		dao = new AppDAO();
	}
		
	//新增
	public AppVO addApp(Integer mid,Integer purpose,java.sql.Date apt_date,String apt_time,String procedureid,String descrip,Integer apt_status,Integer eid){
		
		AppVO appVO = new AppVO();
		MemberVO memberVO = new MemberVO();
		EmployeeVO employeeVO = new EmployeeVO();
		
		appVO.setPurpose(purpose);
		appVO.setApt_date(apt_date);
		appVO.setApt_time(apt_time);
		appVO.setProcedureid(procedureid);
		appVO.setDescrip(descrip);
		appVO.setApt_status(apt_status);
		memberVO.setMid(mid);
		employeeVO.setEid(eid);
		appVO.setMemberVO(memberVO);
		appVO.setEmployeeVO(employeeVO);
		
		dao.insert(appVO);
	
		return appVO;
	}
	
//預約主檔+預約明細新增(需再研究)
//	public AppVO addApp(Integer mid,Integer purpose,java.sql.Date apt_date,String apt_time,String procedureid,String descrip,Integer apt_status,Integer eid){
//		
//		AppVO appVO = new AppVO();
//		MemberVO memberVO = new MemberVO();
//		EmployeeVO employeeVO = new EmployeeVO();
//		ProcVO procVO1 = new ProcVO();
//		ProcVO procVO2 = new ProcVO();
//		Set<AppDetailVO> set1 = new HashSet<AppDetailVO>();
//		
//		AppDetailVO appDT1 = new AppDetailVO();
//		procVO1.setProcedure_id(1);
//		appDT1.setProcVO(procVO1);
//		appDT1.setAppVO(appVO);
//		
//		
//		AppDetailVO appDT2 = new AppDetailVO();
//		procVO2.setProcedure_id(10);
//		appDT2.setProcVO(procVO2);
//		appDT2.setAppVO(appVO);
//		
//		set1.add(appDT1);
//		set1.add(appDT2);
//		
//		appVO.setPurpose(purpose);
//		appVO.setApt_date(apt_date);
//		appVO.setApt_time(apt_time);
//		appVO.setProcedureid(procedureid);
//		appVO.setDescrip(descrip);
//		appVO.setApt_status(apt_status);
//		memberVO.setMid(mid);
//		employeeVO.setEid(eid);
//		appVO.setMemberVO(memberVO);
//		appVO.setEmployeeVO(employeeVO);
//		appVO.setAppDetails(set1);
//		
//		dao.insert(appVO);
//	
//		return appVO;
//	}
	
	
	
	//修改
	public AppVO updateApp(Integer aid,Integer mid,Integer purpose,java.sql.Date apt_date,String apt_time,String procedureid,String descrip,Integer apt_status,Integer eid){
		
		AppVO appVO = new AppVO();
		MemberVO memberVO = new MemberVO();
		EmployeeVO employeeVO = new EmployeeVO();
		
		appVO.setAid(aid);
		appVO.setPurpose(purpose);
		appVO.setApt_date(apt_date);
		appVO.setApt_time(apt_time);
		appVO.setProcedureid(procedureid);
		appVO.setDescrip(descrip);
		appVO.setApt_status(apt_status);
		memberVO.setMid(mid);
		employeeVO.setEid(eid);
		appVO.setMemberVO(memberVO);
		appVO.setEmployeeVO(employeeVO);
		dao.update(appVO);
		
		return dao.findByPrimaryKey(aid);
	}
	
	//刪除
	public void deleteApp(Integer aid){
		dao.delete(aid);
	}
	
	//查單一
	public AppVO getOneApp(Integer aid){
		return dao.findByPrimaryKey(aid);
	}

	//查全部
	public List<AppVO> getAll(){
		return dao.getAll();
	}
	
	
	//查預約明細
	public Set<AppDetailVO> getAppDetailByAid(Integer aid){
		return dao.getAppDetailByAid(aid);
	}

}

