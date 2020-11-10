package com.bit.backpackers.admin.shop.service;

import java.io.IOException;
import java.sql.SQLException;

import org.json.simple.parser.ParseException;
import org.springframework.ui.Model;

import com.bit.backpackers.admin.shop.model.entity.ShopVo;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

public interface ShopAdminService {

	void getShopList(Model model) throws SQLException;
	void getShop(Model model, String shopCode) throws SQLException;
	String createShop(String jsonShop) throws SQLException, ParseException, JsonParseException, JsonMappingException, IOException;
	int updateShop(ShopVo shop) throws SQLException;
	int deleteShop(String shopCode) throws SQLException;
	String getItem(String itemCode) throws SQLException;
	void getShopForm(Model model) throws SQLException;

}
