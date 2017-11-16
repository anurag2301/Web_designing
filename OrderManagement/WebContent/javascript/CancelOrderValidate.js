function cancelOrderValidate() {

	document.getElementById("msg").style.color = "Black";
	document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";

	correct = 'y'; // Initially considering values to be correct

	isNumber("txtOrderId", 5);
	
	
	if(correct == 'y' && document.getElementById("checkPage").value=='cancelOrder') 
	{
		//document.getElementById("msg").style.color = "Green";
		//document.getElementById("msg").innerHTML = "Order Cancel Success";
		document.forms["cancelOrderForm"].submit();
	}
	else if(correct == 'y'&& document.getElementById("checkPage").value=='OrderDetails')
	{
		document.forms["orderForm"].submit();
	}
	
}
function isNumber(id, len) // (Function to check value entered is number or
//not) and (length ig equal to len or not)
{
	var x = document.getElementById(id).value; // Getting value in text box

	if (x == '') {
		document.getElementById(id + 'P').innerHTML = "Enter numeric value";
		correct = 'n';
	}

	else if (!(!isNaN(x - 0))) {
		document.getElementById(id + 'P').innerHTML = "Enter numeric value";
		correct = 'n';
	}

	else if ((x - 0) < 0) {
		document.getElementById(id + 'P').innerHTML = "Enter positive value";
		correct = 'n';
	}

	else if ((x.length != len)) {
		document.getElementById(id + 'P').innerHTML = "Must be of " + len
				+ " digits!";
		correct = 'n';
	}

	else // When the value in text box is correct
	{
		document.getElementById(id + 'P').innerHTML = "";
	}
}