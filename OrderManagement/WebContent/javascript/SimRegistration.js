function resetValues() // To reset values
{
	document.getElementById("txtOrderId").value = "";

	document.getElementById("txtOrderIdP").innerHTML = "";
	document.getElementById("txtQuantity").value = "";

	document.getElementById("txtQuantityP").innerHTML = "";
	document.getElementById("txtPIN1").value = "";

	document.getElementById("txtPIN1P").innerHTML = "";
	document.getElementById("txtPIN2").value = "";

	document.getElementById("txtPIN2P").innerHTML = "";
	document.getElementById("txtPUK1").value = "";

	document.getElementById("txtPUK1P").innerHTML = "";
	document.getElementById("txtPUK2").value = "";

	document.getElementById("txtPUK2P").innerHTML = "";
	


	document.getElementById("msg").style.color = "Black";
	document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";
}

var correct;

function simRegistrationValidate() {

	document.getElementById("msg").style.color = "Black";
	document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";

	correct = 'y'; // Initially considering values to be correct

	isNumber("txtOrderId", 5);
	isNumber("txtQuantity",4);
	isNumber("txtPIN1",4);
	isNumber("txtPIN2",4);
	
	isNumber("txtPUK1",8);
	
	isNumber("txtPUK2",8);
	
	

	if (correct == 'y') // If every detail is correct
	{
		document.getElementById("msg").style.color = "Green";
		document.getElementById("msg").innerHTML = "Sim Registration Success";
		
		document.forms["simRegistration"].submit();

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
