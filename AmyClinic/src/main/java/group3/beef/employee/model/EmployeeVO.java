package group3.beef.employee.model;

import java.sql.Blob;

public class EmployeeVO {
	private Integer eid;
	private String name;
	private Blob photo;
	private String education;
	private String experience;
	private String specialty;
	
		
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

}
