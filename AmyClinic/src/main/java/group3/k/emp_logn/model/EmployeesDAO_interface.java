package group3.k.emp_logn.model;

import java.util.*;

public interface EmployeesDAO_interface {
          public void insert(EmployeesDAO empVO);
          public void update(EmployeesDAO empVO);
          public void delete(Integer eid);
          public EmployeesDAO findByPrimaryKey(Integer eid);
          public List<EmployeesDAO> getAll();
}
