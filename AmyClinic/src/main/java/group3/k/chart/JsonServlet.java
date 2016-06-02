package group3.k.chart;

import group3.carrie.orderitems.model.OrderItemsService;
import group3.carrie.orderitems.model.OrderItemsVO;
import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;
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

@WebServlet("/JsonServlet")
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
		//============顯現一開始Chart.jsp的畫面=========================
//List 全部
		if("ListAllOrderItems".equals(action)){
			List<OrderItemsVO> li=orderItemsService.getAll();
			List l1 = new LinkedList();
			for(OrderItemsVO odvo :li){
				Map m1 = new HashMap();
				m1.put("id", odvo.getId());
				m1.put("oid", odvo.getOrdersVO().getOid());
				m1.put("Eid", odvo.getProductVO().getPid());
				m1.put("Score", odvo.getQuantity());
				m1.put("Comment", odvo.getPrice_per());	
				l1.add(m1);
			}
			String jsonString = JSONValue.toJSONString(l1);
			out.println(jsonString);		
		}
		
	}//doPost
}