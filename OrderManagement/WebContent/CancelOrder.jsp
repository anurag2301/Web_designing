<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Page-Enter" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit" 
content="RevealTrans(Duration=1.0,Transition=12)" />




<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />			
<script type="text/javascript" src="javascript/CancelOrderValidate.js"></script>

<title>Cancel Order</title>	

</head>

<body onload="resetValues()">
<!-- wrap starts here -->
<div id="wrap">

		<!-- header -->
		<div id="header">			
					
			<span id="slogan"> Communicate and Socialize...</span>
			
			<!-- tabs -->
			<ul>
				<li id="current"><a href="HomeTemp.jsp"><span>Home</span></a></li>
				<li><a href="UserLogin.jsp"><span>Login</span></a></li>
				<li><a href="Services.jsp"><span>Services</span></a></li>
				<li><a href="ContactUs.jsp"><span>Contact Us</span></a></li>
				<li><a href="About.jsp"><span>About</span></a></li>			
			</ul>
											
		</div>
		
		<div id="header-logo">			
			
			<div id="logo">Global <span class="red">SIM</span> Inventory</div>		
			
			<form method="post" class="search" action="#">
				<p><input name="search_query" class="textbox" type="text" />
  				<input name="search" class="searchbutton" value="Search" type="submit" /></p>
			</form>
						
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
			<h1 align="center">CANCEL ORDER</h1>
			<form id="cancelOrderForm" action="CancelOrderController" method="get">
			<input type="hidden" name="checkPage" id="checkPage" value="cancelOrder"> 
			<center>
		
				<table width=100% align="center" border=0>
					<tr>
						<td width=25%>Order Id <font color=#FF0000>&nbsp *</font></td>
						<td width=25%>:&nbsp<input name="txtOrderId" id="txtOrderId" type="text" maxlength='5' size='10' onfocusout="isNumber(this.id,5)"></td>
						<td><input type="button" class="button" value="Cancel" onclick="cancelOrderValidate()"></td>
					</tr>
					<br/>
					<tr>
						<td width=20%>&nbsp&nbsp&nbsp&nbsp</td>
						<td colspan=2>
						<p name="txtOrderIdP" id="txtOrderIdP" style="color: #FF0000">&nbsp</p>
						</td>
					</tr>
					<tr>
						<td colspan="3">&nbsp</td>
					</tr>
		
					<tr>
						<td colspan="3">
						<p id="msg" name="msg" class="pmsg">Fields marked as <font
							color=#FF0000>*</font> are mandatory</p>
						</td>
					</tr>
				</table>
		
				<br />
				<br />
				<br />
				
			</center>
		</form>
		
			
</div>
		
<!-- footer starts here -->
<div class="footer">
	
		<p>	
		&copy; 2012 <strong>Global SIM Inventory Private
		Limited</strong> &nbsp;&nbsp;	 
		Design by: <a href="http://www.styleshout.com/">Group 6</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="index.html">Home</a> |  	
   	<a href="index.html">Site Map</a> |
		<a href="index.html">RSS Feed</a>				
		</p>
		
</div>	
	
</body>
</html>