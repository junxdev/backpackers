package com.bit.backpackers.order.model.entity;

import java.sql.Date;

import com.bit.backpackers.order.OrderStatus;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class OrderVo {

	private OrderStatus orderStatus;
	private String orderCode;
	private Date orderDate;
	
}
