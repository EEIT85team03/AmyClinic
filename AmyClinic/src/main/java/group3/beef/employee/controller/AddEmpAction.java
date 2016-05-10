package group3.beef.employee.controller;
import group3.beef.employee.model.EmployeeVO;
import com.opensymphony.xwork2.ActionSupport;

public class AddEmpAction extends ActionSupport {
	private static final long serialVersionUID = 1L;

	private EmployeeVO employeeVO;

	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}

	public void setEmployeeVO(EmployeeVO employeeVO) {
		this.employeeVO = employeeVO;
	}

}
