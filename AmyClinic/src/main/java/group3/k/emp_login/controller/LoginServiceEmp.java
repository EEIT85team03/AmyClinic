package group3.k.emp_login.controller;

import group3.k.emp_logn.model.EmployeesDAO;
import group3.k.emp_logn.model.EmployeesVO;

import java.util.*;

public class LoginServiceEmp implements LoginServiceEmp_Interface {
	static private EmployeesDAO dao = new EmployeesDAO();
	static private List<EmployeesDAO> employeesList = new ArrayList<EmployeesDAO>();	

	public LoginServiceEmp() {
//		if (employeesList.isEmpty()) 
//		employeesList = this.getAll(); 	
	}
	
	public EmployeesVO validate(Integer eid, String name) {			
//		for (EmployeesVO mb : employeesList) {
//			if (mb.getName().trim().equals(eid.trim()) && mb.getEid().trim().equals(name.trim()) ) {
//				
//				return mb;
//			}
//		}
		return null;
	}
//	
//	
//	@Override
//	public List<EmployeesVO> getMemberList() { 
//		return employeesList;
//	}
	
//	@Override
//	public void addNewEmployees(EmployeesVO employeesVO){
//		employeesList.add(employeesVO);
//	}
	
	public List<EmployeesVO> getAll() {
		List<EmployeesVO> list = null;
		//list = dao.getAll();
		return list;
	}
	
	public static void main(String[] args){
		LoginServiceEmp dao = new LoginServiceEmp();
		List<EmployeesVO> list = dao.getAll();
		for (EmployeesVO aMem : list) {
			System.out.print(aMem.getName() + ",");
			System.out.print(aMem.getEid());
			System.out.println();
		}
	}

	@Override
	public List<EmployeesVO> getEmployeesList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addNewEmployees(EmployeesVO employeesVO) {
		// TODO Auto-generated method stub
		
	}

}