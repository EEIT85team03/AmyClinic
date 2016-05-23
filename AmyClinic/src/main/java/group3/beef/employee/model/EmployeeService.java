package group3.beef.employee.model;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

 

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
	public EmployeeVO addEmp(String name, String pwd, String email, Blob photo,
			String education, String experience, String specialty) {
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setName(name);
		employeeVO.setPwd(pwd);
		employeeVO.setEmail(email);
		employeeVO.setPhoto(photo);

//		try {
//			FileInputStream fileInputStream = new FileInputStream("c:\\dog.png");
//			@SuppressWarnings("deprecation")
//			Blob photo1 = Hibernate.createBlob(fileInputStream);
//			employeeVO.setPhoto(photo1);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		employeeVO.setEducation(education);
		employeeVO.setExperience(experience);
		employeeVO.setSpecialty(specialty);
		dao.insert(employeeVO);
		return employeeVO;

	}

	
	
	//更新員工
	public EmployeeVO updateEmp(Integer eid, String name, String pwd, String email, Blob photo,
			String education, String experience, String specialty) {
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setEid(eid);
		employeeVO.setName(name);
		employeeVO.setPwd(pwd);
		employeeVO.setEmail(email);
		employeeVO.setPhoto(photo);
		employeeVO.setEducation(education);
		employeeVO.setExperience(experience);
		employeeVO.setSpecialty(specialty);
		dao.update(employeeVO);
		return employeeVO;

	}

	public void addEmp(EmployeeVO employeeVO) {
		dao.insert(employeeVO);
	}

	public EmployeeVO updateEmp(EmployeeVO employeeVO) {
		dao.update(employeeVO);
		return dao.findByPrimaryKey(employeeVO.getEid());
	}
	
	//員工系統登入
	public EmployeeVO EmpLogin(String mail ,String pwd){
	List<EmployeeVO> list = dao.getAll();
	return null;
	
	}

	 
	 //抓一位員工的圖片
	public InputStream getOneEmployeePic(Integer eid){
		return	dao.findEmpPicByPrimaryKey(eid);
		
	}
	
	// 刪除員工
	public void deleteEmployee(Integer eid) {
		dao.delete(eid);
	}

	// 查一位
	public EmployeeVO getOneEmployee(Integer eid) {
		return dao.findByPrimaryKey(eid);
	}
}
