<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="java.util.Formatter"%>
<%@page import="java.util.Date"%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>


<meta http-equiv="Page-Enter" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit" 
content="RevealTrans(Duration=1.0,Transition=12)" />




<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />			

<title>Contact Us</title>	

</head>

<body >
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
			
			
			
			
			<form><%@page import ="java.util.Date"%>
			<%@page import="java.text.Format" %>
			<%@page import ="java.text.SimpleDateFormat" %>
			<%@page import="java.text.DateFormat" %>
			<%	Format formatter;
			String s;
			Date date = new Date();
			formatter = new SimpleDateFormat("E, dd MMM yyyy HH:mm");
			s = formatter.format(date);%>
			<p align="right">
				<%=s%>
			</form>
						
		</div>
		

		<div id="sidebar" >							
	
			<%@ include file="WiseWords.jsp"%>
			
			<%@ include file="SupportGSI.jsp"%>
		
				
		</div>		
		
							
		<div id="main">				
			
			<a name="TemplateInfo"></a>
			<h1 align="center">CONTACT US</h1>
			<form>
			<p style = "text-align: justify"><font style = "Monotype Corsiva" size=3>
			We are there for your support. To contact us:
			<br>
			Phone: 9999777799
			<br>
			Landline: 0361-9997799
			<br>
			e-mail id: 
			<a href="">gsi@globalsiminventory.com</a>
			
		
		<br/>
		<br/>
		<br/>
		
		
		
		</font> </p>
			</form>
</div>
		
<!-- footer starts here -->
<div class="footer">
	
		<%@ include file="FooterMenu.jsp"%>
		
</div>	
	
</body>
</html>
