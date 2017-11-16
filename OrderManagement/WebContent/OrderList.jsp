<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.bean.user.User"%>
<%@page import="com.controller.OrderListContoller"%>
<%@page import="com.bean.order.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.order.GetOrderList"%>

<%@page import="com.model.user.UserList"%><html
	xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<meta http-equiv="Page-Enter"
	content="RevealTrans(Duration=1.0,Transition=12)" />

<meta http-equiv="Page-Exit"
	content="RevealTrans(Duration=1.0,Transition=12)" />

<link rel="stylesheet" href="layoutImages/newLayout.css" type="text/css" />

<title>GSI-Order List</title>
<script type="text/javascript" src="javascript/OrderListCreate.js"></script>
<script type="text/javascript" src="javascript/OrderIdValidate.js"></script>
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
<form name="orderListForm" action="OrderDetailsController" method="post">
<input type="hidden" name="checkPage" value="orderList"> <input
	type="hidden" name="hiddenOrderId" id="hiddenOrderId" />
</form>
<div id="sidebar">
<%
	if ((Integer) session.getAttribute("loginAs") == 0) {
%> <%@ include
	file="LinksSp.jsp"%> <%
 	} else if ((Integer) session.getAttribute("loginAs") == 1) {
 %>
<%@ include file="LinksManufacturer.jsp"%> <%
 	}
 %>

<%@ include file="WiseWords.jsp"%> <%@ include
	file="SupportGSI.jsp"%></div>
<%
	OrderListContoller olc = new OrderListContoller();
	ArrayList<Order> orderList = new ArrayList<Order>();
	int id;
	if (((Integer) session.getAttribute("loginAs")) == 0) {

		id = ((User) session.getAttribute("user")).getsId();
		orderList = olc.getList(id, 0);
	}

	else {

		id = ((User) session.getAttribute("user")).getmId();
		orderList = olc.getList(id, 1);
	}

	User u = new User();
	int size = orderList.size();
%> <input type="hidden" value=<%=size%> name="sizeOfTable"
	id="sizeOfTable"></input>
<div id="main"><a name="TemplateInfo"></a>
<h1 align="center">Order List</h1>
<form>
<br />
<%
			
		
		UserList ul = new UserList();
		for (Order o : orderList) {

			if (((Integer) session.getAttribute("loginAs")) == 0) {
	%>
	<script>
						pushOrderId(<%=o.getOrderId()%>);
						pushOrderDate(<%="\""+o.getDate().substring(0, 10)+"\""%>);
						pushSubsType(<%="\""+o.getSubscriptionType()+"\""%>);
						pushImsiType(<%="\""+o.getImsiType()+"\""%>);
						pushCompanyName(<%="\""+ul.companyName(o.getmId(), 1)+"\""%>);
						pushQuantity(<%="\""+o.getQuantity()+"\""%>);
						
					</script>
	<%
		}

			else {
	%>

	<!--<tr>
		<td><a href="#" onclick="orderClick(<%=o.getOrderId()%>)"><%=o.getOrderId()%></a></td>
		<td><%=ul.companyName(o.getsId(), 0)%></td>
		<td><%=o.getDate().substring(0, 10)%></td>
		<td><%=o.getQuantity()%></td>
		<td><%=o.getImsiType()%></td>
		<td><%=o.getSubscriptionType()%></td>
	</tr>

	--><script>
	pushOrderId(<%=o.getOrderId()%>);
	pushOrderDate(<%="\""+o.getDate().substring(0, 10)+"\""%>);
	pushSubsType(<%="\""+o.getSubscriptionType()+"\""%>);
	pushImsiType(<%="\""+o.getImsiType()+"\""%>);
	pushCompanyName(<%="\""+ul.companyName(o.getsId(), 0)+"\""%>);
	pushQuantity(<%="\""+o.getQuantity()+"\""%>);
					</script>
	<%
		}
		}
	%><!--


</table>


	--><script>createTable();</script>
		
		<!--		
		//<script>
	//createTable();
//</script>
-->
<br />
</form>
</div>

<!-- footer starts here -->
<div class="footer"><%@ include file="FooterMenu.jsp"%>

</div>
</div>
</body>
</html>