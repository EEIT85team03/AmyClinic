package group3.carrie.product.controller;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;
import group3.beef.encryption.AES_Encryption;
import group3.carrie.product.model.ProductService;
import group3.carrie.product.model.ProductVO;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.hibernate.Hibernate;

@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/Backstage/ProductServlet")
//@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("我有執行00");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// ===================查詢一位員工=========================

		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);

			try {
				String str = req.getParameter("name");
				if (str == null || (str.trim().length() == 0)) {
					errorMsg.add("請輸入商品名稱");
				}
				if (!errorMsg.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Backstage/product.jsp");
					failureView.forward(req, res);
					return;
				}
				Integer pid = null;
				try {
					pid = new Integer(str);
				} catch (Exception e) {
					errorMsg.add("價格格式不正確");
				}
				if (!errorMsg.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Backstage/product.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始查詢資料 *****************************************/
				ProductService proSvc = new ProductService();
				ProductVO productVO = proSvc.getOneProduct(pid);
				/*************************** 2.5員工密碼AES解密 ***************************************/
				AES_Encryption AES = new AES_Encryption();
//				String pwd = AES.getdecrypt(productVO.getPwd());
//				productVO.setPwd(pwd);
				
				if (pid == null) {
					errorMsg.add("查無資料");
				}
				if (!errorMsg.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Backstage/product.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("productVO", productVO);
				RequestDispatcher successView = req
						.getRequestDispatcher("/Backstage/product.jsp");
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsg.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/product.jsp");
				failureView.forward(req, res);
			}
		}

		// ===================新增員工=========================
		if ("addProduct".equals(action)) {
			System.out.println("我有執行0");
			List<String> errorMsg = new LinkedList<String>();
			req.setAttribute("errorMsg", errorMsg);

			try {
				String name = req.getParameter("name");
				if (name == null || name.trim().length() == 0) {
					errorMsg.add("產品名稱: 請勿空白");
				}
				String priceStr = req.getParameter("price");
				if (priceStr == null || priceStr.trim().length() == 0) {
					errorMsg.add("價格: 請勿空白");
				}
//				String pReg = "^[(0-9)]$";
//				if (!priceStr.trim().matches(pReg)) {
//					errorMsg.add("價格: 必須為整數");
//				}

				String discountStr = req.getParameter("discount");
//				if (discount == null || discount.trim().length() == 0) {
//					errorMsg.add("e-mail: 請勿空白");
//				}//折扣可空白？
				String amountStr = req.getParameter("amount");
				String cidStr = req.getParameter("cid");
			
				String descrip = req.getParameter("descrip");
				if (descrip == null || descrip.trim().length() == 0) {
					errorMsg.add("商品描述: 請勿空白");
				}

				String ingredients = req.getParameter("ingredients");
				if (ingredients == null || ingredients.trim().length() == 0) {
					errorMsg.add("商品成分: 請勿空白");
				}

				Part filePart = req.getPart("photo");
				if (filePart.getSize() == 0){
					errorMsg.add("商品照片: 請勿空白");
				}
				InputStream is = filePart.getInputStream();
				int filesize = (int) filePart.getSize();
				if(filesize > 3070200){
					errorMsg.add("商品照片: 大小請勿超過3000KB");
				}
				@SuppressWarnings("deprecation")
				Blob photo = Hibernate.createBlob(is);
				
				int price,discount,amount,cid;
				
				try{
				price = Integer.parseInt(priceStr);
				discount = Integer.parseInt(discountStr);
				amount = Integer.parseInt(amountStr);
				cid = Integer.parseInt(cidStr);
				}catch(Exception e){
					price=0;
					discount=0;cid=0;	amount=0;
				}
				ProductVO productVO = new ProductVO();
				productVO.setName(name);
				productVO.setPrice(price);
				productVO.setDiscount(discount);
				productVO.setDescrip(descrip);
				productVO.setIngredients(ingredients);
				productVO.setPhoto(photo);
				System.out.println("我有執行");
				if (!errorMsg.isEmpty()) {
					System.out.println("我有執行-1");
					for (String e : errorMsg) {
						System.out.println(e);
					}
					req.setAttribute("productVO", productVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Backstage/addProduct.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.5開始新增資料 ***************************************/
				ProductService proSvc = new ProductService();
				productVO = proSvc.addProduct(name,photo,amount,
						 cid,  price,  discount,  descrip,
						 ingredients);
				System.out.println("我有執行1");
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/Backstage/product.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("我有執行2");

			} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
				System.out.println("我有執行-2");
				errorMsg.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/addProduct.jsp");
				failureView.forward(req, res);
			}
		}
		// ===================修改=========================
		if ("update".equals(action)) {
			
//			List<String> errorMsg = new LinkedList<String>();
//			req.setAttribute("errorMsg", errorMsg);
//			Integer pid = new Integer(req.getParameter("pid").trim());
//			try {
//				String ename = req.getParameter("name");
//				if (ename == null || ename.trim().length() == 0) {
//					errorMsg.add("產品名稱: 請勿空白");
//				}
//				String npwd = req.getParameter("pwd");
//				String npwd2 = req.getParameter("pwd2");
//				if (npwd == null || npwd.trim().length() == 0) {
//					errorMsg.add("密碼: 請勿空白");
//				}	
//				if (!npwd.equals(npwd2)){
//					errorMsg.add("密碼: 密碼不一致");
//					}
//				
//				String pwdReg = "^[(a-zA-Z0-9)]{4,10}$";
//				if (!npwd.trim().matches(pwdReg)) {
//					errorMsg.add("密碼:英文字母、數字 , 且長度必需在4到10之間");
//				}
//
//				String email = req.getParameter("email");
//				if (email == null || email.trim().length() == 0) {
//					errorMsg.add("e-mail: 請勿空白");
//				}
//
//				String edu = req.getParameter("edu");
//				if (edu == null || edu.trim().length() == 0) {
//					errorMsg.add("教育程度: 請勿空白");
//				}
//
//				String exp = req.getParameter("exp");
//				if (exp == null || exp.trim().length() == 0) {
//					errorMsg.add("經歷: 請勿空白");
//				}
//
//				String spec = req.getParameter("spec");
//				if (spec == null || spec.trim().length() == 0) {
//					errorMsg.add("專長: 請勿空白");
//				}
//				Part filePart = req.getPart("photo");
//				if (filePart.getSize() == 0){
//					errorMsg.add("照片: 請勿空白");
//				}
//				
//				InputStream is = filePart.getInputStream();
//				int filesize = (int) filePart.getSize();
//				if(filesize > 307200){
//					errorMsg.add("照片: 大小請勿超過300KB");
//				}
//				@SuppressWarnings("deprecation")
//				Blob photo = Hibernate.createBlob(is);
//				
//				
//				
//				EmployeeVO empVO = new EmployeeVO();
//				empVO.setEid(eid);
//				empVO.setName(ename);
//				empVO.setPwd(npwd);
//				empVO.setEmail(email);
//				empVO.setEducation(edu);
//				empVO.setExperience(exp);
//				empVO.setSpecialty(spec);
//				empVO.setPhoto(photo);
//				if (!errorMsg.isEmpty()) {
//					req.setAttribute("empVO", empVO);
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/BeefTest/update_emp_input.jsp");
//					failureView.forward(req, res);
//					return;
//				}
//			
//				/*************************** 2.員工密碼AES加密 ***************************************/
//				AES_Encryption AES = new AES_Encryption();
//				String pwd = AES.getencrypt(npwd);
//				empVO.setPwd(pwd);
//				/*************************** 2.5開始新增資料 ***************************************/
//				EmployeeService empSvc = new EmployeeService();
//				empVO = empSvc
//						.updateEmp(eid, ename, pwd, email, photo, edu, exp, spec);
//				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//				String url = "/BeefTest/GetAllEMP.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
//
//			} catch (Exception e) {
//				errorMsg.add(e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/BeefTest/AddEMP.jsp");
//				failureView.forward(req, res);
//			}
		}
		// ===================刪除一位員工=========================

		if ("delete".equals(action)) {
			List<String> errorMsg = new LinkedList<String>();

			try {
				req.setAttribute("errorMsg", errorMsg);
				Integer pid = new Integer(req.getParameter("pid").trim());
				ProductService proSvc = new ProductService();
				proSvc.deleteProduct(pid);
				String url = "/Backstage/product.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			} catch (Exception e) {
				errorMsg.add("刪除資料失敗" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Backstage/product.jsp");
				failureView.forward(req, res);
			}

		}
	}
}
