<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.bean.order.Order" %>
<%Order o = (Order)request.getAttribute("order");%>

<%@page import="com.controller.SimController"%>
<%@page import="com.model.user.UserList"%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Page-Enter" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />			
<script type="text/javascript" src="javascript/OrderIdValidate.js"></script>
<title>Order Details</title>	

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
			
			<a name="TemplateInfo"></a>
			<h1 align="center">Order Details</h1>
				
				
			
			
			<form id="orderForm" action="OrderDetailsController" method="post">
			<input type="hidden" name="checkPage" value="details">
			
			<center>
				<table width=100% align="center">
					<tr>
						<td width=25%>Order Id</td>
						<td width=30%>:&nbsp<input name="txtOrderId" id="txtOrderId"
							type="text" maxlength='5' onfocusout="isNumber(this.id,5)"></td>
						<td>&nbsp&nbsp </td>
						<td width=55%><input type="button" class="button" value="Submit" onclick="orderIdValidate();"></td>
					</tr>
					<tr>
						<td width=20%>&nbsp&nbsp&nbsp&nbsp</td>
						<td colspan=2>
						<p id="msg"></p>
						<p name="txtOrderIdP" id="txtOrderIdP" style="color: #FF0000">&nbsp</p>
						</td>
					</tr>
			    </table>
			    			<%UserList ul = new UserList(); %>	
			    <table border="1" width=70%>
			    	<tr>
			    		<th align="left" width=50%>Order ID</th><td width=50%>&nbsp&nbsp&nbsp<%=o.getOrderId()%></td>
			    	</tr>
			    	<%if((Integer)session.getAttribute("loginAs")==0) { %>
			    	<tr>
			    		<th align="left" width=50%>Manufacturer Name</th><td width=50%>&nbsp&nbsp&nbsp<%= ul.companyName(o.getmId(), 1) %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=50%>Manufacturer ID</th><td width=50%>&nbsp&nbsp&nbsp<%= o.getmId() %></td>
			    	</tr>
			    	<%} else {%>
			    	<tr>
			    		<th align="left" width=50%>Service Provider Name</th><td width=50%>&nbsp&nbsp&nbsp<%= ul.companyName(o.getsId(), 0) %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=50%>Service Provider ID</th><td width=50%>&nbsp&nbsp&nbsp<%= o.getsId() %></td>
			    	</tr>
			    	<%} %>
			    	<tr>
			    		<th align="left" width=50%>IMSI Type</th><td width=50%>&nbsp&nbsp&nbsp<%= o.getImsiType()%></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=50%>Subscription Type</th><td width=50%>&nbsp&nbsp&nbsp<%= o.getSubscriptionType() %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=50%>IMSI Range</th><td width=50%>&nbsp&nbsp&nbsp<%= o.getStartImsi() %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=50%>ICCID No</th><td width=50%>&nbsp&nbsp&nbsp<%= o.getIccid() %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=50%>Quantity</th><td width=50%>&nbsp&nbsp&nbsp<%= o.getQuantity() %></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=50%>Order Date</th><td width=50%>&nbsp&nbsp&nbsp<%= o.getDate() %></td>
			    	</tr>
			    	<%SimController sc = new SimController(); %>
			    	<tr>
			    		<th align="left" width=50%>Number of SIMs manufactured</th><td width=50%>&nbsp&nbsp&nbsp<%= sc.controllerManufacturedQuantity(o.getOrderId()) %></td>
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