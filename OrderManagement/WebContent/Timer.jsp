<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Timer</title>
<style>
.details
{
font-family	 : MS Sans Serif, arial;
font-size	 : 16;
font-weight	 : bold;
color	 : #000000;

}
</style>
</head>
<body onload="curTime()">

		<script type="text/javascript">
<!--
// == This Script Free To Use Providing This Notice Remains ==
// == This Script Has Been In The http://www.DesignerWiz.com Javascript Public Archive Library ==
// == NOTICE: Though This Material May Have Been In A Public Depository, Certain Author Copyright Restrictions May Apply ==
function curTime()
{
var now=new Date();
var hrs=now.getHours();
var min=now.getMinutes();
var sec=now.getSeconds();
var don="AM";
if (hrs>=12){ don="PM"; }
if (hrs>12) { hrs-=12; }
if (hrs==0) { hrs=12; }
if (hrs<10) { hrs="0"+hrs; }
if (min<10) { min="0"+min; }
if (sec<10) { sec="0"+sec; }
clock.innerHTML=hrs+":"+min+":"+sec+" "+don;
setTimeout("curTime()",1000);
}
</script>
<%@page import ="java.util.Date"%>
			<%@page import="java.text.Format" %>
			<%@page import ="java.text.SimpleDateFormat" %>
			<%@page import="java.text.DateFormat" %>
			<%	Format formatter;
			String s;
			Date date = new Date();
			formatter = new SimpleDateFormat("E, dd MMM yyyy");
			s = formatter.format(date);%>
			<p align="right">
	<font class=details><%=s%>	</font>					
<span class=details id=clock style="position:relative;"></span>


</body>
</html>