<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Page-Enter" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />			
<script type="text/javascript" src="javascript/SimRegistration.js"></script>
<title>SIM Registration</title>	

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
			
			<%@ include file="LinksManufacturer.jsp"%>
		
			<%@ include file="WiseWords.jsp"%>
			
			<%@ include file="SupportGSI.jsp"%>
		
				
		</div>		
		
							
		<div id="main">				
			
			<a name="TemplateInfo"></a>
			<h1 align="center">SIM Registration</h1>
			<form id="simRegistration" action="SimController" method="post">
		<input type = "hidden" name ="checkPage" value="simRegistration">
		<center>
		<table width=100%>
			<tr>
				<td width=35% align="right">Order Id <font color=#FF0000>&nbsp *</font></td>
				<td width=30%>:&nbsp<input name="txtOrderId" id="txtOrderId"
					type="text" maxlength='5' onfocusout="isNumber(this.id,5)"></td>
				<td width=55%>
				<p name="txtOrderIdP" id="txtOrderIdP" style="color: #FF0000">&nbsp</p>
				</td>
			</tr>
			<tr>
				<td width=35% align="right">Quantity<font color=#FF0000>&nbsp *</font></td>
				<td width=30%>:&nbsp<input name="txtQuantity" id="txtQuantity"
					type="text" maxlength='4' onfocusout="isNumber(this.id,4)"></td>
				<td width=55%>
				<p name="txtQuantityP" id="txtQuantityP" style="color: #FF0000">&nbsp</p>
				</td>
			</tr>
			<tr>
				<td width=35% align="right">PIN1<font color=#FF0000>&nbsp *</font></td>
				<td width=30%>:&nbsp<input name="txtPIN1" id="txtPIN1"
					type="text" maxlength='4' onfocusout="isNumber(this.id,4)"></td>
				<td width=55%>
				<p name="txtPIN1P" id="txtPIN1P" style="color: #FF0000">&nbsp</p>
				</td>
			</tr>
			<tr>
				<td width=35% align="right">PIN2<font color=#FF0000>&nbsp *</font></td>
				<td width=30%>:&nbsp<input name="txtPIN2" id="txtPIN2"
					type="text" maxlength='4' onfocusout="isNumber(this.id,4)"></td>
				<td width=55%>
				<p name="txtPIN2P" id="txtPIN2P" style="color: #FF0000">&nbsp</p>
				</td>
			</tr>
			<tr>
				<td width=35% align="right">PUK1<font color=#FF0000>&nbsp *</font></td>
				<td width=30%>:&nbsp<input name="txtPUK1" id="txtPUK1"
					type="text" maxlength='8' onfocusout="isNumber(this.id,8)"></td>
				<td width=55%>
				<p name="txtPUK1P" id="txtPUK1P" style="color: #FF0000">&nbsp</p>
				</td>
			</tr>
			
			<tr>
				<td width=35% align="right">PUK2<font color=#FF0000>&nbsp *</font></td>
				<td width=30%>:&nbsp<input name="txtPUK2" id="txtPUK2"
					type="text" maxlength='8' onfocusout="isNumber(this.id,8)"></td>
				<td width=55%>
				<p name="txtPUK2P" id="txtPUK2P" style="color: #FF0000">&nbsp</p>
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
				<td><input type="button" class="button" value="Submit"
					onclick=
	simRegistrationValidate();
></td>
				<td>&nbsp &nbsp &nbsp
				<td />
				<td><input type="button" class="button" value="Reset" onclick=
	resetValues();
></td>
			</tr>
		</table>
		<p style="color: red">
		${simCreationStatus}</p>
		<center>
		</form>

</div>
		
<!-- footer starts here -->
<div class="footer">
	
		<%@ include file="FooterMenu.jsp"%>
		
</div>	
	</div>
</body>
</html>