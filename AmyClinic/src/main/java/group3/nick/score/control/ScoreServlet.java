package group3.nick.score.control;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;
import group3.carrie.product.model.ProductVO;
import group3.nick.score.model.ScoreService;
import group3.nick.score.model.ScoreVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;


@WebServlet("/Score/ScoreServlet")
public class ScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ScoreServlet() {
        super();

    }


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/json");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");
		
		//對應Score Table的Service方法
		ScoreService daoScore = new ScoreService();
		//對應EmployeeService Table的Service方法
		EmployeeService	dao=new EmployeeService();
		
//============顯現一開始Score.jsp的畫面=========================		
		//JSON 回傳資料
		if ("getEmpScore".equals(action)){
			List<EmployeeVO> emp =dao.getAll();
			List l1 = new LinkedList();
			for(EmployeeVO empvo :emp ){
				Map m1 = new HashMap();
				m1.put("eid", empvo.getEid());
				m1.put("name", empvo.getName());
				List<ScoreVO> scoreVO=daoScore.getEmpScore(empvo.getEid());	
				int times =0;
				double sum = 0;
				double avg =0;
				for(ScoreVO score : scoreVO){
					sum += score.getScores();
					times++;
				}
				//判斷是否有被評論過的紀錄
				if(times !=0){
				avg = (sum/times);
				String s=new Double(avg).toString().substring(0,3);
				m1.put("avgScore", s);
				
				}else{
					m1.put("avgScore","0");
				}
				
				//平均星數 給哪張圖片
				if(avg<0.5){
					m1.put("avgPicture","0star.jpg");
				}else if(avg<1.5){
					m1.put("avgPicture", "1star.jpg");
				}else if(avg<2.5){
					m1.put("avgPicture", "2star.jpg");
				}else if (avg<3.5){
					m1.put("avgPicture", "3star.jpg");
				}else if(avg<4.5){
					m1.put("avgPicture", "4star.jpg");
				}else{
					m1.put("avgPicture", "5star.jpg");
				}
				
				
				
				l1.add(m1);
			}
			String jsonString = JSONValue.toJSONString(l1);
			out.println(jsonString);

			}
		
		
//查詢單一位員工的所有流言及評分		
		if ("getOne_Score".equals(action)){
			String sEid=req.getParameter("eid");
			int eid=Integer.parseInt(sEid);
			
			//查詢該員工在評分清單裡的資料
			List<ScoreVO> scoreVO =daoScore.getEmpScore(eid);
			
			//查詢該員工的基本資料
			EmployeeVO employeeVO=dao.getOneEmployee(eid);
			
			//拿到score.jsp的avgPicture評分資料
			String avgPicture=req.getParameter("avgPicture");
			
			//拿到score.jsp的
			String avgScore=req.getParameter("avgScore");
			
			
			req.setAttribute("avgPicture",avgPicture);
			req.setAttribute("avgScore",avgScore);
			req.setAttribute("scoreVO", scoreVO);
			req.setAttribute("employeeVO",employeeVO);
			String str = "/Score/ListOneScore.jsp";
			RequestDispatcher rd= req.getRequestDispatcher(str);
			rd.forward(req, res);
			
			
		}
		
		
		
//轉移到撰寫評論
		if ("add_score".equals(action)){
			String sEid=req.getParameter("eid");
			int eid=Integer.parseInt(sEid);
			EmployeeVO employeeVO=dao.getOneEmployee(eid);
			req.setAttribute("eid", eid);
			
			
			
			
			
			
			
		}
		
//k-hotProduct
		if ("hotProduct".equals(action)){
			Integer pid=new Integer(req.getParameter("pid"));
			
			
			ProductVO productVO=new ProductVO() ;
			
			String str = "/Backstage/hotProduct.jsp";
			RequestDispatcher rd= req.getRequestDispatcher(str);
			rd.forward(req, res);
		
		
		
		}
		
				
}	
	}