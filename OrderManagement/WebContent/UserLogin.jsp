
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Page-Enter"
	content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit"
	content="RevealTrans(Duration=1.0,Transition=12)" />

<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />
<script type="text/javascript" src="javascript/LoginValidate.js"></script>
<title>User Login</title>

</head>

<body>
<!-- wrap starts here -->
<div id="wrap"><!-- header -->
<div id="header"><span id="slogan"> Communicate and
Socialize...</span> <!-- tabs --> <%@ include file="TopHomeMenu.jsp"%>

</div>

<div id="header-logo">

<div id="logo">Global <span class="red">SIM</span> Inventory</div>


</div>


<div id="sidebar">

<%@ include file="WiseWords.jsp"%> <%@ include
	file="SupportGSI.jsp"%></div>


<div id="main"><a name="TemplateInfo"></a>
<h1 align="center">Login</h1>
<form id="loginForm" action="LoginController" method="post">
<center>

<table width=100%>
	<tr>
		<td rowspan=4><img src="images/userLogin.jpg" align="left"></img></td>

		<td width=40%>Login Id <font color=#FF0000>&nbsp *</font></td>
		<td width=10%>:&nbsp<input name="txtLoginId" id="txtLoginId"
			type="text" maxlength='5' onfocusout="isNumber(this.id,5)"></td>
		<td width=45%>
		<p name="txtLoginIdP" id="txtLoginIdP" style="color: #FF0000"></p>
		</td>
	</tr>
	<tr>
		<td width=40%>Password <font color=#FF0000>&nbsp *</font></td>
		<td width=10%>:&nbsp<input name="passPassword" id="passPassword"
			type="password" maxlength='15' onfocusout="lengthMinMax(this.id, 5)"></td>
		<td>
		<p name="passPasswordP" id="passPasswordP" style="color: #FF0000"></p>
		</td>
	</tr>



	<tr>
		<td colspan="3">
		<p id="msg" name="msg" class="pmsg">Fields marked as <font
			color=#FF0000>*</font> are mandatory</p>
		</td>
	</tr>
</table>
<br />

<table>
	<tr>
		<td><input type="button" class="button" value="Login"
			onclick=loginValidate();></td>
		<td>&nbsp &nbsp &nbsp
		<td />
		<td><input type="button" class="button" value="Reset"
			onclick=resetValues();></td>
	</tr>
</table>
<p style="color: red">${errorMessage}</p>
<center>
</form>


</div>

<!-- footer starts here -->
<div class="footer"><%@ include file="FooterMenu.jsp"%>

</div>
</div>
</body>
</html>