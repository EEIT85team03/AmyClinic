package group3.beef.employee.model;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.util.List;

import org.hibernate.Hibernate;

public class EmployeeService {

	private EmployeeDAO_interface dao;

	public EmployeeService() {
		dao = new EmployeeDAO();
	}

	// 查全部
	public List<EmployeeVO> getAll() {
		return dao.getAll();
	}

	// 新增員工
	public EmployeeVO addEmp(Integer eid, String name, String pwd,
			String email, Blob photo, String education, String experience,
			String specialty) {
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setEid(eid);
		employeeVO.setName(name);
		employeeVO.setPwd(pwd);
		employeeVO.setEmail(email);

		try {
			FileInputStream fileInputStream = new FileInputStream("c:\test.jpg");
			@SuppressWarnings("deprecation")
			Blob photo1 = Hibernate.createBlob(fileInputStream);
			employeeVO.setPhoto(photo1);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		employeeVO.setEducation(education);
		employeeVO.setExperience(experience);
		employeeVO.setSpecialty(specialty);
		return employeeVO;

	}
	
	public void addEmp(EmployeeVO employeeVO){
		dao.insert(employeeVO);
	}

	// 更新員工
	public EmployeeVO updateEmp(String name, String pwd, String email,
			Blob photo, String education, String experience, String specialty) {
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setName(name);
		employeeVO.setPwd(pwd);
		employeeVO.setEmail(email);

		try {
			FileInputStream fileInputStream = new FileInputStream("c:\test.jpg");
			@SuppressWarnings("deprecation")
			Blob photo1 = Hibernate.createBlob(fileInputStream);
			employeeVO.setPhoto(photo1);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		employeeVO.setEducation(education);
		employeeVO.setExperience(experience);
		employeeVO.setSpecialty(specialty);
		return employeeVO;

	}

	// 刪除員工
	public void deleteEmployee(Integer eid) {
		dao.delete(eid);
	}

	//查一位
	public EmployeeVO getOneEmployee(Integer eid) {
		return dao.findByPrimaryKey(eid);
	}
}
