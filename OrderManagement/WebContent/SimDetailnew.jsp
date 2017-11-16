<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<%@ page import= "java.io.*,
				  java.text.*,
				  com.bean.sim.Sim"
 %>

<meta http-equiv="Page-Enter" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />			
<script type="text/javascript" src="javascript/SimRetrieveValidate.js"></script>
<title>GSI-Home</title>	

</head>

<body>
<!-- wrap starts here -->
<div id="wrap">

		<!-- header -->
		<div id="header">			
					
			<span id="slogan"> Communicate and Socialize...</span>
			
			<!-- tabs -->
		<%@ include file="TopMenu.jsp"%>	
											
		</div>
		
		<div id="header-logo">			
			
			<div id="logo">Global <span class="red">SIM</span> Inventory</div>		
			
						
		</div>
		

		<div id="sidebar" >							
			
			<% if((Integer)session.getAttribute("loginAs") == 0) { %>
				<%@ include file="LinksSp.jsp"%>
			<%}  else if((Integer)session.getAttribute("loginAs") == 1) { %>
				<%@ include file="LinksManufacturer.jsp"%>
			<%} %>
		
			<%@ include file="WiseWords.jsp"%>
			
			<%@ include file="SupportGSI.jsp"%>
		
				
		</div>		
		
							
		<div id="main">				
			
		<% Sim sobj = (Sim)request.getAttribute("simDetailsRetrieve");
		String msg="";
			if(sobj.getSimId()==0){
				msg = "Invalid sim id";
			}
		%>
		<form id="simDeatailsForm" action="SimController" method="post">

<input type = "hidden" name ="checkPage" value="simRetrieval" />
<center>
<table width=100%>
	<tr>
		<td width=40%>Search By<font color=#FF0000>&nbsp *</font></td>
		<td width=40%><select name="searchBy" id="searchBy"
			onfocusout="changeSelect()">
			<option value="Select">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp---Select---&nbsp&nbsp&nbsp&nbsp&nbsp</option>
			<option value="SimId">SIM ID</option>
			<option value="ICCID">ICCID</option>
			<option value="IMSINo">IMSI NO</option>
		</select></td>
		<td width=55%>
		<p name="selectSearchBy" id="selectSearchBy" style="color: #FF0000">&nbsp</p>
		</td>
	<tr>
		<td width=40%>Enter Value<font color=#FF0000>&nbsp *</td>
		<td><input width="40%" name="txtEnterValue" id="txtEnterValue"
			maxlength="18" onfocusout="checkValue()"/></td>
		<td>
		<p name="txtEnterValueP" id="txtEnterValueP" style="color: #FF0000">&nbsp</p>
		</td>
	</tr>

	<tr>
		<td colspan="3" align="center">
		<p id="msg" name="msg" class="pmsg">Fields marked as <font
			color=#FF0000>*</font> are mandatory<%= msg%></p>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td><input type="button" class="button" value="Submit"
			onclick="validate()" /></td>
		<td>&nbsp &nbsp &nbsp</td>
		<td><input type="button" class="button" value="Reset"
			onclick="resetValues()" /></td>
	</tr>
</table>

			    <br />
				
			    <table border="1" width=60%>
			    	<tr>
			    		<th align="left" width=40%>SIM Id</th><td width=60%>&nbsp&nbsp&nbsp<%=sobj.getSimId() %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=40%>ICCID</th><td width=60%>&nbsp&nbsp&nbsp<%=sobj.getICCID() %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=40%>IMSI Number</th><td width=60%>&nbsp&nbsp&nbsp<%=sobj.getIMSI_No() %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=40%>PIN1</th><td width=60%>&nbsp&nbsp&nbsp<%=sobj.getPIN1() %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=40%>PIN2</th><td width=60%>&nbsp&nbsp&nbsp<%=sobj.getPIN2() %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=40%>PUK1</th><td width=60%>&nbsp&nbsp&nbsp<%=sobj.getPUK1() %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=40%>PUK2</th><td width=60%>&nbsp&nbsp&nbsp<%=sobj.getPUK2() %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=40%>Manufacture Date</th><td width=60%>&nbsp&nbsp&nbsp<%=sobj.getManufactureDate() %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=40%>Order Id</th><td width=50%>&nbsp&nbsp&nbsp<%=sobj.getOrderId() %></td>
			    	</tr>
	 		  </table>
			</center>
		</form>
		
			
			
</div>
		
<!-- footer starts here -->
<div class="footer">
	
		<%@ include file="FooterMenu.jsp"%>
		
</div>	
	</div>
</body>
</html>