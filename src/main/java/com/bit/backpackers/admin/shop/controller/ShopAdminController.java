package com.bit.backpackers.admin.shop.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.backpackers.admin.shop.service.ShopAdminService;
import com.bit.backpackers.image.model.entity.ImageVo;
import com.bit.backpackers.image.model.entity.NewImageVo;
import com.bit.backpackers.item.Item;
import com.bit.backpackers.item.model.entity.NewItemVo;
import com.bit.backpackers.product.model.entity.NewProductVo;
import com.bit.backpackers.product.model.entity.ProductItemVo;
import com.bit.backpackers.shop.model.entity.NewShopVo;
import com.bit.backpackers.shop.model.entity.ShopVo;

@Controller
@RequestMapping("/admin/shop")
public class ShopAdminController {
	
	@Inject
	ShopAdminService shopAdminService;
	@Inject
	Item itemSupport;

	@RequestMapping("")
	public String listShop(Model model) throws SQLException {
		shopAdminService.getShopList(model);
		return "admin/shop/list";
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String formShop(Model model) throws SQLException {
		shopAdminService.getShopForm(model);
		return "admin/shop/detail";
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String addShop(@RequestBody String JsonShopData) throws ParseException {
		JSONParser parser = new JSONParser();
		JSONObject jsonParsed = (JSONObject) parser.parse(JsonShopData);
		System.out.println(JsonShopData);
		System.out.println(jsonParsed.toString());
		JSONObject shopJSONObject = (JSONObject) jsonParsed.get("shop");
		JSONArray productArray = (JSONArray) jsonParsed.get("productList");
		JSONArray imgURLArray = (JSONArray) jsonParsed.get("imgURLList");
		JSONArray itemArray = (JSONArray) jsonParsed.get("itemList");
		System.out.println(shopJSONObject.toString());
		System.out.println(productArray.toString());
		System.out.println(imgURLArray.toString());
		System.out.println(itemArray.toString());
		NewShopVo shop = new NewShopVo((String) shopJSONObject.get("shopCode"), (String) shopJSONObject.get("shopTitle"), (String) shopJSONObject.get("mainCategoryCode"), (String) shopJSONObject.get("subCategoryCode"), (String) shopJSONObject.get("shopContent"), Integer.parseInt(String.valueOf(shopJSONObject.get("shopPrice"))));
		List<NewProductVo> productList = new ArrayList<NewProductVo>();
		for(Object temp : productArray) {
			JSONObject product = (JSONObject) temp;
			productList.add(new NewProductVo((String) product.get("shopCode"), (String) product.get("productCode"), (String) product.get("optionGroup"), (String) product.get("option")));
		}
		List<NewImageVo> imageURLList = new ArrayList<NewImageVo>();
		for(Object temp : imgURLArray) {
			JSONObject img = (JSONObject) temp;
			imageURLList.add(new NewImageVo((String) img.get("productCode"), (String) img.get("imageURL"), Integer.parseInt(String.valueOf(img.get("imageOrder")))));
		}
		List<ProductItemVo> itemList = new ArrayList<ProductItemVo>();
		for(Object temp : itemArray) {
			JSONObject item = (JSONObject) temp;
			itemList.add(new ProductItemVo((String) item.get("productCode"), (String) item.get("itemCode"), (String) item.get("optionGroup"), (String) item.get("option")));
		}
		System.out.println(shop.toString());
		System.out.println(productList.toString());
		System.out.println(imageURLList.toString());
		System.out.println(itemList.toString());
		
		return "success";
	}

	@RequestMapping(value = "/{shopCode}")
	public String shopDetail(Model model, @PathVariable String shopCode) throws SQLException {
		shopAdminService.getShop(model, shopCode);
		return "admin/shop/detail";
	}

	@RequestMapping(value = "/{shopCode}", method = RequestMethod.PUT)
	public String shopEdit() {
		return "redirect:.";
	}
	
	@RequestMapping(value = "/{shopCode}", method = RequestMethod.DELETE)
	public String shopDelete(@PathVariable String shopCode) {
		return "redirect:..";
	}
	
	@RequestMapping(value = "/item", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody List<NewItemVo> listItem(String itemCode) throws SQLException {
		return itemSupport.getItemList();
	}
}
