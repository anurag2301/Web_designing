<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.bean.order.Order" %>
<%Order o = (Order)request.getAttribute("order");%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Page-Enter" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />			

<title>GSI-Order List</title>	

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
			<h1 align="center">Order List</h1>
			
			<form>
			<table align="center"  border=1 width="100%">
					<tr>
						<th>Order Id</th><th>Manufacturer ID</th><th>Order Date</th><th>Quantity</th><th>Starting ICCCID</th><th>Starting IMSI</th>
					</tr>
				</table>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<br/>
				<table align="center" width="100%">
					<tr>
						<td align="left" width="50%"><button type="button" name="previous" id="previous">previous</button></td><td align="right" width="50%"><button type="button" name="next" id="next">next</button></td>
					</tr>
				</table>
				</form>
		
			
</div>
		
<!-- footer starts here -->
<div class="footer">
	
		<%@ include file="FooterMenu.jsp"%>
		
</div>	
	</div>
</body>
</html>