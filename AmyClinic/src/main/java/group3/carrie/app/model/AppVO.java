package group3.carrie.app.model;

import group3.beef.employee.model.EmployeeVO;
import group3.carrie.appdetail.model.AppDetailVO;
import group3.henry.login.model.MemberVO;

import java.io.Serializable;
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

//對應到Appointments table
@Entity
@Table(name = "Appointments")
public class AppVO implements Serializable {

	private Integer aid;
//	private Integer mid;
	//預約與會員編號是多對一的關係
	private MemberVO memberVO;
	private Integer purpose;
	private Timestamp apt_date;
	private String procedureid;
	private String descrip;
	private Integer apt_status;
	//預約與員工編號是多對一的關係
	//private Integer eid;
	private EmployeeVO empVO;
	//預約與預約明細是一對多的關係
	private Set<AppDetailVO> appDetailVO = new HashSet<AppDetailVO>();

	//沒傳參數的建構子
	public AppVO() {

	}

	//id產生
	@Id
	@SequenceGenerator(name = "aidGen", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "aidGen")
	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	//多對一
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

	public String getProcedureid() {
		return procedureid;
	}

	public void setProcedureid(String procedureid) {
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

	
	//多對一
	@ManyToOne
	@JoinColumn(name = "eid")
	public EmployeeVO getEmpVO() {
		return empVO;
	}

	public void setEmpVO(EmployeeVO empVO) {
		this.empVO = empVO;
	}

	//一對多
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "appVO")
	@OrderBy("ad_id asc")
	public Set<AppDetailVO> getAppDetailVO() {
		return this.appDetailVO;
	}

	public void setAppDetailVO(Set<AppDetailVO> appDetailVO) {
		this.appDetailVO = appDetailVO;
	}

}
