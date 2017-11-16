function resetValues() // To reset values
{
	document.getElementById("selectSearchBy").innerHTML = "";

	document.getElementById("enterValue").innerHTML = "";

	document.getElementById("msg").style.color = "Black";
	document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";
	document.forms["simDeatailsForm"].reset();
}

function detailsValidate()
{//alert("hi");
	if(!(searchByValidate()))
	{
		return false;
	}
	if(!(valueValidate()))
	{
		//alert("hi");
		return false;
	}
	return true;
}

function searchByValidate(){
	var select=document.getElementById("searchBy").value;
	if(select=="select")
	{
		//alert(select);
		document.getElementById("selectSearchBy").innerHTML = "Please select a type";
		return false;
	}
	return true;
}

//var correct;


function valueValidate() {
	//alert("hi");
	var option = document.getElementById("searchBy").value;
	if(option == "SimId"){
		if(!simIdValidate()){
			return false;
		}
	}
	else if(option == "ICCID" ){
		if(!IccIdValidate()){
			return false;
		}
	}
	else{
		
	}
	
	//document.getElementById("msg").style.color = "Black";
	//document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";

	//correct = 'y'; // Initially considering values to be correct

	//isNumber("txtEnterValue", 5);

	//if (correct == 'y') // If every detail is correct
	//{
		document.getElementById("msg").style.color = "Green";
		document.getElementById("msg").innerHTML = "Order Details Success";
		
		//document.forms["simDeatailsForm"].submit();
		return true;
}

function simIdValidate() // (Function to check value entered is number or
// not) and (length ig equal to len or not)
{
	var simId = document.getElementById("txtEnterValue").value; // Getting value in text box

	if (simId == '') {
		document.getElementById("enterValue").innerHTML = "Enter Sim ID";
		//correct = 'n';
		return false;
	}

	else if (!(!isNaN(simId - 0))) {
		document.getElementById("enterValue").innerHTML = "Enter numeric value";
		//correct = 'n';
		return false;
	}

	else if ((simId - 0) < 0) {
		document.getElementById("enterValue").innerHTML = "Enter positive value";
		//correct = 'n';
		return false;
	}

	else if ((simId.length != 10)) {
		document.getElementById("enterValue").innerHTML = "Must be of 10 digits!";
		//correct = 'n';
		return false;
	}

	/*else // When the value in text box is correct
	{
		document.getElementById("enterValue").innerHTML = "";
	}*/
	return true;
}


function IccIdValidate(){
	var IccId = document.getElementById("txtEnterValue").value;
	var pattern = "^[0-9]{19}$";
	var regex = new RegExp(pattern);
	
	if(IccId == ""){
		document.getElementById("enterValue").innerHTML = "Please enter ICCID value";
		return false;
	}
	if(!regex.test(IccId)){
		document.getElementById("enterValue").innerHTML = "Please enter positive 19 digit value";
		return false;
	}
	return true;
}
