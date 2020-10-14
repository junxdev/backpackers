package com.bit.backpackers.cart.model.entity;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class CartProductVo {

	private int cartId;
	private String productCode, memberId;
	private Timestamp cartDate;
	private int cartRemoved;
	private String optionCode;
	private int quantity;
	
}
