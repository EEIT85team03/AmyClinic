package group3.carrie.orders.model;

import java.util.List;
import java.util.Set;

import group3.carrie.orderItems.model.OrderItemsVO;

public interface OrdersDAOInterface {
	    public void insert(OrdersVO ordersVO);
	    public void update(OrdersVO ordersVO);
	    public void delete(Integer oid);
	    public OrdersVO findByPrimaryKey(Integer oid);
	    public List<OrdersVO> getAll();
	    //查詢某筆訂單的明細(一對多)(回傳 Set)
	    public Set<OrderItemsVO> getOrderItemsByOid(Integer oid);

}
