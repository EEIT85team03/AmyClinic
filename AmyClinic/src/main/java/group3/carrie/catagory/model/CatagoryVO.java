package group3.carrie.catagory.model;

import group3.carrie.product.model.ProductVO;

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

//對應到Catagory table
@Entity
@Table(name = "Catagory")
public class CatagoryVO implements Serializable {
	private Integer cid;
	private String name;
	//產品分類與產品是一對多的關係
	private Set<ProductVO> pros = new HashSet<ProductVO>();
	
	//沒傳參數的建構子
	public CatagoryVO(){
		
	}
	
	//id產生
	@Id  
	@SequenceGenerator(name="cidGen", allocationSize=1) 
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="cidGen") 
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	//一對多
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="cataVO")
	@OrderBy("pid asc")
	public Set<ProductVO> getPros() {
		return this.pros;
	}
	public void setPros(Set<ProductVO> pros) {
		this.pros = pros;
	}
	
	

}
