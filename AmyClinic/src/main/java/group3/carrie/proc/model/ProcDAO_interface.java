package group3.carrie.proc.model;

import java.util.List;

public interface ProcDAO_interface {
    public void insert(ProcVO procVO);
    public void update(ProcVO procVO);
    public void delete(Integer procedure_id);
    public ProcVO findByPrimaryKey(Integer procedure_id);
    public List<ProcVO> getAll();

}
