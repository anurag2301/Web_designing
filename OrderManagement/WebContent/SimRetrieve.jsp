<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Page-Enter"
	content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit"
	content="RevealTrans(Duration=1.0,Transition=12)" />

<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />
<script type="text/javascript" src="javascript/SimRetrieveValidate.js"></script>
<title>SIM Details</title>

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
<a name="TemplateInfo"></a>
<h1 align="center">SIM Details</h1>

<form id="simDeatailsForm" action="SimController" method="post">

<input type = "hidden" name ="checkPage" value="simRetrieval" />
<center>
<table width=100%>
	<tr>
		<td width=25%>Search By<font color=#FF0000>&nbsp *</font></td>
		<td width=25%><select name="searchBy" id="searchBy"
			onfocusout="changeSelect()">
			<option value="Select">&nbsp&nbsp&nbsp&nbsp&nbsp---Select---&nbsp&nbsp&nbsp&nbsp&nbsp</option>
			<option value="SimId">SIM ID</option>
			<option value="ICCID">ICCID</option>
			<option value="IMSINo">IMSI NO</option>
		</select></td>
		<td width=50%>
		<br/>
		<p name="selectSearchBy" id="selectSearchBy" style="color: #FF0000">&nbsp</p>
		</td>
	<tr>
		<td width=25%>Enter Value<font color=#FF0000>&nbsp *</td>
		<td><input width="40%" name="txtEnterValue" id="txtEnterValue"
			maxlength="18" onfocusout="checkValue()" /></td>
		<td>
		<p name="txtEnterValueP" id="txtEnterValueP" style="color: #FF0000">&nbsp</p>
		</td>
	</tr>
	

	<tr>
		<td colspan="3" align="center">
		<p id="msg" name="msg" class="pmsg">Fields marked as <font
			color=#FF0000>*</font> are mandatory</p>
		</td>
	</tr>
</table>

<br />
<table>
	<tr>
		<td><input type="button" class="button" value="Submit"
			onclick="validate()" /></td>
		<td>&nbsp &nbsp &nbsp</td>
		<td><input type="button" class="button" value="Reset"
			onclick="resetValues()" /></td>
	</tr>
</table>
</center>
</form>

</div>

<!-- footer starts here -->
<div class="footer"><%@ include file="FooterMenu.jsp"%>

</div>
</div>
</body>
</html>