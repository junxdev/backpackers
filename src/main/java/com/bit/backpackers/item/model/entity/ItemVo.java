package com.bit.backpackers.item.model.entity;

public class ItemVo {

	private int item_id;
	private String item_code, item_name;
	private int price;
	private String main_category_code, sub_category_code, brand_code, 
					first_option_code, second_option_code;
	
	public ItemVo() {
	}

	public ItemVo(int item_id, String item_code, String item_name, int price, String main_category_code,
			String sub_category_code, String brand_code, String first_option_code, String second_option_code) {
		super();
		this.item_id = item_id;
		this.item_code = item_code;
		this.item_name = item_name;
		this.price = price;
		this.main_category_code = main_category_code;
		this.sub_category_code = sub_category_code;
		this.brand_code = brand_code;
		this.first_option_code = first_option_code;
		this.second_option_code = second_option_code;
	}

	public int getItem_id() {
		return item_id;
	}

	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMain_category_code() {
		return main_category_code;
	}

	public void setMain_category_code(String main_category_code) {
		this.main_category_code = main_category_code;
	}

	public String getSub_category_code() {
		return sub_category_code;
	}

	public void setSub_category_code(String sub_category_code) {
		this.sub_category_code = sub_category_code;
	}

	public String getBrand_code() {
		return brand_code;
	}

	public void setBrand_code(String brand_code) {
		this.brand_code = brand_code;
	}

	public String getFirst_option_code() {
		return first_option_code;
	}

	public void setFirst_option_code(String first_option_code) {
		this.first_option_code = first_option_code;
	}

	public String getSecond_option_code() {
		return second_option_code;
	}

	public void setSecond_option_code(String second_option_code) {
		this.second_option_code = second_option_code;
	}

	@Override
	public String toString() {
		return "ItemVo [item_id=" + item_id + ", item_code=" + item_code + ", item_name=" + item_name + ", price="
				+ price + ", main_category_code=" + main_category_code + ", sub_category_code=" + sub_category_code
				+ ", brand_code=" + brand_code + ", first_option_code=" + first_option_code + ", second_option_code="
				+ second_option_code + "]";
	}
	
}
