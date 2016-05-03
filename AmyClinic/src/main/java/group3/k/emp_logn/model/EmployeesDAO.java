package group3.k.emp_logn.model;

import org.hibernate.*;
import hibernate.util.HibernateUtil;
import java.util.*;

public class EmployeesDAO implements EmployeesDAO_interface {

	private static final String GET_ALL_STMT = "from EmployeesVO order by eid";
	@Override
	public void insert(EmployeesDAO employeesDAO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(employeesDAO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void update(EmployeesDAO employeesDAO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(employeesDAO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public void delete(Integer eid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			EmployeesDAO employeesDAO = (EmployeesDAO) session.get(EmployeesDAO.class, eid);
			session.delete(employeesDAO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
	}

	@Override
	public EmployeesDAO findByPrimaryKey(Integer eid) {
		EmployeesDAO employeesDAO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			employeesDAO = (EmployeesDAO) session.get(EmployeesDAO.class, eid);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return employeesDAO;
	}

	@Override
	public List<EmployeesDAO> getAll() {
		List<EmployeesDAO> list = null;
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
		EmployeesDAO dao = new EmployeesDAO();
		List<EmployeesDAO> list2 = dao.getAll();
		for (EmployeesDAO aEmp : list2) {
			System.out.print(aEmp.getAll() + ",");
			System.out.println("\n");
			System.out.println("_______________");
		}
	}
}
