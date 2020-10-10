package com.bit.backpackers.order;

import java.text.DateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class Order {

	public String makeOrderCode() {
		LocalDateTime now = LocalDateTime.now(ZoneId.of("Asia/Seoul"));
		String orderCode = now.format(DateTimeFormatter.ofPattern("yyyyMMddhhmmss"));
		return orderCode;
	}
}
