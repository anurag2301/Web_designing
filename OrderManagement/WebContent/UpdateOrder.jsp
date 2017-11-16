<html>
<head>
<title>Update Order Status</title>
<link rel="stylesheet" type="text/css" href="css/layout.css" />

<!-- SCRIPT -->
<script type="text/javascript"
	src="javascript/UpdateOrderValidate.js"></script>
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
					src="images/logo_s.jpeg" class="company_logo_image" /></td>

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
		<h3 class="main">UPDATE ORDER STATUS</h3>
		</div>
		</center>
		<center>
		<div id="content" class="body_content"><!-- BODY CONTENT -->
		<center>
		<div class="body_content_internal"><!-- BODY CONTENT --> <br />
		<br />
		<br />
		<!-- change BODY CONTENT STARTS HERE -------------------- --> <br />
		<form id="updateOrderForm" action="../UpdateOrderController"
			method="post">
		<center>
		<table width=70%>
			<tr>
				<td width=20%>Order Id <font color=#FF0000>&nbsp *</font></td>
				<td width=25%>:&nbsp<input name="txtOrderId" id="txtOrderId"
					type="text" maxlength='5' onfocusout="isNumber(this.id,5)"></td>
				<td width=55%>
				<p name="txtOrderIdP" id="txtOrderIdP" style="color: #FF0000">&nbsp</p>
				</td>
			</tr>

			<tr>
				<td>Set status to <font color=#FF0000>&nbsp *</font></td>
				<td>:&nbsp<select id="selectOrderStatus"
					name="selectOrderStatus" onformout="checkSelectBox(this.id)">
					<option value="Nothing">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp-Select-&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</option>
					<option value="OP">Order In Progress</option>
					<option value="OI">OI</option>
					<option value="OB">OB</option>
					<option value="OC">Order Cancelled</option>
				</select></td>
				<td>
				<p name="selectOrderStatusP" id="selectOrderStatusP"
					style="color: #FF0000"></p>
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
		<table>
			<tr>
				<td><input type="button" value="Submit"
					onclick=updateOrderValidate();></td>
				<td>&nbsp &nbsp &nbsp<td />
				<td><input type="button" value="Reset" onclick=resetValues();></td>
			</tr>
		</table>
		</center>
		</form>

		<!-- BODY CONTENT ENDS --></div>


		<br />
		<br />
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