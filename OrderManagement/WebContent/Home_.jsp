<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Page-Enter"
	content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit"
	content="RevealTrans(Duration=1.0,Transition=12)" />




<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />

<title>Global SIM Inventory System</title>

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

			<div id="logo">
				Global <span class="red">SIM</span> Inventory
			</div>

			<form method="post" class="search" action="#">
				<p>
					<input name="search_query" class="textbox" type="text" /> <input
						name="search" class="searchbutton" value="Search" type="submit" />
				</p>
			</form>

		</div>


		<div id="sidebar">

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
			<h1 align="center">Home Page</h1>
			<form>
				<p style="text-align: justify">
					<font style="Monotype Corsiva" size=3>Global SIM Inventory
					is one of the leading SIM manufacturing company in the world. It
					has more than 50 clients. More than 20% of the SIMs used today are
					made by Global SIM Inventory. We believe mobile communication can
					lead a revolution. Be a part of us and be an art of our revolution.</font>
				</p>
			</form>
		</div>

		<!-- footer starts here -->
		<div class="footer">

			<%@ include file="FooterMenu.jsp"%>

		</div>
</body>
</html>
