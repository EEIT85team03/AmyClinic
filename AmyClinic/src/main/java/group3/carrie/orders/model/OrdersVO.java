package group3.carrie.orders.model;

import group3.carrie.orderItems.model.OrderItemsVO;
import group3.henry.login.model.MemberVO;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "Orders")
public class OrdersVO {
	private Integer oid;
//	private Integer mid;
	private String recipient;
	private Integer total;
	private String addr;
	private Long phone;
	private String email;
	private Timestamp odate;
	private Integer ostatus;
	private Integer del_status;
	private Integer payment;
	private Integer discount;
	
	private MemberVO memberVO;
	private Set<OrderItemsVO> orderItsVO = new HashSet<OrderItemsVO>();
	
	@Id  
	@SequenceGenerator(name="oidGen", allocationSize=1) 
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="oidGen")
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getOdate() {
		return odate;
	}
	public void setOdate(Timestamp odate) {
		this.odate = odate;
	}
	public Integer getOstatus() {
		return ostatus;
	}
	public void setOstatus(Integer ostatus) {
		this.ostatus = ostatus;
	}
	public Integer getDel_status() {
		return del_status;
	}
	public void setDel_status(Integer del_status) {
		this.del_status = del_status;
	}
	public Integer getPayment() {
		return payment;
	}
	public void setPayment(Integer payment) {
		this.payment = payment;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	
	@ManyToOne
	@JoinColumn(name = "mid") 
	public MemberVO getMemberVO() {
		return this.memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="ordersVO")
	@OrderBy("id asc")
	public Set<OrderItemsVO> getOrderItsVO() {
		return this.orderItsVO;
	}
	public void setOrderItsVO(Set<OrderItemsVO> orderItsVO) {
		this.orderItsVO = orderItsVO;
	}
	
	

}
