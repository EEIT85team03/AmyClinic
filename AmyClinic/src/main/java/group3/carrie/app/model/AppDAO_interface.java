package group3.carrie.app.model;

import java.util.List;

public interface AppDAO_interface {
    public void insert(AppVO appVO);
    public void update(AppVO appVO);
    public void delete(Integer aid);
    public AppVO findByPrimaryKey(Integer aid);
    public List<AppVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<AppVO> getAll(Map<String, String[]> map); 
}
