package group3.carrie.appdetail.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import group3.carrie.app.model.AppVO;
import group3.carrie.proc.model.ProcVO;

//對應到AppointmentDetail table
@Entity
@Table(name = "AppointmentDetail")
public class AppDetailVO implements Serializable {
	private Integer ad_id;
//	private Integer procedure_id;
//	private Integer aid;
	//預約明細與預約是多對一的關係
	private AppVO appVO;
	//預約明細與療程是多對一的關係
	private ProcVO procVO;
	
	//沒傳參數的建構子
	public AppDetailVO(){
		
	}
	
	//id產生
	@Id  
	@SequenceGenerator(name="adidGen", allocationSize=1) 
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="adidGen")
	public Integer getAd_id() {
		return ad_id;
	}
	public void setAd_id(Integer ad_id) {
		this.ad_id = ad_id;
	}
	
	//多對一
	@ManyToOne
	@JoinColumn(name = "aid") 
	public AppVO getAppVO() {
		return this.appVO;
	}
	public void setAppVO(AppVO appVO) {
		this.appVO = appVO;
	}
	
	//多對一
	@ManyToOne
	@JoinColumn(name = "procedure_id") 
	public ProcVO getProcVO() {
		return this.procVO;
	}
	public void setProcVO(ProcVO procVO) {
		this.procVO = procVO;
	}
	
	

}
