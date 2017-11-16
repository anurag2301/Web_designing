package com.dao;

public class MyException extends Exception {
	private String msg;
	
	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getMsg() {
		return msg;
	}

	public MyException() {
	
	}
	
	public MyException(String msg) {
		this.msg = msg;
	}
	
	
}
