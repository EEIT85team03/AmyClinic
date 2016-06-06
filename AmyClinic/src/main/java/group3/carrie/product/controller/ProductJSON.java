package group3.carrie.product.controller;

import group3.carrie.product.model.ProductService;
import group3.carrie.product.model.ProductVO;
import group3.k.chart.model.SpaToSalesService;
import group3.k.chart.model.SpaToSalesVO;

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

@WebServlet("/Backstage/ProductJSON")
public class ProductJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductJSON() {super(); }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doPost_OK");
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/json");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");
		//熱門產品類別
		ProductService	 productService= new ProductService();
		//SpaToSalesVO spaToSalesVO= new SpaToSalesVO();
		//============顯現一開始Chart.jsp的畫面=========================
//List產品 全部
		
		if("熱門產品".equals(action)){
			System.out.println("熱門產品_OK");
			//-------療程名稱
			List<ProductVO> productAll=productService.getAll();//取得tab全部
			List hotprod=new LinkedList();
			
			//HashMap procAllMap=new HashMap();//for( )裝入map轉
			for(ProductVO productVO :  productAll ){//將table拆解 用vo分裝
//				HashedMap prodAllMap = new HashedMap();//for( )裝入map轉
//				HashedMap.put("a",productAll.getYear());	
//				HashedMap.put("b", productAll.getMonth());
//				HashedMap.put("c", productAll.getName());
//				//procAllMap.put("療程id", spa.getpType_id());
//				HashedMap.put("d", productAll.getCounts());
//				hotprod.add(HashedMap);//療程名稱
//				
//System.out.println( spa.getYear()+"年"+spa.getMonth()+"月"+spa.getName()+"科"+spa.getCounts()+"次;");//test
			}
//			String jsonName = JSONValue.toJSONString(spaToSales);//變成jsonName
//			out.println(jsonName);				
//			System.out.println(jsonName);
			String s="select top 5 (sum(OrderItems.quantity)) as quantity  ,  Products.name from OrderItems "+
					"inner join Products on OrderItems.pid = Products.pid"+
					"group by Products.name"+
					"ORDER BY quantity DESC";
			Gson gson = new Gson();
//		   String str = gson.toJson(spaToSales);
//			out.println(str);
//			System.out.println(str);
	}
		}//doPost
}