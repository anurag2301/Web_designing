package com.bean.imsi;

public class Imsi 
{
	private String imsiNumber;
	private String imsiType;
	private String imsiStatus;
	private String subscriptionType;
	private String creationDate;
	
	public String getImsiNumber() {
		return imsiNumber;
	}
	public void setImsiNumber(String imsiNumber) {
		this.imsiNumber = imsiNumber;
	}
	public String getImsiType() {
		return imsiType;
	}
	public void setImsiType(String imsiType) {
		this.imsiType = imsiType;
	}
	public String getImsiStatus() {
		return imsiStatus;
	}
	public void setImsiStatus(String imsiStatus) {
		this.imsiStatus = imsiStatus;
	}
	public String getSubscriptionType() {
		return subscriptionType;
	}
	public void setSubscriptionType(String subscriptionType) {
		this.subscriptionType = subscriptionType;
	}
	public String getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	
	public Imsi()
	{
		
	}
	
	public Imsi( String imsiNumber,String imsiType,String imsiStatus,String subscriptionType,String creationDate)
	{
		this.imsiNumber=imsiNumber;
		this.imsiType=imsiType;
		this.imsiStatus=imsiStatus;
		this.subscriptionType=subscriptionType;
		this.creationDate=creationDate;
		
	}
	
}
