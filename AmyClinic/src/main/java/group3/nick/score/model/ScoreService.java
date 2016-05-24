package group3.nick.score.model;

import java.util.List;

public class ScoreService {

	private Score_interface dao;
	
	public ScoreService() {
		dao = new ScoreHibernateDAO();
	}
	//增加一筆評論
	public void addScore(String comment,Integer scores,Integer eid,Integer mid){
		ScoreVO scoreVO=new ScoreVO();
		scoreVO.setComment(comment);
		scoreVO.setEid(eid);
		scoreVO.setMid(mid);
		scoreVO.setScores(scores);
		dao.insert(scoreVO);
		
	}
	
	//刪除一筆評論
	public void deleteScore(Integer score_id){
		dao.delete(score_id);
		
	}
	//修改一則評論
	public void updateScore(String comment,Integer scores,Integer eid,Integer mid,Integer score_id){
		ScoreVO scoreVO = new ScoreVO();
		scoreVO.setComment(comment);
		scoreVO.setEid(eid);
		scoreVO.setMid(mid);
		scoreVO.setScores(scores);
		scoreVO.setScore_id(score_id);
		dao.update(scoreVO);
		
	}
	//找到自己的評論
	public ScoreVO findMyScore(Integer score_id){
		return dao.findByPrimaryKey(score_id);

	}
	
	//看到全部評論
	public List<ScoreVO> getAll(){
		return dao.getAll();
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
