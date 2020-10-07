package com.bit.backpackers.order.model.entity;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class OrderVo {

	private String orderCode;
	private Date orderDate;
	
}
