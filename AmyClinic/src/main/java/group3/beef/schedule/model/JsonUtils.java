package group3.beef.schedule.model;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.annotation.WebServlet;

import org.apache.commons.collections.map.HashedMap;

import com.google.gson.Gson;

import group3.carrie.schedule.model.ScheduleService;
import group3.carrie.schedule.model.ScheduleVO;

public class JsonUtils {

	public String getJsonAll() {
		ScheduleService ss = new ScheduleService();
		List l1 = new LinkedList();
		List<ScheduleVO> list = ss.getAll();

		for (ScheduleVO scheduleVO4 : list) {
			//List m1 = new ArrayList();
			HashedMap m1 = new HashedMap();
			m1.put("getSch_id",scheduleVO4.getSch_id());
			m1.put("Name",scheduleVO4.getEmployeeVO().getName());
			m1.put("C_date",scheduleVO4.getC_date());
			m1.put("C_hours",scheduleVO4.getC_hours());
			m1.put("Appt_num",scheduleVO4.getAppt_num());
			m1.put("Appt_status",scheduleVO4.getAppt_status());
			m1.put("Memo",scheduleVO4.getMemo());
			l1.add(m1);
		}
		Gson gson = new Gson();
		String str = gson.toJson(l1);
		//System.out.println(str);
		return str;

	}

//	public static void main(String[] args) {
//		getJsonAllSchedule();
//	}

}
