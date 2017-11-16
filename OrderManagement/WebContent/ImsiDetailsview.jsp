<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.bean.imsi.Imsi" %>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Page-Enter" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />			
<script type="text/javascript" src="javascript/ImsiValidateNew.js"></script>
<title>GSI-Imsi</title>	

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
			<h1 align="center">IMSI DETAILS</h1>
			<form id="imsiViewForm" action="ImsiDetailsController" method="get">
		<input type="hidden" name="checkPage" id="checkPage" value="imsiDetailsView"></input>
			<center>
				<table width=100% align="center">
					<tr>
						<td width=30%>Imsi Number<font color=#FF0000>&nbsp*</font></td>
						<td width=20%>:&nbsp<input name="txtImsi" id="txtImsi"
							type="text" maxlength='15'></td>
						<td>&nbsp&nbsp</td>
						<td width=50%><input type="button" class="button" value="Submit" onclick="checkImsi(15)"></td>
					</tr>
					<tr>
						
						<td colspan=4 width=100%>
						<p name="txtImsiP" id="txtImsiP" style="color: #FF0000">&nbsp</p>
						</td>
					</tr>
					<tr>
						<td colspan="4" >
						<p id="msg" name="msg" class="pmsg">Fields marked as <font
							color=#FF0000>*</font> are mandatory</p>
						</td>
					</tr>
			    </table>
			    <br/>
			     <% System.out.println("After out");%>
			    <%Imsi iobj = (Imsi)request.getAttribute("Imsi");%>
			   
			    
			    <table border="1" width=70%>
			    	<tr>
			    		<th align="left" width=50%>IMSI Number</th><td width=50%>&nbsp&nbsp&nbsp<%=iobj.getImsiNumber()%></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=50%>IMSI Type</th><td width=50%>&nbsp&nbsp&nbsp<%=iobj.getImsiType()%></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=50%>IMSI Status</th><td width=50%>&nbsp&nbsp&nbsp<%=iobj.getImsiStatus()%></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=50%>Subscription Type</th><td width=50%>&nbsp&nbsp&nbsp<%=iobj.getSubscriptionType()%></td>
			    	</tr>
			    	<tr>
			    		<th align="left" width=50%>Creation Date</th><td width=50%>&nbsp&nbsp&nbsp<%=iobj.getCreationDate()%></td>
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