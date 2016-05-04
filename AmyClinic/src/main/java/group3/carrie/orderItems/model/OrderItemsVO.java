package group3.carrie.orderItems.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import group3.carrie.orders.model.OrdersVO;
import group3.carrie.product.model.ProductVO;

//對應到OrderItems table
@Entity
@Table(name = "OrderItems")
public class OrderItemsVO implements Serializable {
	private Integer id;
//	private Integer oid;
//	private Integer pid;
	private Integer quantity;
	private Integer price_per;
//	private Integer discount;
	
	//訂單明細與訂單是多對一的關係
	private OrdersVO ordersVO;
	//訂單明細與產品是多對一的關係
	private ProductVO productVO;
	
	//沒傳參數的建構子
	public OrderItemsVO() {

	}

	//id產生
	@Id  
	@SequenceGenerator(name="idGen", allocationSize=1) 
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="idGen")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getPrice_per() {
		return price_per;
	}
	public void setPrice_per(Integer price_per) {
		this.price_per = price_per;
	}
	
	//多對一
	@ManyToOne
	@JoinColumn(name = "oid") 
	public OrdersVO getOrdersVO() {
		return this.ordersVO;
	}
	public void setOrdersVO(OrdersVO ordersVO) {
		this.ordersVO = ordersVO;
	}
	
	//多對一
	@ManyToOne
	@JoinColumn(name = "pid") 
	public ProductVO getProductVO() {
		return this.productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	
}
