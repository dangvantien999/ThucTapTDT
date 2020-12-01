package com.tamdongtam.springbatch.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * This class is the persistent class for the todo database table..
 * 
 * @Description: .
 * @author: NNDuy
 * @create_date: Oct 30, 2020
 * @version: 1.0
 * @modifer: NNDuy
 * @modifer_date: Oct 30, 2020
 */
@Entity
@Table(name = "`todo`")
@Data
public class Todo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "`id`", nullable = false, updatable = false)
	private int id;

	@Column(name = "`name`", nullable = false, length = 50, unique = true)
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