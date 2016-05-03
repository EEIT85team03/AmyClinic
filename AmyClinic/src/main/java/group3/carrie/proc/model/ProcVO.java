package group3.carrie.proc.model;

import group3.carrie.appdetail.model.AppDetailVO;
import group3.carrie.proctype.model.ProcTypeVO;

import java.io.Serializable;
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

//對應到Procedures table
@Entity
@Table(name = "Procedures")
public class ProcVO implements Serializable {
	private Integer procedure_id;
	private String name;
//	private Integer pType_id;
	
	//療程與預約明細是一對多的關係
	private Set<AppDetailVO> appDetailVO = new HashSet<AppDetailVO>();
	//療程與療程分類是多對一的關係
	private ProcTypeVO procTypeVO;
	
	
	//沒傳參數的建構子
	public ProcVO() {

	}
	
	//id產生
	@Id  
	@SequenceGenerator(name="procidGen", allocationSize=1) 
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="procidGen")
	public Integer getProcedure_id() {
		return procedure_id;
	}
	public void setProcedure_id(Integer procedure_id) {
		this.procedure_id = procedure_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	//一對多
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="procVO")
	@OrderBy("ad_id asc")
	public Set<AppDetailVO> getAppDetailVO() {
		return this.appDetailVO;
	}
	public void setAppDetailVO(Set<AppDetailVO> appDetailVO) {
		this.appDetailVO = appDetailVO;
	}
	
	//多對一
	@ManyToOne
	@JoinColumn(name = "pType_id") 
	public ProcTypeVO getProcTypeVO() {
		return this.procTypeVO;
	}
	public void setProcTypeVO(ProcTypeVO procTypeVO) {
		this.procTypeVO = procTypeVO;
	}
	
	

}
