package com.tamdongtam.springbatch.dto;


import lombok.Data;

/**
 * This class is Todo dto.
 * 
 * @Description: .
 * @author: NNDuy
 * @create_date: Dec 7, 2019
 * @version: 1.0
 * @modifer: TrungLD
 * @modifer_date: Nov 02, 2020
 */
@Data
public class TodoDTO {

	private int id;
	private String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}