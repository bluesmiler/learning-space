package com.pm.entity;

public class Home {
	private int home_id;
	
	private String home_name;

	private int unit_id;

	private Unit unit;

	public Unit getUnit() {
		return unit;
	}

	public void setUnit(Unit unit) {
		this.unit = unit;
	}

	public int getHome_id() {
		return home_id;
	}

	public void setHome_id(int home_id) {
		this.home_id = home_id;
	}

	public String getHome_name() {
		return home_name;
	}

	public void setHome_name(String home_name) {
		this.home_name = home_name;
	}

	public int getUnit_id() {
		return unit_id;
	}

	public void setUnit_id(int unit_id) {
		this.unit_id = unit_id;
	}
}
