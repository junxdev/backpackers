package com.bit.backpackers.order.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class OrderItemVo {

	private String orderCode, itemCode, shopTitle, firstOptionName, secondOptionName;
	private int shopPrice, quantity;
	
}
