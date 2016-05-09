package group3.beef.employee.model;

 
import java.util.List;

public interface EmployeeDAO_interface {
	public void insert(EmployeeVO employeeVO);
    public void update(EmployeeVO employeeVO);
    public void delete(Integer oid);
    public EmployeeVO findByPrimaryKey(Integer oid);
    public List<EmployeeVO> getAll();
}
