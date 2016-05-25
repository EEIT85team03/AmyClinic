package group3.nick.score.control;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;
import group3.nick.score.model.ScoreService;
import group3.nick.score.model.ScoreVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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
		req.setCharacterEncoding("UTF-8");;
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");
		ScoreService daoScore = new ScoreService();
		EmployeeService	dao=new EmployeeService();
		if ("getEmpScore".equals(action)){
			List<EmployeeVO> emp =dao.getAll();
			List l1 = new LinkedList();
			for(EmployeeVO empvo :emp ){
				Map m1 = new HashMap();
				m1.put("eid", empvo.getEid());
				m1.put("name", empvo.getName());
				m1.put("photo", empvo.getPhoto());
				l1.add(m1);
			}
			String jsonString = JSONValue.toJSONString(l1);
			out.println(jsonString);
			
			
			
			
			
//			List<ScoreVO> empscore ;
//			List<Integer> eid = new ArrayList<Integer>();
//			List<EmployeeVO> emp =dao.getAll();
//			for(EmployeeVO empvo :emp ){
//				//將全部的員工 塞入 List<Integer> eid 裡面
//				eid.add(empvo.getEid());
//			}
//			List l1 = new LinkedList();
//			for(int i=0;i<eid.size();i++){
//				empscore=daoScore.getEmpScore(eid.get(i));
//				for( ScoreVO test: empscore){
//					Map m1 = new HashMap();
//					m1.put("EmpName", test.getEmp().getName().toString());
//					m1.put("Eid", test.getEmp().getEid().toString());
//					m1.put("Comment", test.getComment().toString());
//					m1.put("MbName", test.getMb().getName());
//					m1.put("Mid", test.getMb().getMid().toString());
//					m1.put("ScoreDate", test.getScoreDate().toString());
//					m1.put("Scores", test.getScores().toString());
//					l1.add(m1);
//				}
//
//				
//			}
//			String jsonString = JSONValue.toJSONString();
//			out.println(jsonString);

			
			}
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}


