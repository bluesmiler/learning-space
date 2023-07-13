package com.pm.entity;


/**
 * @author tzj
 * 便利商品
 */
public class Goods {
	private int id;
	private String name;
	private double price;
	private String content;
	private String image;
	private String imageReName;
	private GoodType goodType;

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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public String getContentShort(){
		if(content != null && content.length() > 20){
			String str=content.substring(0, 100)+".......";
			return str;
		}
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getImageReName() {
		return imageReName;
	}

	public void setImageReName(String imageReName) {
		this.imageReName = imageReName;
	}

	public GoodType getGoodType() {
		return goodType;
	}

	public void setGoodType(GoodType goodType) {
		this.goodType = goodType;
	}

	@Override
	public String toString() {
		return "Goods{" +
				"id=" + id +
				", name='" + name + '\'' +
				", price=" + price +
				", content='" + content + '\'' +
				", image='" + image + '\'' +
				", imageReName='" + imageReName + '\'' +
				", goodType=" + goodType +
				'}';
	}
}
