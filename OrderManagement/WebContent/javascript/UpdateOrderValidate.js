function resetValues() // To reset values
{
	document.getElementById("txtOrderId").value = "";
	document.getElementById("txtOrderIdP").innerHTML = "";
	
	document.getElementById("selectOrderStatus").selectedIndex='0';
	document.getElementById("selectOrderStatusP").innerHTML = "";
	
	document.getElementById("msg").style.color = "Black";
	document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";
}

var correct;

function updateOrderValidate() {

	document.getElementById("msg").style.color = "Black";
	document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";

	correct = 'y'; // Initially considering values to be correct

	isNumber("txtOrderId", 5);
	
	checkSelectBox("selectOrderStatus");

	if (correct == 'y') // If every detail is correct
	{
		document.getElementById("msg").style.color = "Green";
		document.getElementById("msg").innerHTML = "Order Details Success";
		
		document.forms["updateOrderForm"].submit();

	}
}

function isNumber(id, len) // (Function to check value entered is number or
// not) and (length ig equal to len or not)
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

function checkSelectBox(id) {
	
	var x=document.getElementById(id).selectedIndex;
	var d = document.getElementsByTagName("option")[x].value;
	if (d == "Nothing") {
		document.getElementById(id + 'P').innerHTML = "Please select value";
		correct = 'n';
	}
	
	else {
		document.getElementById(id + 'P').innerHTML = "";
	}
}
