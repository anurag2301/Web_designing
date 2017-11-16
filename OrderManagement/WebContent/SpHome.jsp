<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.bean.user.User"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Page-Enter"
	content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit"
	content="RevealTrans(Duration=1.0,Transition=12)" />

<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />

<title>Service Provider Home</title>

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


<div id="sidebar"><%@ include file="LinksSp.jsp"%>

<%@ include file="WiseWords.jsp"%> <%@ include
	file="SupportGSI.jsp"%></div>


<div id="main"><a name="TemplateInfo"></a>
<h1 align="center">USER DETAILS</h1>
<img src="images/serviceProvider.jpg" align="right"></img> <%
 	session.setAttribute("loginAs", 0);
 %>
<table align="center" border="1" color="black">
	<tr>
		<td>User Name:</td>
		<td><%=((User) session.getAttribute("user")).getUserName()%></td>
	</tr>
	<tr>
		<td>User Role:</td>
		<td>Service Provider</td>
	</tr>
</table>
<br />
<br />
</div>


</div>

<!-- footer starts here -->
<div class="footer"><%@ include file="FooterMenu.jsp"%>

</div>
</div>
</body>
</html>






