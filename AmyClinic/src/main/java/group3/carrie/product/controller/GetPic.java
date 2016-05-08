package group3.carrie.product.controller;

import group3.carrie.product.model.ProductService;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetPic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("image/*");
		ProductService prodServ = new ProductService();
		String no = req.getParameter("num");
		int num = Integer.parseInt(no);
		try (
				InputStream in = prodServ.getPhotoByPrimaryKey(6);
				OutputStream out = res.getOutputStream();
					
				) {
			if(in != null) {
				byte[] data = new byte[8192];
				int len = 0;
				while ((len = in.read(data)) != -1) {
					out.write(data, 0, len);
				}
			}
		}
		
		
	
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req,res);
	}

}
