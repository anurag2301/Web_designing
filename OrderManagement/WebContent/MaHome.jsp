
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.bean.user.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Page-Enter"
	content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit"
	content="RevealTrans(Duration=1.0,Transition=12)" />

<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />

<title>Manufacturer Home</title>

</head>

<body>
<!-- wrap starts here -->
<div id="wrap"><!-- header -->
<div id="header"><span id="slogan"> Communicate and
Socialize...</span> <!-- tabs --> <%@ include file="TopMenu.jsp"%>

</div>

<div id="header-logo">

<div id="logo">Global <span class="red">SIM</span> Inventory</div>


</div>


<div id="sidebar"><%@ include file="LinksManufacturer.jsp"%>

<%@ include file="WiseWords.jsp"%> <%@ include
	file="SupportGSI.jsp"%></div>


<div id="main">
<%
	session.setAttribute("loginAs", 1);
%> <a name="TemplateInfo"></a>
<h1 align="center">USER DETAILS</h1>
<img src="images/manufacturer.jpg" align="right"></img>

<table align="center" border="1" color="black">
	<tr>
		<td>User Name:</td>
		<td><%=((User) session.getAttribute("user")).getUserName()%></td>
	</tr>
	<tr>
		<td>User Role:</td>
		<td>Manufacturer</td>
	</tr>
</table>
<%@page import="java.util.*"%>
<%=new java.util.Date()%></p>


</div>

<!-- footer starts here -->
<div class="footer"><%@ include file="FooterMenu.jsp"%>

</div>
</div>
</body>
</html>































