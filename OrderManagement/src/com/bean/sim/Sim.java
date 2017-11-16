package com.bean.sim;

public class Sim {
private long simId;
private long ICCID;
private String IMSI_No;
private int PIN1;
private int PIN2;
private int PUK1;
private int PUK2;
private String manufactureDate;
private int orderId;

public long getSimId() {
	return simId;
}
public void setSimId(long simId) {
	this.simId = simId;
}
public long getICCID() {
	return ICCID;
}
public void setICCID(long iCCID) {
	ICCID = iCCID;
}
public String getIMSI_No() {
	return IMSI_No;
}
public void setIMSI_No(String iMSINo) {
	IMSI_No = iMSINo;
}
public long getPIN1() {
	return PIN1;
}
public void setPIN1(int pIN1) {
	PIN1 = pIN1;
}
public int getPIN2() {
	return PIN2;
}
public void setPIN2(int pIN2) {
	PIN2 = pIN2;
}
public int getPUK1() {
	return PUK1;
}
public void setPUK1(int pUK1) {
	PUK1 = pUK1;
}
public int getPUK2() {
	return PUK2;
}
public void setPUK2(int pUK2) {
	PUK2 = pUK2;
}
public String getManufactureDate() {
	return manufactureDate;
}
public void setManufactureDate(String manufactureDate) {
	this.manufactureDate = manufactureDate;
}
public long getOrderId() {
	return orderId;
}
public void setOrderId(int orderId) {
	this.orderId = orderId;
}
public Sim(long simId,long ICCID, String IMSI_No,int PIN1,int PIN2,int PUK1,int PUK2,String manufactureDate,int orderId){
	this.simId=simId;
	this.ICCID=ICCID;
	this.IMSI_No=IMSI_No;
	this.PIN1=PIN1;
	this.PIN2=PIN2;
	this.PUK1=PUK1;
	this.PUK2=PUK2;
	this.manufactureDate=manufactureDate;
	this.orderId=orderId;
}
public Sim(){}

public Sim(long simId,long ICCID, String IMSI_No,int PIN1,int PIN2,int PUK1,int PUK2,int orderId){
	this.simId=simId;
	this.ICCID=ICCID;
	this.IMSI_No=IMSI_No;
	this.PIN1=PIN1;
	this.PIN2=PIN2;
	this.PUK1=PUK1;
	this.PUK2=PUK2;

	this.orderId=orderId;
}
}
