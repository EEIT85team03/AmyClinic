package group3.henry.login.model;

import java.io.Serializable;
import java.sql.*;

import javax.persistence.*;




// represents a single member
@Entity 
@Table(name = "Members")  
public class MemberVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer   mid;
	private String 	  name;
	private String 	  pwd;
	private String 	  email;
	private Date 	  birthday;
	private String	  country;
	private Character gender;
	private String	  addr;
	private Integer   phone;
	private Integer   height;
	private Integer   mass;
	private Blob	  photo;
	private Boolean	  act_status;
	private Integer   num_trans;
	private Integer   num_treatment;
	private Integer   num_visits;
	private Integer   total_spent;
	private Integer   reward_pts;
	private Date      last_visit;
	private String	  memo;
	private Date	  join_date;
	
	public MemberVO() {
		super();
	}	

	public MemberVO(Integer mid, String name, String pwd, String email, Date birthday, String country,
					Character gender, String addr, Integer phone, Integer height, Integer mass,
					Blob photo, Boolean act_status, Integer num_trans, Integer num_treatment,
					Integer num_visits, Integer total_spent, Integer reward_pts, Date last_visit,
					String memo, Date join_date) { //all info
		super();
		this.mid = mid;
		this.name = name;
		this.pwd = pwd;
		this.email = email;
		this.birthday = birthday;
		this.country = country;
		this.gender = gender;
		this.addr = addr;
		this.phone = phone;
		this.height = height;
		this.mass = mass;
		this.photo = photo;
		this.act_status = act_status;
		this.num_trans = num_trans;
		this.num_treatment = num_treatment;
		this.num_visits = num_visits;
		this.total_spent = total_spent;
		this.reward_pts = reward_pts;
		this.last_visit = last_visit;
		this.memo = memo;
		this.join_date = join_date;
	}
	
	public MemberVO(int mid, String name, String email, String pw) { // minimum required info
		super();
		this.mid = mid;
		this.name = name;
		this.email = email;
	}
	
	@Id  
	@SequenceGenerator(name="midGen", allocationSize=1) 
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="midGen")       
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Character getGender() {
		return gender;
	}
	public void setGender(Character gender) {
		this.gender = gender;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Integer getPhone() {
		return phone;
	}
	public void setPhone(Integer phone) {
		this.phone = phone;
	}
	public Integer getHeight() {
		return height;
	}
	public void setHeight(Integer height) {
		this.height = height;
	}
	public Integer getMass() {
		return mass;
	}
	public void setMass(Integer mass) {
		this.mass = mass;
	}
	public Blob getPhoto() {
		return photo;
	}
	public void setPhoto(Blob photo) {
		this.photo = photo;
	}
	public Boolean getAct_status() {
		return act_status;
	}
	public void setAct_status(Boolean act_status) {
		this.act_status = act_status;
	}
	public Integer getNum_trans() {
		return num_trans;
	}
	public void setNum_trans(Integer num_trans) {
		this.num_trans = num_trans;
	}
	public Integer getNum_treatment() {
		return num_treatment;
	}
	public void setNum_treatment(Integer num_treatment) {
		this.num_treatment = num_treatment;
	}
	public Integer getNum_visits() {
		return num_visits;
	}
	public void setNum_visits(Integer num_visits) {
		this.num_visits = num_visits;
	}
	public Integer getTotal_spent() {
		return total_spent;
	}
	public void setTotal_spent(Integer total_spent) {
		this.total_spent = total_spent;
	}
	public Integer getReward_pts() {
		return reward_pts;
	}
	public void setReward_pts(Integer reward_pts) {
		this.reward_pts = reward_pts;
	}
	public Date getLast_visit() {
		return last_visit;
	}
	public void setLast_visit(Date last_visit) {
		this.last_visit = last_visit;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	
}
