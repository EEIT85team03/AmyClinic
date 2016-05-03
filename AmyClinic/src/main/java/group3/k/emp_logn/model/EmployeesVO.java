package group3.k.emp_logn.model;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.text.MessageFormat;
import java.util.*;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity 
@Table(name = "Employees")  
public class EmployeesVO implements Serializable {
	
	private Integer   eid;
	private String 	name;
	
	
	
	public EmployeesVO() {
		super();
	}	

	public EmployeesVO(Integer eid, String name) { 
		super();
		this.eid = eid;
		this.name = name;
	}
	
	@Id  
	@SequenceGenerator(name="midGen", allocationSize=1) 
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="midGen")       
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
	
	public void getProperties() throws IllegalArgumentException, IllegalAccessException {
		  Class<?> aClass = this.getClass();
		  Field[] declaredFields = aClass.getDeclaredFields();
		  Map<String, String> logEntries = new HashMap<>();

		  for (Field field : declaredFields) {
		    field.setAccessible(true);
		    Object[] arguments = new Object[]{
		      field.getName(),
		      field.getType().getSimpleName(),
		      String.valueOf(field.get(this))
		    };
		    String template = "- Property: {0} (Type: {1}, Value: {2})";
		    String logMessage = System.getProperty("line.separator")
		            + MessageFormat.format(template, arguments);
		    logEntries.put(field.getName(), logMessage);
		  }

		  SortedSet<String> sortedLog = new TreeSet<>(logEntries.keySet());
		  StringBuilder sb = new StringBuilder("Class properties:");
		  Iterator<String> it = sortedLog.iterator();
		  while (it.hasNext()) {
		    String key = it.next();
		    sb.append(logEntries.get(key));
		  }
		  System.out.println(sb.toString());
		}
	
	public static void main(String[] args) throws IllegalArgumentException, IllegalAccessException{
		EmployeesVO vo = new EmployeesVO();
		vo.getProperties();	}
}
