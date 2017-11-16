<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@page import="java.util.Formatter"%>
<%@page import="java.util.Date"%><html
	xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>


<meta http-equiv="Page-Enter"
	content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit"
	content="RevealTrans(Duration=1.0,Transition=12)" />




<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />

<title>Contact Us</title>

</head>

<body>
<!-- wrap starts here -->
<div id="wrap"><!-- header -->
<div id="header"><span id="slogan"> Communicate and
Socialize...</span> <!-- tabs --> <%@ include file="TopHomeMenu.jsp"%>

</div>

<div id="header-logo">

<div id="logo">Global <span class="red">SIM</span> Inventory</div>




<form><%@page import="java.util.Date"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%
	Format formatter;
	String s;
	Date date = new Date();
	formatter = new SimpleDateFormat("E, dd MMM yyyy HH:mm");
	s = formatter.format(date);
%>
<p align="right"><%=s%>
</form>

</div>


<div id="sidebar"><%@ include file="WiseWords.jsp"%>

<%@ include file="SupportGSI.jsp"%></div>


<div id="main"><a name="TemplateInfo"></a>
<h1 align="center">LET'S CONNECT</h1>
<form>
<p style="text-align: justify"><font size=2
	style="Monotype Corsiva" size=3> We are there for your support.
To contact us:
<table>
	<tr>
		<td>Visit Us:</td>
		<td>231, Tower Street, California<br><a href=>Get directions</a></br></td>
		<td rowspan=4><img src="images/address.gif"><a href="http://maps.google.co.in/maps/place?q=231+Tower+Street,+La+Mesa,+California,+United+States&hl=en&ftid=0x80d956e9bfc2e7e3:0x366e217628a29c81"></a></img></td>
	</tr>
	<tr>

		<td>Call Us:</td>
		<td>Phone: 9999777799<br>Landline: 0361-9997799
		</td>

	</tr>
	<td>EMAIL Us:</td>
	<td><a href="">gsi@globalsiminventory.com</a></td>

</table>





<br> You can also send your messages or feedback on the 
<a href="Feedback.jsp">feedback link.</a></br>

<br />
<br />
<br />
</font></p>
</form>
</div>

<!-- footer starts here -->
<div class="footer"><%@ include file="FooterMenu.jsp"%>

</div>
</body>
</html>
