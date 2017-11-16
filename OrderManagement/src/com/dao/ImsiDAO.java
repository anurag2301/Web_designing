package com.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.bean.imsi.Imsi;

public class ImsiDAO 
{
	Connection con;
	public ImsiDAO()
	{
    }
	
	public void registerImsi(String imsiRange,String status)
	{
		Connection con=null;
		String imsiType,subscriptionType;
		String imsi[]=imsiRange.split("-");
		String subImsi=imsi[0].substring(0, 10);
		String lastDigit;
		
		 Date dNow = new Date( );
	     SimpleDateFormat ft =new SimpleDateFormat ("dd/MMM/yyyy");
		
		int startImsi=Integer.parseInt(imsi[0].substring(10,14));
		int endImsi=Integer.parseInt(imsi[1].substring(0,4));
		
		if(imsi[0].charAt(0)=='S')
		{
			imsiType="Single";
			lastDigit="0";
		}
		else
		{
			imsiType="Dual";
			lastDigit="1/2";
		}
		if(imsi[0].charAt(1)=='4')
		{
			subscriptionType="Post Paid";
		}
		else
		{
			subscriptionType="Pre Paid";
		}
		
		for(int i=startImsi;i<=endImsi;i++)
		{
			String q=null;
			if(i<10)
			{
				q="000"+i+"";
			}
			else if(i<100)
			{
				q="00"+i+"";
			}
			else if(i<1000)
			{
				q="0"+i+"";
			}
		
			String sql="INSERT INTO IMSI_tbl VALUES('"+subImsi+(q)+lastDigit+"','"+imsiType+"','"+status+"','"+subscriptionType+"','"+ft.format(dNow)+"')";
			System.out.println("SQL is ::: "+sql);
			try{
				con = DBConnectionUtil.getConnection();
				PreparedStatement st=con.prepareStatement(sql);
				st.executeUpdate(sql);
				}
			catch (Exception e)
				{
					e.printStackTrace();
				}
			finally{
				DBConnectionUtil.closeConnection(con);
			    }
		}
	}
	
	public void updateImsiStatus(String imsiNumber,String status)
	{
		Connection con=null;
		
		
			String sql="UPDATE IMSI_tbl SET IMSISTATUS='"+status+"' WHERE IMSINUMBER='"+imsiNumber+"'";
			
			
			System.out.println("SQL is ::: "+sql);
			try{
				con = DBConnectionUtil.getConnection();
				PreparedStatement st=con.prepareStatement(sql);
				st.executeUpdate(sql);
				}
			catch (Exception e)
				{
					e.printStackTrace();
				}
			finally{
				DBConnectionUtil.closeConnection(con);
			    }
		
	}
	
