package group3.carrie.app.model;

import group3.henry.login.model.MemberVO;

import java.io.Serializable;
import java.sql.*;

import javax.persistence.*;


@Entity  //要加上@Entity才能成為JPA的一個Entity類別
@Table(name = "Appointments")
public class AppVO implements Serializable {

	private Integer aid;
	private MemberVO memberVO;
	private Integer purpose;
	private Timestamp apt_date;
	private Integer procedureid;
	private String descrip;
	private Integer apt_status;
	private Integer eid;
	
	public AppVO(){
	
	}
	
	
	@Id  
	@SequenceGenerator(name="aidGen", allocationSize=1) 
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="aidGen") 
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	
	@ManyToOne
	@JoinColumn(name = "mid") 
	public MemberVO getMemberVO() {
		return this.memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public Integer getPurpose() {
		return purpose;
	}
	public void setPurpose(Integer purpose) {
		this.purpose = purpose;
	}
	public Timestamp getApt_date() {
		return apt_date;
	}
	public void setApt_date(Timestamp apt_date) {
		this.apt_date = apt_date;
	}
	public Integer getProcedureid() {
		return procedureid;
	}
	public void setProcedureid(Integer procedureid) {
		this.procedureid = procedureid;
	}
	public String getDescrip() {
		return descrip;
	}
	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}
	public Integer getApt_status() {
		return apt_status;
	}
	public void setApt_status(Integer apt_status) {
		this.apt_status = apt_status;
	}
	public Integer getEid() {
		return eid;
	}
	public void setEid(Integer eid) {
		this.eid = eid;
	}
	
	
	
}
