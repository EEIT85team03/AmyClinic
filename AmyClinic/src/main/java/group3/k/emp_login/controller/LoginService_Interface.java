package group3.k.emp_login.controller;

import group3.k.emp_logn.model.EmployeesVO;
import java.util.List;

public interface LoginService_Interface {
	
	public EmployeesVO validate(Integer eid, String name) ;
	public List<EmployeesVO> getEmployeesList();
	public void addNewEmployees(EmployeesVO employeesVO);
}
