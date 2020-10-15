package com.bit.backpackers.category.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

public interface CategoryService {

	public void getCategoryList(Model model) throws SQLException;

}
