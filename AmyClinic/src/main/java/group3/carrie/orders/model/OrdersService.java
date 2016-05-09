package group3.carrie.orders.model;

import group3.carrie.orderitems.model.OrderItemsVO;
import group3.carrie.product.model.ProductVO;
import group3.henry.login.model.MemberVO;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class OrdersService {
	
	private OrdersDAO_interface dao;
	
	public OrdersService() {
		dao = new OrdersDAO();
	}
	
	//普通新增
//	public OrdersVO addOrders(Integer mid,String recipient,Integer total,String addr,String phone,String email,Timestamp odate,Integer ostatus,Integer del_status,Integer payment,Integer discount) {
//		
//		OrdersVO ordersVO = new OrdersVO();
//		MemberVO memberVO = new MemberVO();
//		
//		memberVO.setMid(mid);
//		ordersVO.setRecipient(recipient);
//		ordersVO.setTotal(total);
//		ordersVO.setAddr(addr);
//		ordersVO.setPhone(phone);
//		ordersVO.setEmail(email);
//		ordersVO.setOdate(odate);
//		ordersVO.setOstatus(ostatus);
//		ordersVO.setDel_status(del_status);
//		ordersVO.setPayment(payment);
//		ordersVO.setDiscount(discount);
//		ordersVO.setMemberVO(memberVO);
//		dao.insert(ordersVO);
//		
//		return ordersVO;
//	}
	
	//訂單主檔+訂單明細新增(需再研究)
	public OrdersVO addOrders(Integer mid,String recipient,Integer total,String addr,String phone,String email,Timestamp odate,Integer ostatus,Integer del_status,Integer payment,Integer discount) {
		OrdersVO ordersVO = new OrdersVO();
		MemberVO memberVO = new MemberVO();
		ProductVO productVO1 = new ProductVO();
		ProductVO productVO2 = new ProductVO();
		Set<OrderItemsVO> set1 = new HashSet<OrderItemsVO>();
		
		OrderItemsVO orderIT1 = new OrderItemsVO();
		productVO1.setPid(5);
		orderIT1.setPrice_per(600);
		orderIT1.setQuantity(5);
		orderIT1.setProductVO(productVO1);
		orderIT1.setOrdersVO(ordersVO);
		
		OrderItemsVO orderIT2 = new OrderItemsVO();
		productVO2.setPid(4);
		orderIT2.setPrice_per(700);
		orderIT2.setQuantity(6);
		orderIT2.setProductVO(productVO2);
		orderIT2.setOrdersVO(ordersVO);
		
		set1.add(orderIT1);
		set1.add(orderIT2);
		
		memberVO.setMid(mid);
		ordersVO.setRecipient(recipient);
		ordersVO.setTotal(total);
		ordersVO.setAddr(addr);
		ordersVO.setPhone(phone);
		ordersVO.setEmail(email);
		ordersVO.setOdate(odate);
		ordersVO.setOstatus(ostatus);
		ordersVO.setDel_status(del_status);
		ordersVO.setPayment(payment);
		ordersVO.setDiscount(discount);
		ordersVO.setMemberVO(memberVO);
		ordersVO.setOrderItems(set1);
		dao.insert(ordersVO);
		
		return ordersVO;
		
	}
	
	//修改
	public OrdersVO updateOrders(Integer oid,Integer mid,String recipient,Integer total,String addr,String phone,String email,Timestamp odate,Integer ostatus,Integer del_status,Integer payment,Integer discount) {
		
		OrdersVO ordersVO = new OrdersVO();
		MemberVO memberVO = new MemberVO();
		
		ordersVO.setOid(oid);
		memberVO.setMid(mid);
		ordersVO.setRecipient(recipient);
		ordersVO.setTotal(total);
		ordersVO.setAddr(addr);
		ordersVO.setPhone(phone);
		ordersVO.setEmail(email);
		ordersVO.setOdate(odate);
		ordersVO.setOstatus(ostatus);
		ordersVO.setDel_status(del_status);
		ordersVO.setPayment(payment);
		ordersVO.setDiscount(discount);
		ordersVO.setMemberVO(memberVO);
		dao.update(ordersVO);
		
		return dao.findByPrimaryKey(oid);
	}
	
	//刪除
	public void deleteOrders(Integer oid) {
		dao.delete(oid);
	}
	
	//查單一
	public OrdersVO getOneOrders(Integer oid) {
		return dao.findByPrimaryKey(oid);
	}
	
	//查全部
	public List<OrdersVO> getAll() {
		return dao.getAll();
	}
	
	//查訂單明細
	public Set<OrderItemsVO> getOrderItemsByOid(Integer oid) {
		return dao.getOrderItemsByOid(oid);
	}

}
