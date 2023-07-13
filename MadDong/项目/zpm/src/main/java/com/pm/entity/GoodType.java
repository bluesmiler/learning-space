package com.pm.entity;

public class GoodType {
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

    @Override
    public String toString() {
        return "GoodType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
