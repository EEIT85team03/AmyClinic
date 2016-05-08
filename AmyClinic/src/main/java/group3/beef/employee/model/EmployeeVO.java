package group3.beef.employee.model;

import group3.carrie.app.model.AppVO;

import java.io.Serializable;
import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
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
@Table(name = "Employees")
public class EmployeeVO implements Serializable {
	private Integer eid;
	private String name;
	private String pwd;
	private String email;
	private Blob photo;
	private String education;
	private String experience;
	private String specialty;
	//員工和預約是一對多
	private Set<AppVO> apps = new HashSet<AppVO>();
	
	public EmployeeVO(){
		
	}

	@Id
	@Column(name = "eid")
	@SequenceGenerator(name="eidgen", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="eidgen")  
	public Integer getEid() {
		return eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}
	
	

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
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

	@OneToMany(fetch=FetchType.EAGER, mappedBy="employeeVO")
	@OrderBy("aid asc")
	public Set<AppVO> getApps() {
		return apps;
	}

	public void setApps(Set<AppVO> apps) {
		this.apps = apps;
	}

	
}
