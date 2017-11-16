<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Page-Enter" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit" 
content="RevealTrans(Duration=1.0,Transition=12)" />

<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />			

<title>Login as</title>	

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
			
			<%@ include file="UserMenu.jsp"%>
		
			<%@ include file="WiseWords.jsp"%>
			
			<%@ include file="SupportGSI.jsp"%>
		
				
		</div>		
		
							
		<div id="main">				
			<form>
			
			
			
			<a name="TemplateInfo"></a>
			<h1 align="center">Login As</h1>
			<table>
			<tr width=100%>
			<td width=30% style="text-align: center;">
			<a href="SpHome.jsp"><img src="images/serviceProvider.jpg"></img></a>
			</td>
			<td width=25% style="text-align: right;">
			<a href="MaHome.jsp"><img src="images/manufacturer.jpg"></img></a>
			</td>
			<tr>
			<td width=30% style="text-align: center;">Service Provider</td>
			<td width=25% style="text-align: right;">Manufacturer</td>
			</tr>
			</tr>
		</table>
		</form>
			
</div>
		
<!-- footer starts here -->
<div class="footer">
	
		<%@ include file="FooterMenu.jsp"%>
		
</div>	
	</div>
</body>
</html>