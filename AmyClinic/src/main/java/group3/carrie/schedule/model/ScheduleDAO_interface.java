package group3.carrie.schedule.model;

import java.util.List;

public interface ScheduleDAO_interface {
	public void insert(ScheduleVO scheduleVO);
	public void update(ScheduleVO scheduleVO);
	public void delete(Integer sch_id);
	public ScheduleVO findByPrimaryKey(Integer sch_id);
	public List<ScheduleVO> getAll();

}
