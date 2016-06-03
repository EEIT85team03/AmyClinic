package group3.k.chart.controller;

import group3.carrie.orderitems.model.OrderItemsService;
import group3.carrie.orderitems.model.OrderItemsVO;
import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;
import group3.carrie.proc.model.ProcService;
import group3.carrie.proctype.model.ProcTypeService;
import group3.carrie.proctype.model.ProcTypeVO;
import group3.carrie.product.model.ProductService;
import group3.carrie.product.model.ProductVO;
import group3.nick.score.model.ScoreVO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.JSONValue;

import java.sql.*;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@WebServlet("/Backstage/JsonServlet")
public class JsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public JsonServlet() { super(); }
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doPost_OK");
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/json");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");
		//訂單明細
		OrderItemsService	 orderItemsService= new OrderItemsService(); 
		OrderItemsVO orderItemsVO= new OrderItemsVO();
		//訂單明細和產品是多對一
		ProductService productService =new ProductService(); 
		ProductVO productVO;
		//訂單明細和訂單是多對一
		OrdersService ordersService=new OrdersService();
		OrdersVO ordersVO;
		// 找出產品類別
		ProcTypeService  procTypeService=new ProcTypeService();
		ProcTypeVO procTypeVO;
		//============顯現一開始Chart.jsp的畫面=========================
//List產品 全部
		if("熱門預約療程".equals(action)){
			System.out.println("ListAllOrderItems_OK");
			//-------療程名稱
			List<ProcTypeVO> procType=procTypeService.getAll();
			List procName=new LinkedList();
			for(ProcTypeVO proc :procType){
				Map procAllMap=new HashMap();
				procAllMap.put("療程名稱",proc.getName());
																											System.out.println("療程類別名稱"+proc.getName());//test
				procName.add(procAllMap);//療程名稱
			}
			String jsonName = JSONValue.toJSONString(procName);
			out.println(jsonName);				//ALL療程名稱
			System.out.println(jsonName);
			
			//-------預約療程次數
			List<OrderItemsVO> li=orderItemsService.getAll();
			List l1 = new LinkedList();
			for(OrderItemsVO odvo :li){
				Map m1 = new HashMap();
//				m1.put("id", odvo.getId());//訂單明細ID
//				m1.put("oid", odvo.getOrdersVO().getOid());//訂單ID
				m1.put("Eid", odvo.getProductVO().getPid());//產品ID 找出產品類別
				m1.put("Score", odvo.getQuantity());//賣出數量
				m1.put("Comment", odvo.getPrice_per());	
				l1.add(m1);
			}
			String jsonString = JSONValue.toJSONString(l1);
			out.println(jsonString);	
			System.out.println(jsonString);
			//System.out.println(jsonString);
		}
		
	}//doPost
}