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
		//----------------------------------------------------
		ProcTypeVO procTypeVO=null;
		ProcService procSvc = new ProcService();
		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);
		/***************************1.接收請求參數****************************************/
		Integer	procedure_id ;
		String name;
//		String name = req.getParameter("name");
		String url = "/Backstage/updateProcedures.jsp";
		
//		System.out.println("接收請求參數id"+procedure_id+name);
		// ===================查詢一個療程=========================
//		if ("getOne_For_Display".equals(action)) {
//		}
		// ================查詢單一療程==================
		if ("getOne_For_Update".equals(action)) { // 來自addProcedures.jsp的請求		
			try {
				/***************************1.接收請求參數****************************************/
				procedure_id = new Integer(req.getParameter("procedure_id"));
				System.out.println("接收請求參數id"+procedure_id);
				/***************************2.開始查詢資料****************************************/
				ProcVO procVO = procSvc.getOneProc(procedure_id);
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("procVO", procVO);         // 資料庫取出的productVO物件,存入req
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 Backstage/updateProduct.jsp
				successView.forward(req, res);
				System.out.println("查詢一筆療程");
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/procedures.jsp");
				failureView.forward(req, res);
			}
		}
		// ===================新增商品=========================
		if ("addProcedures".equals(action)) {
			System.out.println("新增指令");
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);
			try {
				procedure_id = new Integer(req.getParameter("procedure_id"));
//				療程類別	
				
				//Integer test=procTypeVO.getpType_id();
				//System.out.println(test);
				
				String pType_idStr = req.getParameter("pType_id");
				
//				療程名稱
				name = req.getParameter("name");
				if (name == null || name.trim().length() == 0) {
					errorMsg.add("療程名稱: 請勿空白");
				}
//				療程價格			
				String feeStr = req.getParameter("fee");
				int fee,pType_id;
				try{fee = Integer.parseInt(feeStr);
				pType_id=Integer.parseInt(pType_idStr);
				}catch(Exception e){
					fee=0;
					pType_id=0;
				}
				
				ProcVO procVO = new ProcVO();
				//procVO.setProcTypeVO(procTypeVO);
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
							.getRequestDispatcher("/Backstage/procedures.jsp");
					failureView.forward(req, res);
					System.out.println("新增2");
					return;
				}
				/*************************** 2.5開始新增資料 ***************************************/
				
				procVO = procSvc.addProc(name, pType_id, fee);
				System.out.println("新增3");
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("新增4-成功");

			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
				System.out.println("新增失敗");
				errorMsg.add("療程名稱重複");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/addProcedures.jsp");
				failureView.forward(req, res);
			}
		}
		// ===================修改=========================
		Integer pType_id,fee;
		if ("update".equals(action)) {			
			System.out.println("接收修改");
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);
			try {
				procedure_id = new Integer(req.getParameter("procedure_id"));
//				療程類別	
				
				//Integer test=procTypeVO.getpType_id();
				//System.out.println(test);
				
				name = req.getParameter("name");
				if (name == null || name.trim().length() == 0) {
					errorMsg.add("療程名稱: 請勿空白");
				}
				String feeStr = req.getParameter("fee");
				String pType_idStr = req.getParameter("pType_id");
				
				try{fee = Integer.parseInt(feeStr);
				pType_id=Integer.parseInt(pType_idStr);
				}catch(Exception e){
					fee=0;
					pType_id=0;
				}
				
				ProcVO procVO = new ProcVO();
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
							.getRequestDispatcher("/Backstage/procedures.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.5開始新增資料 ***************************************/
				System.out.println("pType_id="+pType_id);
				
				procVO = procSvc.updateProc(procedure_id, name, pType_id);
				System.out.println("修改執行");
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("修改成功");

			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
				System.out.println("修改錯誤-2");
				errorMsg.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/updateProcedures.jsp");
				failureView.forward(req, res);
			}
		}
		// ===================刪除商品=========================
		if ("delete".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();

			try {
				req.setAttribute("errorMsg", errorMsg);
				procedure_id = new Integer(req.getParameter("procedure_id").trim());
			
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
