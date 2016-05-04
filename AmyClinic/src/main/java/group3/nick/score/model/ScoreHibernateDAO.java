package group3.nick.score.model;

import hibernate.util.HibernateUtil;
import org.hibernate.*;
import java.util.List;

public class ScoreHibernateDAO implements Score_interface {
	
	private static final String GET_ALL_STMT = "from ScoreVO order by scoreId";

	@Override
	public void insert(ScoreVO scoreVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(scoreVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void update(ScoreVO scoreVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(scoreVO);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		
	}

	@Override
	public void delete(Integer score_id) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("delete ScoreVO where score_id=?");
			query.setParameter(0, score_id);
			System.out.println("刪除的筆數=" + query.executeUpdate());
			session.getTransaction().commit();
		}
			catch (RuntimeException ex) {
				session.getTransaction().rollback();
				throw ex;
			}
		
	}

	@Override
	public ScoreVO findByPrimaryKey(Integer score_id) {
		ScoreVO scoreVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			scoreVO = (ScoreVO) session.get(ScoreVO.class, score_id);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return scoreVO;
	}

	@Override
	public List<ScoreVO> getAll() {
		List<ScoreVO> list = null;
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
		ScoreHibernateDAO dao 	= new ScoreHibernateDAO();
		
		ScoreVO scorevo = new ScoreVO();
		scorevo.setComment("想吃飯");
		scorevo.setEid(1);
		scorevo.setMid(1000);
		scorevo.setScores(2);
		dao.insert(scorevo);
	}
}
