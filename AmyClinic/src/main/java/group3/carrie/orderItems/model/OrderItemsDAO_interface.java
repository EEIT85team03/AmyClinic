package group3.carrie.orderItems.model;

import java.util.List;

public interface OrderItemsDAO_interface {
    public void insert(OrderItemsVO orderItemsVO);
    public void update(OrderItemsVO orderItemsVO);
    public void delete(Integer id);
    public OrderItemsVO findByPrimaryKey(Integer id);
    public List<OrderItemsVO> getAll();

}
