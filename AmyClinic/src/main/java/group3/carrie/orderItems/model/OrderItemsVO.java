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

@Entity
@Table(name = "OrderItems")
public class OrderItemsVO implements Serializable {
	private Integer id;
	private Integer oid;
	private Integer pid;
	private Integer quantity;
	private Integer price_per;
//	private Integer discount;
	
	private OrdersVO ordersVO;
	private ProductVO productVO;

	@Id  
	@SequenceGenerator(name="idGen", allocationSize=1) 
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="idGen")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
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
	
	@ManyToOne
	@JoinColumn(name = "oid") 
	public OrdersVO getOrdersVO() {
		return ordersVO;
	}
	public void setOrdersVO(OrdersVO ordersVO) {
		this.ordersVO = ordersVO;
	}
	
	@ManyToOne
	@JoinColumn(name = "pid") 
	public ProductVO getProductVO() {
		return productVO;
	}
	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	
}