	public void imsiStatusUpdate(int orderId,int quantity,String status)
	{
		Connection con = null;
		String imsiRangeArray[]=new String[2];;
		String imsiNumArray[]=new String[quantity];
		int quantityMade=0,imsiNum=0,startImsi=0,endImsi=0;
		
		String sql="SELECT IMSIRANGE,QUANTITY FROM ORDERDETAILS WHERE ORDERID="+orderId;	
		String sqlImsi="SELECT IMSINUMBER FROM IMSI_TBL WHERE ORDERID="+orderId;
		String sqlMadeQuantity="SELECT COUNT(IMSISTATUS) FROM IMSI_TBL WHERE ORDERID="+orderId+" AND IMSISTATUS='"+"ID"+"'";
		System.out.println("SQL is ::: "+sql);
		System.out.println("SQL is ::: "+sqlImsi);
		System.out.println("SQL is ::: "+sqlMadeQuantity);
		try{
				con = DBConnectionUtil.getConnection();
				PreparedStatement st1=con.prepareStatement(sql);
				PreparedStatement st2=con.prepareStatement(sqlMadeQuantity);
				PreparedStatement st3=con.prepareStatement(sqlImsi);
				ResultSet rs1=st1.executeQuery(sql);
				ResultSet rs2=st2.executeQuery(sqlMadeQuantity);
				ResultSet rs3=st3.executeQuery(sqlImsi);
				while(rs1.next())
				{
					imsiRangeArray=rs1.getString(1).split("-");
				}
				while(rs2.next())
				{
					quantityMade=rs2.getInt(1);
				}
				while(rs3.next())
				{
					int i=0;
					if(quantityMade==0)
					{
						System.out.println("first time");
						startImsi=Integer.parseInt(imsiRangeArray[0].substring(10,14));
						endImsi=startImsi+quantity-1;
					}
					else
					{
						System.out.println("second time");
						startImsi=Integer.parseInt(imsiRangeArray[0].substring(10,14))+quantityMade;
						endImsi=startImsi+quantity-1;
					}
					System.out.println("\n\nImsiDao");
					System.out.println(rs3.getString(1));
					imsiNum =Integer.parseInt(rs3.getString(1).substring(10,14));
					System.out.println("S"+startImsi + "E" +endImsi+"i"+imsiNum);
					if(startImsi<=imsiNum && endImsi>=imsiNum)
					{
						imsiNumArray[i]=rs3.getString(1);
						String newSql="UPDATE IMSI_tbl SET IMSISTATUS='"+status+"' WHERE IMSINUMBER='"+imsiNumArray[i]+"' AND ORDERID="+orderId+"";
						System.out.println("SQL is ::: "+newSql);
						PreparedStatement st4=con.prepareStatement(newSql);
						st4.executeUpdate(newSql);
					}
					i++;
				}
				
			}
		catch (Exception e)
			{
				e.printStackTrace();
			}
		finally{
			DBConnectionUtil.closeConnection(con);
		    }
	}
	public Imsi viewImsi(String imsiNumber,int userId,int loginAs)
	{	System.out.println("Yes00000");
		Connection con = null;
		Imsi iobj=new Imsi();
		String imsiRange[]=new String[2];
		int startImsi,endImsi,imsiNum,orderId=0,sId=0,mId=0;
		String sql="SELECT IMSIRANGE,ORDERID,SERVICEPROVIDERID,MANUFACTURERID FROM ORDERDETAILS where IMSIRANGE LIKE '"+imsiNumber.substring(0,10)+"%'";
		String sqlImsi="SELECT * FROM IMSI_TBL WHERE IMSINUMBER='"+imsiNumber+"'";
		System.out.println("Yes111111"+sql);
		try{
			con = DBConnectionUtil.getConnection();
			Statement st1=con.prepareStatement(sql);
			ResultSet rs1=st1.executeQuery(sql);
			System.out.println("Yes000");
			while(rs1.next())
			{	System.out.println("Yes111");
				imsiRange=rs1.getString(1).split("-");
				startImsi=Integer.parseInt(imsiRange[0].substring(10,14));
				endImsi=Integer.parseInt(imsiRange[1].substring(0,4));
				imsiNum =Integer.parseInt(imsiNumber.substring(10,14));
				if(startImsi<=imsiNum && endImsi>=imsiNum)
				{
					System.out.println("Yes211");
					orderId=rs1.getInt(2);
					sId=rs1.getInt(3);
					System.out.println(sId);
					mId=rs1.getInt(4);
					System.out.println(mId);
					System.out.println(userId);
					break;
				}
			}
			if(userId==sId||userId==mId)
			{
				System.out.println("Yes311");
				Statement st2=con.prepareStatement(sqlImsi);
				ResultSet rs2=st2.executeQuery(sqlImsi);
				if(rs2.next())
				{
					System.out.println("YesYes");
					iobj.setImsiNumber(rs2.getString(1));
					iobj.setImsiType(rs2.getString(2));
					iobj.setImsiStatus(rs2.getString(3));
					iobj.setSubscriptionType(rs2.getString(4));
					iobj.setCreationDate(rs2.getString(5));
				}
				else
				{
					iobj=null;
				}
			
			}
		}
		catch (Exception e)
			{
				e.printStackTrace();
			}
		finally{
			DBConnectionUtil.closeConnection(con);
		    }
		return iobj;
	}	
	public int getImsiCount()
	{
		Connection con=null;
		String sql= "SELECT COUNT(IMSINUMBER) FROM CUSTOMER";
		int count=0;
		try{
			con = DBConnectionUtil.getConnection();
			Statement st=con.prepareStatement(sql);
			ResultSet rs=st.executeQuery(sql);
			if(rs.next())
			{
				count= rs.getInt(1);
			}
			}
		catch (Exception e)
			{
				e.printStackTrace();
			}
		finally{
			DBConnectionUtil.closeConnection(con);
		    }
		return count;
	}
}
