<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<%@ page import= "java.io.*,
				  java.text.*,
				  com.bean.sim.Sim"
 %>


<title>SIM Details</title>
<link rel="stylesheet" type="text/css" href="../css/layout.css" />

<!-- SCRIPT -->
<script type="text/javascript" src="../javascript/OrderIdValidate.js"></script>
</head>
<body>

<!-- MAIN CONTAINER -->
<table class="container" border=1>
	<!-- class="container" -->


	<!-- GLOBAL SIM INVENTORY HEADER -->
	<tr class="main_header">
		<!-- class="main_header" -->
		<td class="set_width_100">
		<div id="header" class="main_header_internal">
		<table width=100%>
			<tr>
				<td width=2%></td>

				<!-- IMAGE -->
				<td width=20% id="company_logo" class="company_logo"><img
					src="../images/logo_s.jpeg" class="company_logo_image" /></td>

				<!-- TITLE -->
				<td width=75%>
				<h1 class="main">GLOBAL SIM INVENTORY SYSTEM</h1>
				</td>
			</tr>
		</table>
		</div>
		</td>
	</tr>

	<!-- TOP MENU -->
	<tr class="top_menu">
		<td>

		<div id="main_menu" class="top_menu_internal">
		<table>
			<tr width=100%>
				<td width=77%>&nbsp &nbsp <a href="Home.html" id="homelink">Home</a>
				</td>
				<td width=23% style="text-align: right;"><a
					href="Site_under_development.html" name="SiteMap">Site Map</a>
				&nbsp &nbsp <a href="Site_under_development.html" name="ContactUs">Contact
				Us</a> &nbsp &nbsp <a href="Site_under_development.html" name="Login">Login</a>&nbsp</td>
			</tr>
		</table>
		</div>

		</td>
	</tr>

	<!-- BODY AND LEFT MENU -->
	<tr class="left_menu_body">
		<td><!-- LEFT MENU -->
		<div id="left_menu" class="left_menu_internal"><!-- LEFT MENU LINKS -->



		<br />
		&nbsp &nbsp <a href="Order_Details.html" name="orderDetails">Order
		Details</a> <br />
		<br />
		&nbsp &nbsp <a href="Sim_Registration.html" name="simRegistration">SIM
		Registration</a> <!-- LEFT MENU LINKS ENDS --></div>
		<!-- MAIN BODY -->
		<div id="body" class="body_internal">
		<center>
		<div id="body_header" class="body_header">
		<h3 class="main"><!--change BODY HEADING -------------------- --> SIM DETAILS</h3>
		</div>
		</center>
		<center>
		<div id="content" class="body_content"><!-- BODY CONTENT -->
		<center>
		
		<div class="body_content_internal"><br />

		<!-- change BODY CONTENT STARTS HERE ----------------------> 
		<% Sim sobj = (Sim)request.getAttribute("simDetailsRetrieve");
			String status=(String)request.getAttribute("simCreationStatus");
		%>
		<form id="orderForm" action="OrderController" method="post">
			<center>
				<table width=50% align="center">
					<tr>
						<td width=25%>Order Id</td>
						<td width=30%>:&nbsp<input name="txtOrderId" id="txtOrderId"
							type="text" maxlength='5' onfocusout="isNumber(this.id,5)"></td>
						<td>&nbsp&nbsp</td>
						<td width=55%><input type="button" value="Submit" onclick=orderIdValidate();></td>
						<td><input type="button" value="Reset" onclick=
	resetValues();
></td>
					</tr>
					<tr>
						<td width=20%>&nbsp&nbsp&nbsp&nbsp</td>
						<td colspan=2>
						<p name="txtOrderIdP" id="txtOrderIdP" style="color: #FF0000">&nbsp</p>
						</td>
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
	 		<p style="color: red">
		${simCreationStatus}</p>
			</center>
		</form>
			
					
		<!--change BODY CONTENT ENDS HERE -------------------- -->
		
		</div>
	
		
		</center>
		</div>
		</center>
		</div>


		</td>
	</tr>

	<!-- BOTTOM COPYRIGHT -->
	<tr class="footer">
		<td>
		<div id="footer" class="footer_internal">
		<p class="header_footer">&nbsp &nbsp Global SIM Inventory Private
		Limited © 2012. All Rights Reserved</p>
		</div>
		</td>
	</tr>

</table>
</body>
</html>