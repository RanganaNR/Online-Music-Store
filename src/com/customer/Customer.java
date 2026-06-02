package com.customer;

public class Customer {
	private int id;
	private String name;
	private String phone;
	private String email;
	private String role;
	private String password;
	
	
	public Customer(int id, String name, String phone, String email,String role,String password) {
		this.id = id;
		this.name=name;
		this.phone = phone;
		this.email = email;
		this.role=role;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}
	
	public String getRole() {
		return role;
	}

	public String getPassword() {
		return password;
	}


	
	
}
