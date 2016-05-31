package group3.beef.app_back.controller;

import group3.beef.employee.model.EmployeeVO;
import group3.carrie.app.model.AppService;
import group3.carrie.app.model.AppVO;
import group3.carrie.appdetail.model.AppDetailVO;
import group3.henry.login.model.MemberDAO;
import group3.henry.login.model.MemberVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

/**
 * Servlet implementation class App_BackServlet
 */
@WebServlet("/app_back/App_BackServlet")
public class App_BackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public App_BackServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("call App_BackServlet");
		res.setHeader("Access-Control-Allow-Origin", "*");
		res.setHeader("content-type", "text/html;charset=UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if(action.equals("fmid")){
			System.out.println("呼叫fmid");
			String sMid = req.getParameter("mid");
			int mid = Integer.parseInt(sMid);
		PrintWriter out = res.getWriter();
		MemberDAO mdao = new MemberDAO();
		MemberVO memVO = mdao.findByPrimaryKey(mid);
		List<HashedMap> l1 = new LinkedList<HashedMap>();
		
		
		HashedMap m1 = new HashedMap();
		m1.put("mid", memVO.getMid().toString());
		m1.put("name", memVO.getName());
		m1.put("name", memVO.getName());
		m1.put("email", memVO.getEmail());
		m1.put("bday", memVO.getBirthday().toString());
		m1.put("cuntry", memVO.getCountry());
		m1.put("addr", memVO.getAddr());
		m1.put("phone", memVO.getPhone());
		m1.put("height", memVO.getHeight().toString());
		m1.put("mass", memVO.getMass().toString());
		m1.put("act_satus", memVO.getAct_status().toString());
		m1.put("num_trans", memVO.getNum_trans().toString());
		m1.put("num_treatment", memVO.getNum_treatment().toString());
		m1.put("num_visits", memVO.getNum_visits().toString());
		m1.put("total_spent", memVO.getTotal_spent().toString());
		m1.put("last_visit", memVO.getLast_visit());
		m1.put("join_date", memVO.getJoin_date());
		l1.add(m1);
		
		
		Set<AppVO> set =memVO.getAppVO();
		List<HashedMap> l2 = new LinkedList<HashedMap>();
		for(AppVO a : set){
			HashedMap m2 = new HashedMap();
			m2.put("eid", a.getEmployeeVO().getEid().toString());
			m2.put("aid", a.getAid().toString());
			m2.put("purpose", a.getPurpose().toString());
			m2.put("apt_date", a.getApt_date().toString());
			m2.put("apt_time", a.getApt_time());
			m2.put("descrip", a.getDescrip());
			m2.put("apt_status", a.getApt_status().toString());
			l2.add(m2);
		}
		
		
		HashedMap m3 = new HashedMap();
		m3.put("app", l2);
		m3.put("mem", l1);
		
		
		
	
		
		Gson gson = new Gson();
		//String str = gson.toJson(l1);
		String str = gson.toJson(m3);
		out.println(str);
		}
		
		
		
		
		
//		Gson gson = new GsonBuilder().registerTypeAdapter(MemberVO.class, new JsonSerializer<MemberVO>() {
//
//			@Override
//			public JsonElement serialize(MemberVO src, Type typeOfSrc,
//					JsonSerializationContext context) {
//				JsonObject o = new JsonObject();
//				o.addProperty("mid",src.getMid());
//				o.addProperty("name",src.getName());
//				o.addProperty("email",src.getEmail());
//				Set<AppVO> set =src.getAppVO();
//				List<String> procname = new ArrayList<String>();
//				for(AppVO a : set){
//					String dec = a.getDescrip();
//					String apt_dat = a.getApt_date().toString();
//					o.addProperty("dec", dec);
//					o.addProperty("apt_dat", apt_dat);
//				}
//				JsonElement jsonProc = context.serialize(procname);
//				o.add("procName", jsonProc);
//				return o;
//			}}).create();
//		String str = gson.toJson(memVO);
//		out.print(str);
	}
	
//	public static void main(String[] args) {
//		MemberDAO mdao = new MemberDAO();
//		MemberVO memVO = mdao.findByPrimaryKey(1001);
//		Set<AppVO> set =memVO.getAppVO();
//		for(AppVO a : set){
//			System.out.print(a.getApt_time() + ",");
//			System.out.print(a.getApt_time() + ",");
//			System.out.print(a.getDescrip() + ",");
//			System.out.println(a.getEmployeeVO().getEid()+",");
//			
//		}
//		
//		
//		
//	}

}
