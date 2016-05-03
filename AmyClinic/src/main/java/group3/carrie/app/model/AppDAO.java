package group3.carrie.app.model;

import group3.carrie.appdetail.model.AppDetailVO;
import group3.henry.login.model.MemberVO;
import hibernate.util.HibernateUtil;

import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

public class AppDAO implements AppDAO_interface {
	
	private static final String GET_ALL_STMT = "from AppVO order by aid";
	
	private static final String QUERY_NEW_APP="from AppVO where mid=? and apt_date>=?";
	
	private static final String QUERY_OLD_APP="from AppVO where mid=? and apt_date<?";

	@Override
	public void insert(AppVO appVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(appVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void update(AppVO appVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(appVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void delete(Integer aid) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			AppVO appVO = (AppVO) session.get(AppVO.class, aid);
			session.delete(appVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public AppVO findByPrimaryKey(Integer aid) {
		AppVO appVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			appVO = (AppVO) session.get(AppVO.class, aid);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return appVO;
	}

	@Override
	public List<AppVO> getAll() {
		List<AppVO> list = null;
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

	@Override
	public Set<AppDetailVO> getAppDetailByAid(Integer aid) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}