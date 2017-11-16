package com.bean.order;

public class Order {
	private int orderId;
	private int sId;
	private int mId;
	private String imsiType;
	private String subscriptionType;
	private String startImsi;
	private String iccid;
	private int quantity;
	String date;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Order() {

	}

	public int getOrderId() {
		return orderId;
	}

	public int getsId() {
		return sId;
	}

	public int getmId() {
		return mId;
	}

	public String getImsiType() {
		return imsiType;
	}

	public String getSubscriptionType() {
		return subscriptionType;
	}

	public String getStartImsi() {
		return startImsi;
	}

	public String getIccid() {
		return iccid;
	}

	public int getQuantity() {
		return quantity;
	}

	public Order(int orderId, int sId, int mId, String imsiType,
			String subscriptionType, String startImsi, String iccid,
			int quantity) {
		this.orderId = orderId;
		this.sId = sId;
		this.mId = mId;
		this.imsiType = imsiType;
		this.subscriptionType = subscriptionType;
		this.startImsi = startImsi;
		this.iccid = iccid;
		this.quantity = quantity;
	}
	
	public Order(int orderId, int sId, int mId, String imsiType,
			String subscriptionType, String startImsi, String iccid,
			int quantity, String date) {
		this.orderId = orderId;
		this.sId = sId;
		this.mId = mId;
		this.imsiType = imsiType;
		this.subscriptionType = subscriptionType;
		this.startImsi = startImsi;
		this.iccid = iccid;
		this.quantity = quantity;
		this.date = date;
	}
}

