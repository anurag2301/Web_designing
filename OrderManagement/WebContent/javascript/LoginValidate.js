function resetValues() // To reset values
{
	document.getElementById("txtLoginId").value = "";
	document.getElementById("passPassword").value = "";

	document.getElementById("txtLoginIdP").innerHTML = "";
	document.getElementById("passPasswordP").innerHTML = "";

	document.getElementById("msg").style.color = "Black";
	document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";
}

var correct;

function loginValidate() {

	document.getElementById("msg").style.color = "Black";
	document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";

	correct = 'y'; // Initially considering values to be correct

	isNumber("txtLoginId", 5);
	lengthMinMax("passPassword", 5);

	if (correct == 'y') // If every detail is correct
	{
		document.getElementById("msg").style.color = "Green";
		document.getElementById("msg").innerHTML = "Login Success";
		
		document.forms["loginForm"].submit();

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

function lengthMinMax(id, min) {

	var x = document.getElementById(id).value; // Getting value in text box
	
	if (x == '') {
		document.getElementById(id + 'P').innerHTML = "Enter value";
		correct = 'n';
	}
	
	else if ((x.length < min)) {
		document.getElementById(id + 'P').innerHTML = "Should be of atleast " + min
				+ " characters!";
		correct = 'n';
	}
	
	else // When the value in text box is correct
	{
		document.getElementById(id + 'P').innerHTML = "";
	}
}
