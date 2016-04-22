package group3.carrie.catagory.model;

import group3.carrie.product.model.ProductVO;

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

@Entity
@Table(name = "Catagory")
public class CatagoryVO {
	private Integer cid;
	private String name;
	private Set<ProductVO> pros = new HashSet<ProductVO>();
	
	public CatagoryVO(){
		
	}
	
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
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER, mappedBy="cataVO")
	@OrderBy("pid asc")
	public Set<ProductVO> getPros() {
		return this.pros;
	}
	public void setPros(Set<ProductVO> pros) {
		this.pros = pros;
	}
	
	

}
