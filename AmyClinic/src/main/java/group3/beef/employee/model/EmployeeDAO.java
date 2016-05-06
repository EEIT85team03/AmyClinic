package group3.beef.employee.model;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import hibernate.util.HibernateUtil;

public class EmployeeDAO {
	private static final String GET_ALL_STMT = "from EmployeeVO order by eid";
	
 
	public void insert(EmployeeVO employeeVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(employeeVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

 
	public void update(EmployeeVO employeeVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(employeeVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

 
	public void delete(Integer eid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			EmployeeVO employeeVO = (EmployeeVO) session.get(EmployeeVO.class, eid);
			session.delete(employeeVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

 
	public EmployeeVO findByPrimaryKey(Integer eid) {
		EmployeeVO employeeVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			employeeVO = (EmployeeVO) session.get(EmployeeVO.class, eid);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return employeeVO;
	}

	public List<EmployeeVO> getAll() {
		List<EmployeeVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
	
	public static void main(String[] args) {
		
		EmployeeDAO dao = new EmployeeDAO();
		List<EmployeeVO> list2 = dao.getAll();
		for (EmployeeVO aEmp : list2) {
			System.out.print(aEmp.getEid() + ",");
			System.out.print(aEmp.getName() + ",");
			System.out.print(aEmp.getPhoto() + ",");
			System.out.print(aEmp.getEducation() + ",");
			System.out.print(aEmp.getExperience() + ",");
			System.out.print(aEmp.getSpecialty()+ ",");
			System.out.println("\n");
		}
		
	}
}
