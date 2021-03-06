package group3.k.proc.controller;

import group3.carrie.proc.model.ProcService;
import group3.carrie.proc.model.ProcVO;
import group3.carrie.proctype.model.ProcTypeVO;
import group3.carrie.product.model.ProductService;
import group3.carrie.product.model.ProductVO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.hibernate.Hibernate;

@WebServlet("/Backstage/ProcServlet")
public class ProcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProcServlet() {super();}
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);	
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doPost_ok");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		// ===================查詢一個療程=========================
//		if ("getOne_For_Display".equals(action)) {
//		}
		//ok ================查詢單一療程==================
		if ("getOne_For_Update".equals(action)) { // 來自procedures.jsp的請求		
			System.out.println("查詢指令");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				System.out.println("try要求更新");
				
				/***************************1.接收請求參數****************************************/
				Integer procedure_id = new Integer(req.getParameter("procedure_id"));
				System.out.println("procedure_id = "+procedure_id);
				/***************************2.開始查詢資料****************************************/
				ProcService procSvc = new ProcService();
				ProcVO procVO = procSvc.getOneProc(procedure_id);
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("procVO", procVO);         // 資料庫取出的productVO物件,存入req
				String url = "/Backstage/updateProcedures.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 Backstage/updateProduct.jsp
				successView.forward(req, res);
				System.out.println("查詢一筆療程");
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				System.out.println("無法取得要修改的資料 = " + e.getMessage());
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/procedures.jsp");
				failureView.forward(req, res);
			}
		}
		//ok ===================新增療程=========================
		if ("addProc".equals(action)) {
			System.out.println("新增指令");
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);
			ProcTypeVO procTypeVO=new ProcTypeVO();
			try {
//				療程類別	
				Integer pType_id= new Integer( req.getParameter("pType_id"));
				System.out.println("pType_id="+pType_id);

//				療程名稱
				String name = req.getParameter("name");
				if (name == null || name.trim().length() == 0) {
					errorMsg.add("療程名稱: 請勿空白");
				}
				System.out.println("name="+name);
				
//				療程價格			
				Integer fee = new Integer(req.getParameter("fee"));
//				if (fee <= 0 || fee.equals(0)) {
//					errorMsg.add("療程價格: 請勿空白");
//				}
				System.out.println("fee="+fee);
				
				ProcVO procVO = new ProcVO();
				procVO.setProcTypeVO(procTypeVO);
				procVO.setName(name);
				procVO.setFee(fee);
				System.out.println("新增1");
				if (!errorMsg.isEmpty()) {
					System.out.println("新增錯誤");
					for (String e : errorMsg) {
						System.out.println(e);
					}
					req.setAttribute("procVO", procVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Backstage/addProcedures.jsp");
					failureView.forward(req, res);
					System.out.println("新增錯誤2");
					return;
				}
				/*************************** 2.5開始新增資料 ***************************************/
				ProcService procSvc = new ProcService();
				procVO = procSvc.addProc(name, pType_id, fee);
				System.out.println("新增2");
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/Backstage/procedures.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("新增3-成功");

			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
				System.out.println("新增失敗");
				errorMsg.add("新增失敗"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/addProcedures.jsp");
				failureView.forward(req, res);
			}
		}
		// ===================送出修改=========================
		if ("update".equals(action)) {			
			System.out.println("接收update");
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);
			try {
				Integer procedure_id = new Integer(req.getParameter("procedure_id"));
				System.out.println("療程編號="+procedure_id);
//				療程類別	
				Integer pType_id= new Integer( req.getParameter("pType_id"));
				System.out.println("療程類別="+pType_id);
//				療程名稱
				String name = req.getParameter("name");
				if (name == null || name.trim().length() == 0) {
					errorMsg.add("療程名稱: 請勿空白");
				}
				System.out.println("療程名稱="+name);
				
//				療程價格			
				Integer fee = new Integer(req.getParameter("fee"));
//				if (fee <= 0 || fee.equals(0)) {
//					errorMsg.add("療程價格: 請勿空白");
//				}
				System.out.println("療程價格="+fee);
				
				ProcVO procVO = new ProcVO();
				ProcTypeVO procTypeVO= new ProcTypeVO();
				procVO.setProcedure_id(procedure_id);
				procVO.setName(name);
				procVO.setFee(fee);
				procVO.setProcTypeVO(procTypeVO);
				System.out.println("修改-0");
				if (!errorMsg.isEmpty()) {
					System.out.println("修改-1");
					for (String e : errorMsg) {
						System.out.println(e);
					}
					req.setAttribute("procVO", procVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Backstage/updateProcedures.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.5開始新增資料 ***************************************/
				
				ProcService procSvc = new ProcService();
				procVO = procSvc.updateProc(procedure_id, name, pType_id,fee);
				System.out.println("修改執行");
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/Backstage/procedures.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("修改成功");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("修改錯誤-2"+e.getMessage());
				errorMsg.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/updateProcedures.jsp");
				failureView.forward(req, res);
			}
		}
		//ok一半 ===================刪除商品=========================
		if ("delete".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);
			String url = "/Backstage/updateProcedures.jsp";
			try {
				Integer procedure_id = new Integer(req.getParameter("procedure_id").trim());
				System.out.println(procedure_id);
				
				ProcService procSvc = new ProcService();
				procSvc.deleteProc(procedure_id);				
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("刪除成功");
			} catch (Exception e) {
				errorMsg.add("刪除資料失敗" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/procedures.jsp");
				failureView.forward(req, res);
			}
		}
	}
}