package group3.carrie.product.model;

import java.util.List;

public interface ProductDAO_interface {
    public void insert(ProductVO productVO);
    public void update(ProductVO productVO);
    public void delete(Integer pid);
    public ProductVO findByPrimaryKey(Integer pid);
    public List<ProductVO> getAll();

}
