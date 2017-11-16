package com.model.sim;
import com.bean.sim.Sim;

import com.dao.ImsiDAO;
import com.dao.SimRegistrationDAO;


public class AddSim {

	
/*public AddSim(int simId, int ICCID,String IMSI_No,int PIN1,int PIN2,int PUK1,int PUK2,String manufactureDate,int orderId){
	Sim sobj=new Sim(simId , ICCID, IMSI_No, PIN1, PIN2, PUK1, PUK2, manufactureDate, orderId );
		SimRegistrationDAO sD = new SimRegistrationDAO();
		sD.addSim(sobj);
	}
*/
public String simOrder(int orderId,int quantity,int pin1,int pin2,int puk1,int puk2){
	System.out.println("add sim"+pin2);
	SimRegistrationDAO sD = new SimRegistrationDAO();
	String status=sD.enterDetails(orderId,quantity,pin1,pin2,puk1,puk2);
	System.out.println("in simOrder");
	return status;
}

public boolean checkQuantityStatus(int orderId,int quantity){
	SimRegistrationDAO asobj=new SimRegistrationDAO();
	boolean status=asobj.sqlCheckQuantityStatus(orderId,quantity);
	return status;
}

public boolean checkOrderIdStatus(int orderId,int quantity){
	SimRegistrationDAO asobj=new SimRegistrationDAO();
	boolean status=asobj.sqlCheckOrderIdStatus(orderId,quantity);
	return status;
}
public Sim simRetrieveDetails(String searchBy,String searchValue, int id, int loginAs){
	System.out.println("addsim"+searchValue);
	Sim sobj=new Sim();
	SimRegistrationDAO sD = new SimRegistrationDAO();
	sobj=sD.viewSimDetails(searchBy, searchValue, id, loginAs);
	return sobj;
}

public AddSim() {
	
}

public Sim addSimDetails(long simId,long initialIccid,String imsiPart1,int count,String lastValue,int orderId,int quantity,String imsi,int pin1,int pin2,int puk1,int puk2){
	//int count=0;
	Sim sobj = new Sim();
	System.out.println("inner add sim"+pin2);
	//String subImsi = imsi;
	String id = simId + "";
	
	
		String strSimId = id;
		while(strSimId.length()<10) {
			strSimId = "0" + strSimId;
		}
		System.out.println("\n\n\nSim id :"+id);
		
		//simId = Long.parseLong(id);
		sobj.setSimId(Long.parseLong(strSimId));
		
		sobj.setICCID(initialIccid);
		//sobj.setManufactureDate(manufactureDate);
		sobj.setOrderId(orderId);
		sobj.setPIN1(pin1);
		System.out.println("setting pin2"+pin2);
		sobj.setPIN2(pin2);
		sobj.setPUK1(puk1);
		sobj.setPUK2(puk2);
			if(count<10){
				if(imsiPart1.charAt(0)=='D'){
					lastValue="1/2";
					sobj.setIMSI_No(imsiPart1+"000"+count+lastValue);
					System.out.println(imsiPart1+"000"+count+lastValue);
				}
				else{
					sobj.setIMSI_No(imsiPart1+"000"+count+lastValue);
				}
			}
			else if(count<100){
				if(imsiPart1.charAt(0)=='D'){
					lastValue="1/2";
					sobj.setIMSI_No(imsiPart1+"00"+count+lastValue);
					System.out.println(imsiPart1+"00"+count+lastValue);
				}
				else{
					sobj.setIMSI_No(imsiPart1+"00"+count+lastValue);
				}
				
			}
			else if(count<1000){
				if(imsiPart1.charAt(0)=='D'){
					lastValue="1/2";
					sobj.setIMSI_No(imsiPart1+"0"+count+lastValue);
					System.out.println(imsiPart1+"0"+count+lastValue);
				}
				else{
					sobj.setIMSI_No(imsiPart1+"0"+count+lastValue);
				}
			}
			else{
				if(imsiPart1.charAt(0)=='D'){
					lastValue="1/2";
					sobj.setIMSI_No(imsiPart1+count+lastValue);
					System.out.println(imsiPart1+count+lastValue);
				}
				else{
					sobj.setIMSI_No(imsiPart1+count+lastValue);
				}
			}
	return sobj;
}

public int modelManufacturedQuantity(int orderId){
	SimRegistrationDAO daoobj = new SimRegistrationDAO();
	return daoobj.manufacturedQuantity(orderId);
}
}
