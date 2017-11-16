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
			<h1 align="center">feedback</h1>
<form name="feedbackForm" method="post">

Your name: <br>
<input type="text" name="realname"><br>
<br>

Your email: <br>
<input type="text" name="email"><br>
<br>

Your comments: <br>
<textarea name="comments" rows="15" cols="50"></textarea><br><br>

<input type="submit" class="button" value="Submit" onclick=onSubmit();>
<script type="text/javascript">

</script>
 
</form>
</div>
		
<!-- footer starts here -->
<div class="footer">
	
		<%@ include file="FooterMenu.jsp"%>
		
</div>	
	
</body>
</html>
