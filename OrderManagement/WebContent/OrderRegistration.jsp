<%@page import="com.model.order.GetOrderDetails"%>
<%@page import="com.bean.user.User"%>
<%@page import="com.model.order.AddOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.model.user.UserList"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Page-Enter" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />			
<script type="text/javascript"
	src="javascript/OrderRegistrationValidate.js"></script>
<title>Order Registration</title>	

</head>

<body onload="resetValues()">
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
			<h1 align="center">Order Registration</h1>
			<form id="registerOrderForm" action="OrderController"
			method="post">
			
			<% GetOrderDetails god = new GetOrderDetails(); ArrayList<Integer> maxQuantityList=god.getQuantityForDate(((User)session.getAttribute("user")).getsId()+"");%>
		<input type = "hidden" name ="checkPage" value="register">
		
		<input type = "hidden" id="hiddenServiceProviderId" name ="hiddenServiceProviderId" value=<%=((User)session.getAttribute("user")).getsId()  %>></input>
		<input type = "hidden" id="hiddenMaximumQuantity" name ="hiddenMaximumQuantity" value="9999"></input>
		<input type = "hidden" id="hiddenMaximumQuantity0" name ="hiddenMaximumQuantity0" value="9999"></input>
		<%int i= 1; for(int maxQuantity: maxQuantityList) { %>
			<input type = "hidden" id="hiddenMaximumQuantity<%=i %>" name ="hiddenMaximumQuantity<%=i %>" value=<%=maxQuantityList.get(i-1) %>></input>
		<% i++;}%>
		
		
		<% AddOrder ao = new AddOrder(); int oId= ao.generateOrderId(); %>
		
		<input type= "hidden" name="hiddenOrderId" id="hiddenOrderId" value=<%=oId %>></input>
		<input type = "hidden" id="hiddenImsiRange" name ="hiddenImsiRange">
		<input type= "hidden" name="hiddenIccidRange" id="hiddenIccidRange">
		
		<center>
		<table width=100%>
			<tr>
				<td width=32% align="left">Order Id <font color=#FF0000>&nbsp
				*</font></td>
				<td width=31%>:&nbsp<input 
					type="text" value=<%=oId %> disabled="disabled" size=25></td>
				<td width=37%>
				<p name="txtOrderIdP" id="txtOrderIdP" style="color: #FF0000">&nbsp</p>
				</td>
			</tr>

			<tr>
				<td align="left">Manufacturer ID<font color=#FF0000>&nbsp
				*</font></td>
				<td>:&nbsp<select id="selectManufacturerId"
					name="selectManufacturerId" onfocusout="checkManuSelectBox(this.id)">
					<option value="Nothing">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp-Select-&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</option>
					<%UserList ul = new UserList(); ArrayList<String> manuList = ul.manufacturerList(); %>
					<% for(String s : manuList) {%>
						<option value=<%=ul.manufacturerId(s) %>><%=s+"-"+ul.manufacturerId(s) %></option>
					<%} %>
				</select></td>
				<td>
				<p name="selectManufacturerIdP" id="selectManufacturerIdP"
					style="color: #FF0000"></p>
				</td>
			</tr>

			<tr>
				<td align="left">IMSI Type <font color=#FF0000>&nbsp *</font></td>
				<td>:&nbsp<select id="selectImsiType" name="selectImsiType"
					onfocusout="checkSelectBox(this.id)" onchange="checkImsiType()">
					<option value="Nothing">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp-Select-&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</option>
					<option value="Single">Single</option>
					<option value="Double">Dual</option>
				</select></td>
				<td>
				<p name="selectImsiTypeP" id="selectImsiTypeP"
					style="color: #FF0000"></p>
				</td>
			</tr>

			<tr>
				<td align="left">Subscription Type<font color=#FF0000>
				*</font></td>
				<td>:&nbsp<select id="selectSubscriptionType"
					name="selectSubscriptionType" onfocusout="checkSelectBox(this.id)" onchange="checkSubscriptionType ()">
					<option value="Nothing">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp-Select-&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</option>
					<option value="Prepaid">Prepaid</option>
					<option value="Postpaid">Postpaid</option>
				</select></td>
				<td>
				<p name="selectSubscriptionTypeP" id="selectSubscriptionTypeP"
					style="color: #FF0000"></p>
				</td>
			</tr>

			<tr>
				<td align="left">Quantity <font color=#FF0000>&nbsp
				*</font></td>
				<td>:&nbsp<input name="txtQuantity" id="txtQuantity"
					type="text" value=0000 maxlength='4'
					onfocusout="isNumber(this.id,4)" size=25></td>
				<td>
				<p name="txtQuantityP" id="txtQuantityP" style="color: #FF0000">&nbsp</p>
				</td>
			</tr>

			<tr>
				<td align="left">Date<font color=#FF0000>&nbsp
				*</font></td>
				<td>:&nbsp<input name="txtDate" id="txtDate"
					type="text" maxlength='10' onfocusout="checkDate()" size=25></td>
				<td>
				<p name="txtDateP" id="txtDateP" style="color: #FF0000">&nbsp</p>
				</td>
			</tr>

			<tr>
				<td align="left">ICCID Number <font color=#FF0000>&nbsp
				*</font></td>
				<td>:&nbsp<input name="txtIccidNumber"
					id="txtIccidNumber" type="text" 
					disabled="disabled" size=25></td>
				<td>
				<p name="txtIccidNumberP" id="txtIccidNumberP"
					style="color: #FF0000">&nbsp</p>
				</td>
			</tr>

			<tr>
				<td align="left">IMSI Range <font color=#FF0000>&nbsp
				*</font></td>
				<td>:&nbsp<input name="txtImsiNumber"
					id="txtImsiNumber" type="text" 
					disabled="disabled" size=25></td>
				<td>
				<p name="txtImsiNumberP" id="txtImsiNumberP" style="color: #FF0000">&nbsp</p>
				</td>
			</tr>

			

			<tr>
				<td colspan="3">
				<p id="msg" name="msg" class="pmsg">Fields marked as <font
					color=#FF0000>*</font> are mandatory</p>
				</td>
			</tr>
		</table>


		<table>
			<tr>
				<td><input type="button" class="button" value="Submit"
					onclick=
	registerOrderValidate();
></td>
				<td>&nbsp &nbsp &nbsp
				<td />
				<td><input type="button" class="button" value="Reset" onclick=
	resetValues();
></td>
			</tr>
		</table>
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