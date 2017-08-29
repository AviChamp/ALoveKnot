package com.dao;

import java.util.List;
import com.model.Cart;

public interface CartDao {

	public void insertService(Cart cart);
	public List<Cart> findCartByID(String userId);
	public Cart getCartById(int cartId, String userEmail);
	public void deleteCart(int cartId);
	public void update(Cart cr);
}
