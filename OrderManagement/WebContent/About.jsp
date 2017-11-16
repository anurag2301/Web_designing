<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="java.util.Formatter"%>
<%@page import="java.util.Date"%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>


<meta http-equiv="Page-Enter" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit" 
content="RevealTrans(Duration=1.0,Transition=12)" />




<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />			

<title>About</title>	



</head>

<body >
<!-- wrap starts here -->
<div id="wrap">


		<!-- header -->
		<div id="header">			
					
			<span id="slogan"> Communicate and Socialize...</span>
			
			<!-- tabs -->
			<%@ include file="TopHomeMenu.jsp"%>
											
		</div>
		
		<div id="header-logo">			
			
			<div id="logo">Global <span class="red">SIM</span> Inventory</div>		
			
			<form><%@ include file="Timer.jsp"%></form>
			
			
			
						
		</div>
		

		<div id="sidebar" >							
			
			
		
			<%@ include file="WiseWords.jsp"%>
			
			<%@ include file="SupportGSI.jsp"%>
		
		</div>		
		
							
		<div id="main">				
			
			<a name="TemplateInfo"></a>
			<h1 align="center">ABOUT US</h1>
			<form>
			<p style = "text-align: justify"><font style = "Monotype Corsiva" size=3>Global SIM Inventory is one of the leading SIM manufacturing company in
		the world. It has more than 50 clients. Our products include various types of SIM cards: Prepaid, Postpaid, Single and Dual. We also provide a variety 
		of services to our valued customers. 
		We believe mobile communication can lead
		a revolution. Be a part of us and be a part of this revolution.
		<br/>
		<br/>
		<br/>
		
		Owned by: Group 6
		
		
		</font> </p>
			</form>
</div>
		
<!-- footer starts here -->
<div class="footer">
	
		<%@ include file="FooterMenu.jsp"%>
		
</div>	
	
</body>
</html>
