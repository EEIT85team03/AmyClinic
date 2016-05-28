package group3.k.members.controller;

import group3.k.members.model.MembersServices;
import group3.k.members.model.MembersVO;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Backstage/MemberServletTest")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberServlet() {  super();  }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("呼叫MemberServletTest=ok");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		//ok ===================新增療程=========================
				if ("add".equals(action)) {
					System.out.println("新增指令");
					List<String> errorMsg = new LinkedList<String>();
					req.setAttribute("errorMsg", errorMsg);
					MembersVO memberVO = new MembersVO();
					try {
						
//						名稱
						String name = req.getParameter("name");
						if (name == null || name.trim().length() >= 10) {errorMsg.add("姓名(10字內): 請勿空白");}
						System.out.println("name="+name);
						memberVO.setName(name);
//						密碼			
						String pwd = req.getParameter("pwd");
						if (pwd == null || pwd.trim().length() >= 10) {errorMsg.add("密碼: 請勿空白");}
						System.out.println("pwd="+pwd);
						memberVO.setPwd(pwd);
//						信箱		
						String email = req.getParameter("email");
//						if (email == null || email.trim().length() >= 10) {errorMsg.add("信箱: 請勿空白");}
						System.out.println("email="+email);
						memberVO.setEmail(email);
//						生日			
						String birthdayStr = req.getParameter("birthday");
						System.out.println("birthdayStr="+birthdayStr);
						Date sql=java.sql.Date.valueOf(birthdayStr);
//						SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
//				        Date parsed = (Date) format.parse(birthdayStr);
//				        @SuppressWarnings("deprecation")
//						java.sql.Date sql = new java.sql.Date(parsed.getDate());
//				        java.sql.Date.valueOf(birthdayStr)
						System.out.println("sql="+sql);
						memberVO.setBirthday(sql);
//						國家			
						String country = req.getParameter("country");
//						if (country == null || country.trim().length() >= 10) {errorMsg.add("城市: 請勿空白");}
						System.out.println("country="+country);
						memberVO.setCountry(country);
//						性別			
						char gender =( req.getParameter("gender")).charAt(0);
//						if (gender == null) {errorMsg.add("性別: 請勿空白");}
						System.out.println("gender="+gender);
						memberVO.setGender(gender);
//						地址		
						String addr = req.getParameter("addr");
//						if (addr == null ) {errorMsg.add("地址: 請勿空白");}
						System.out.println("addr="+addr);
						memberVO.setAddr(addr);
//						電話			
						String phone = req.getParameter("phone");
						if (phone == null ) {errorMsg.add("電話: 請勿空白");}
						System.out.println("phone="+phone);
						memberVO.setPhone(phone);
//						身高									
						Integer height =new Integer( req.getParameter("height"));
//						if (height == null || height.trim().length() >= 10) {errorMsg.add("身高: 請勿空白");}
						System.out.println("height="+height);
						memberVO.setHeight(height);
//						體重			
						Integer mass =new Integer( req.getParameter("mass"));
//						if (mass == null || mass.trim().length() >= 10) {errorMsg.add("體重: 請勿空白");}
						System.out.println("mass="+mass);
						memberVO.setMass(mass);
									 					
						if (!errorMsg.isEmpty()) {
							for (String e : errorMsg) {System.out.println(e);}
							req.setAttribute("memberVO", memberVO);
							RequestDispatcher failureView = req
									.getRequestDispatcher("/Backstage/addMember.jsp");
							failureView.forward(req, res);
							System.out.println("新增錯誤2");
							return;
						}
						/*************************** 2.5開始新增資料 ***************************************/
						MembersServices memberSvc = new MembersServices();
						memberVO = memberSvc.addMember(memberVO);
						System.out.println("新增2");
						/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
						String url = "/Backstage/members.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url);
						successView.forward(req, res);
						System.out.println("新增3-成功");

					} catch (Exception e) {
						System.out.println(e.getMessage());
						e.printStackTrace();
						System.out.println("新增失敗");
						errorMsg.add("新增失敗"+e.getMessage());
						RequestDispatcher failureView = req
								.getRequestDispatcher("/Backstage/addMember.jsp");
						failureView.forward(req, res);
					}
				}
		
		
		
		
		
	}

}
