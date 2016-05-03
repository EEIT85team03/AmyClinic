package group3.carrie.proctype.model;

import group3.carrie.proc.model.ProcVO;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

//對應到ProcedureType table
@Entity
@Table(name = "ProcedureType")
public class ProcTypeVO implements Serializable {
	private Integer pType_id;
	private String name;
	//療程分類與療程是一對多的關係
	private Set<ProcVO> procVO=new HashSet<ProcVO>();
	
	//沒傳參數的建構子
	public ProcTypeVO() {

	}
	
	//id產生
	@Id  
	@SequenceGenerator(name="pTypeidGen", allocationSize=1) 
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="pTypeidGen")
	public Integer getpType_id() {
		return pType_id;
	}
	public void setpType_id(Integer pType_id) {
		this.pType_id = pType_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	//一對多
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="procTypeVO")
	@OrderBy("procedure_id asc")
	public Set<ProcVO> getProcVO() {
		return this.procVO;
	}
	public void setProcVO(Set<ProcVO> procVO) {
		this.procVO = procVO;
	}
	
	

}
