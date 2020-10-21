package com.bit.backpackers.image.model.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class NewImageVo {
	
	private String productCode, imageURL;
	private int imageOrder;
	
	public NewImageVo(String productCode, String imageURL, int imageOrder) {
		super();
		this.productCode = productCode;
		this.imageURL = imageURL;
		this.imageOrder = imageOrder;
	}

}
