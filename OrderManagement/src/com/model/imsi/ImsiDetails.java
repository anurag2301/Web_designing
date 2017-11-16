package com.model.imsi;

import com.bean.imsi.Imsi;
import com.dao.ImsiDAO;

public class ImsiDetails 
{

	
	public Imsi getImsiDetails(String imsiNumber,int userId,int loginAs)
	{
		System.out.println("model");
		Imsi imsi=new Imsi();
		ImsiDAO iDao=new ImsiDAO();
		imsi=iDao.viewImsi(imsiNumber,userId,loginAs);
		return imsi;
		
	}
}
