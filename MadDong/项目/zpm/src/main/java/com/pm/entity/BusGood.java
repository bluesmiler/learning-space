package com.pm.entity;

public class BusGood {
    private int id;
    private String name;
    private String image;
    private double price;
    private String content;
    private int busId;

    public String getContentShort(){
        if(content!=null && content.length()>20){
            String str=content.substring(0,100)+"......";
            return str;
        }
        return content;
    }
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public void setContent(String content) {
        this.content = content;
    }

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    @Override
    public String toString() {
        return "BusGood{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", content='" + content + '\'' +
                ", busId=" + busId +
                '}';
    }
}
