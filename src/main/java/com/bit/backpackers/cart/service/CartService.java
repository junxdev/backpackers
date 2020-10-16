package com.bit.backpackers.cart.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.backpackers.cart.model.entity.CartProductVo;

public interface CartService {

	void putItemIntoCart(CartProductVo bean) throws SQLException;
	void getCartByMemberId(Model model, String memberId) throws SQLException;
	
}
