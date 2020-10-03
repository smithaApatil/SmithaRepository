package com.eval.coronakit.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "products")
public class ProductMaster implements Serializable{
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "productName")
	@NotNull(message = "Name is  Mandatory")
	@NotBlank(message = "Name can not be left blank")
	@Size(min = 2, max = 30, message = "Name should be 5 to 30 Chars in length")
	private String productName;

	@Column(name = "cost")
	@NotNull(message = "Cost is required")
	@Min(value = 1, message = "Cost cannot be Zero or Negative")
	private Integer cost;

	@Column(name = "productDescription")
	@NotNull(message = "Description is required.")
	@NotBlank(message = "Description can't be blank.")
	@Size(min = 3, max = 30, message = "Description should be 5 to 30 Chars in length")
	private String productDescription;
	
	
	
	public ProductMaster() {
		// TODO Auto-generated constructor stub
	}
	
	public ProductMaster(int id, String productName, Integer cost, String productDescription) {
		super();
		this.id = id;
		this.productName = productName;
		this.cost = cost;
		this.productDescription = productDescription;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getCost() {
		return cost;
	}
	public void setCost(Integer cost) {
		this.cost = cost;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	@Override
	public String toString() {
		return "ProductMaster [id=" + id + ", productName=" + productName + ", cost=" + cost + ", productDescription="
				+ productDescription + "]";
	}

}

	


