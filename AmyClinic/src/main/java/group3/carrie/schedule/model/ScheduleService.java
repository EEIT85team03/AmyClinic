package group3.carrie.schedule.model;

import group3.beef.employee.model.EmployeeVO;

import java.sql.Date;
import java.util.List;

public class ScheduleService {
	private ScheduleDAO_interface dao;
	
	public ScheduleService() {
		dao = new ScheduleDAO();
	}
	
	//新增
	public ScheduleVO addSchedule(Integer eid,Date c_date,String c_hours,Integer appt_num,Integer appt_status,String memo) {
		ScheduleVO scheduleVO = new ScheduleVO();
		EmployeeVO empVO = new EmployeeVO();
		
		empVO.setEid(eid);
		scheduleVO.setEmployeeVO(empVO);
		scheduleVO.setC_date(c_date);
		scheduleVO.setC_hours(c_hours);
		scheduleVO.setAppt_num(appt_num);
		scheduleVO.setAppt_status(appt_status);
		scheduleVO.setMemo(memo);
		dao.insert(scheduleVO);
		
		return scheduleVO;
	}
	
	//修改
	public ScheduleVO updateSchedule(Integer sch_id,Integer eid,Date c_date,String c_hours,Integer appt_num,Integer appt_status,String memo) {
		ScheduleVO scheduleVO = new ScheduleVO();
		EmployeeVO empVO = new EmployeeVO();
		
		scheduleVO.setSch_id(sch_id);
		empVO.setEid(eid);
		scheduleVO.setEmployeeVO(empVO);
		scheduleVO.setC_date(c_date);
		scheduleVO.setC_hours(c_hours);
		scheduleVO.setAppt_num(appt_num);
		scheduleVO.setAppt_status(appt_status);
		scheduleVO.setMemo(memo);
		dao.update(scheduleVO);
		
		return scheduleVO;
	}
	
	//刪除
	public void deleteSchedule(Integer sch_id) {
		dao.delete(sch_id);
	}
	
	//查單一
	public ScheduleVO findByPrimaryKey(Integer sch_id) {
		return dao.findByPrimaryKey(sch_id);
	}
	
	//查全部
	public List<ScheduleVO> getAll() { 
		return dao.getAll();
	}


}
