package group3.k.order.controller;

import group3.carrie.orders.model.OrdersService;
import group3.carrie.orders.model.OrdersVO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Backstage/updateOrder")
public class updateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public updateOrder() { super(); }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/json");
		//PrintWriter out = res.getWriter();
		
//		HttpSession session =req.getSession(false);
		System.out.println("doPost_ok");
		
		OrdersService ordersService=new OrdersService();
		
		Integer oid =new Integer( req.getParameter("oid"));
		OrdersVO ordersVO=ordersService.getOneOrders(oid);
		
		
		String odate=req.getParameter("odate");
		String total = req.getParameter("total");
		Integer ostatus =new Integer(req.getParameter("ostatus"));
		ordersVO.setOstatus(ostatus);
		Integer payment =new Integer( req.getParameter("payment"));
		ordersVO.setPayment(payment);
		Integer del_status =new Integer(req.getParameter("del_status"));
		ordersVO.setDel_status(del_status);
		
		System.out.println("編號 :"+oid+"日期 :"+odate+"總金額 :"+total+"訂單狀態 :"+ostatus+"付款狀態 :"+payment+"配送狀態 :"+del_status);
		
		
		ordersService.updateOrders(ordersVO);
		
//		String url = "/Backstage/orders.jsp";
//		RequestDispatcher successView = req.getRequestDispatcher(url);
//		successView.forward(req, res);
		System.out.println("修改-成功");
	}

}
