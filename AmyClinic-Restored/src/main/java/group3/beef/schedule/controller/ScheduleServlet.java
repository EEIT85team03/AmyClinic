package group3.beef.schedule.controller;

import group3.carrie.schedule.model.ScheduleService;
import group3.carrie.schedule.model.ScheduleVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

import com.google.gson.Gson;

@WebServlet("/schedule/Scheduleservlet")
public class ScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ScheduleServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setHeader("Access-Control-Allow-Origin", "*");
		res.setHeader("content-type", "text/html;charset=UTF-8");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String action = req.getParameter("action");
		
		if ("getall".equals(action)) {				//抓出全部排班
			ScheduleService ss = new ScheduleService();
			List l1 = new LinkedList();
			List<ScheduleVO> list = ss.getAll();

			for (ScheduleVO scheduleVO : list) {
				//List m1 = new ArrayList();
				HashedMap m1 = new HashedMap();
				m1.put("getSch_id",scheduleVO.getSch_id());
				m1.put("Name",scheduleVO.getEmployeeVO().getName());
				m1.put("C_date",scheduleVO.getC_date());
				m1.put("C_hours",scheduleVO.getC_hours());
				m1.put("Appt_num",scheduleVO.getAppt_num());
				m1.put("Appt_status",scheduleVO.getAppt_status());
				m1.put("Memo",scheduleVO.getMemo());
				l1.add(m1);
			}
			
			String str = gson.toJson(l1);
			out.println(str);
			return;

		}
		if ("bydate".equals(action)) { 					 //用日期查詢
			//System.out.println("跑bydate");
			String strDate =req.getParameter("date");
			System.out.println(strDate);
			java.sql.Date date = java.sql.Date.valueOf(strDate);
			System.out.println(date);

			ScheduleService ss = new ScheduleService();
			List l1 = new LinkedList();
			List<ScheduleVO> list = ss.findByDate(date);

			for (ScheduleVO scheduleVO : list) {
				//List m1 = new ArrayList();
				HashedMap m1 = new HashedMap();
				m1.put("getSch_id",scheduleVO.getSch_id());
				m1.put("Name",scheduleVO.getEmployeeVO().getName());
				m1.put("C_date",scheduleVO.getC_date());
				m1.put("C_hours",scheduleVO.getC_hours());
				m1.put("Appt_num",scheduleVO.getAppt_num());
				m1.put("Appt_status",scheduleVO.getAppt_status());
				m1.put("Memo",scheduleVO.getMemo());
				l1.add(m1);
				}
			String str = gson.toJson(l1);
			out.println(str);
			return;

		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		doGet(req, res);

	}

}
