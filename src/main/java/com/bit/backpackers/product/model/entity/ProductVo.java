package com.bit.backpackers.product.model.entity;

import java.util.List;

import com.bit.backpackers.image.model.entity.ImageVo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ProductVo {

	private String shopCode, productCode, optionGroupCode, optionCode;
	private List<ImageVo> productImageList;
	
}
