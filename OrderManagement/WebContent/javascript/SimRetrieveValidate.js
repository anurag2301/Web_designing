
var correct = 'y';
function resetValues() // To reset values
{
	document.getElementById("searchBy").selectedIndex='0';
	document.getElementById("selectSearchBy").innerHTML="";
	document.getElementById("txtEnterValue").value = "";
	document.getElementById("txtEnterValueP").innerHTML = "";

	document.getElementById("msg").style.color = "Black";
	document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";

}

function changeSelect() {
	if(document.getElementById("searchBy").selectedIndex=='0') {		
		document.getElementById("selectSearchBy").innerHTML = "Please select a value";
		document.getElementById("txtEnterValue").maxlength = 10;
	}
	
	else if(document.getElementById("searchBy").selectedIndex=='1') {		
		document.getElementById("selectSearchBy").innerHTML = "";
		document.getElementById("txtEnterValue").maxLength = 10;
	}
	
	else if(document.getElementById("searchBy").selectedIndex=='2') {		
		document.getElementById("selectSearchBy").innerHTML = "";
		document.getElementById("txtEnterValue").maxLength = 18;
	}
	
	else if(document.getElementById("searchBy").selectedIndex=='3') {		
		document.getElementById("selectSearchBy").innerHTML = "";
		document.getElementById("txtEnterValue").maxLength = 14;
	}
	
	else
	{
		document.getElementById("selectSearchBy").innerHTML = "";
		document.getElementById("txtEnterValueP").innerHTML = "";
	}
}

function checkValue() {
	
		
		if(document.getElementById("searchBy").selectedIndex=='0') {		
			document.getElementById("selectSearchBy").innerHTML = "Please select a value";
		}
		
		else if(document.getElementById("searchBy").selectedIndex=='1') {
			isNumber("txtEnterValue", document.getElementById("txtEnterValue").value, 10, "SIM ID")
			
		}
		
		else if(document.getElementById("searchBy").selectedIndex=='2') {
			
			isIccid("txtEnterValue", 18);
			
		}
		
		else if(document.getElementById("searchBy").selectedIndex=='3') {
			
			checkImsi("txtEnterValue", 14);
			
		}
		
		else
		{
			document.getElementById("selectSearchBy").innerHTML = "";
			document.getElementById("txtEnterValueP").innerHTML = "";
		}
	
}


function validate() {
	correct = 'y';
	if(document.getElementById("searchBy").selectedIndex=='0') {		
		document.getElementById("selectSearchBy").innerHTML = "Please select a value";
	}
	
	else if(document.getElementById("searchBy").selectedIndex=='1') {
		isNumber("txtEnterValue", document.getElementById("txtEnterValue").value, 10, "SIM ID")
		if(correct == 'y') {
			document.forms["simDeatailsForm"].submit();
		}
	}
	
	else if(document.getElementById("searchBy").selectedIndex=='2') {
		
		isIccid("txtEnterValue", 18);
		if(correct == 'y') {
			document.forms["simDeatailsForm"].submit();
		}
	}
	
	else if(document.getElementById("searchBy").selectedIndex=='3') {
		
		checkImsi("txtEnterValue", 14);
		if(correct == 'y') {
			document.forms["simDeatailsForm"].submit();
		}
	}
	
	else
	{
		document.getElementById("selectSearchBy").innerHTML = "";
		document.getElementById("txtEnterValueP").innerHTML = "";
	}
}


function checkImsi(id, len) {
	var x = document.getElementById(id).value; // Getting value in text box
	correct = 'y';
	if (x.length != (len-0)) {
		document.getElementById(id + 'P').innerHTML = "Lenght sould be of "
				+ len + " digits";
		correct = 'n';
	} else if (x.substr(0, 1) != 'D' && x.substr(0, 1) != 'S') {
		document.getElementById(id + 'P').innerHTML = "IMSI should start with 'd' or 's'";
		correct = 'n';

	} else if (x.substr(1, 1) != '4' && x.substr(1, 1) != '5') {
		document.getElementById(id + 'P').innerHTML = "second digit sould be '4' or '5'";
		correct = 'n';

	}
	
	if(correct == 'y')
	{
		checkDate(x.substr(2, 6), id);
	}
	
	if (((!(!isNaN(x.substr(8, 2) - 0)) || x.substr(8, 2) == 0) && correct == 'y')
			) {
		document.getElementById(id + 'P').innerHTML = "Enter proper service Provider id";
		correct = 'n';

	}

	else if (!(!isNaN(x.substr(10, 4) - 0)) 
			 && correct == 'y') {
		document.getElementById(id + 'P').innerHTML = "Enter proper quantity";
		correct = 'n';

	} 
	
	else if((x.substr(10, 4)-0) < 0 && correct == 'y') {
		document.getElementById(id + 'P').innerHTML = "Enter proper quantity";
		correct = 'n';
	}
	
	/*else if (x.substr(13, 1) != '0' && x.substr(0, 1) == 'S'
			&& correct == 'y') {
		document.getElementById(id + 'P').innerHTML = "The last digit is incorrect for single IMSI type";
		correct = 'n';

	} else if ((x.substr(13, 1) != '1' && x.substr(13, 1) != '2')
			&& correct == 'y') {
		if (x.substr(0, 1) == 'D') {
			document.getElementById(id + 'P').innerHTML = "The last digit is incorrect for Dual IMSI type";
			correct = 'n';
		}

	}*/

}

function checkDate(str, id) {

	var yy = str.substr(0, 2);
	yy = "20" + yy;
	var mm = str.substr(2, 2);
	var dd = str.substr(4, 2);

	var presentDate = new Date(); // Getting system date

	if ((!(!isNaN(dd - 0)) || (dd - 0) <= 0)
			|| (!(!isNaN(mm - 0)) || (mm - 0) <= 0) || (mm - 0) > 12
			|| (!(!isNaN(yy - 0)) || (yy - 0) <= 0)) {
		document.getElementById(id + "P").innerHTML = "Incorrect date";
		correct = 'n';
		
	} else {
		document.getElementById(id + "P").innerHTML = "";
	}

	if (((mm - 0) % 2 != 0 && (mm - 0) <= 7) || ((mm - 0) % 2 == 0)
			&& (mm - 0) > 7) {
		if (dd - 0 > 31) {
			document.getElementById(id + "P").innerHTML = "Incorrect date";
			correct = 'n';
			
		}
	} else if (mm != '02') {
		if (dd - 0 > 30) {
			document.getElementById(id + "P").innerHTML = "Incorrect date";
			correct = 'n';
			
		}
	} else if (mm = '02') {
		if ((((yy - 0) % 4 == 0 && (yy - 0) % 100 != 0) || (yy - 0) % 400 == 0)
				&& (dd - 0) > 29) // Leap year
		{
			document.getElementById(id + "P").innerHTML = "Incorrect date";
			correct = 'n';
			
		} else if ((yy - 0) % 4 != 0 && (dd - 0) > 28) {
			document.getElementById(id + "P").innerHTML = "Incorrect date";
			correct = 'n';
			
		}
	}
}

function isIccid(id,len) {
	var x = document.getElementById(id).value;
	correct = 'y';
	
	if(x.length != len) {
		document.getElementById(id + 'P').innerHTML = "Should be of "+ len +" digits";
		correct = 'n';
	}
	
	if (correct == 'y') {
		if (x.substr(0, 5) != "89358") {
			document.getElementById(id + 'P').innerHTML = "Should start with 89358";
			correct = 'n';
		}

		else if (x.substr(13, 1) != "4" && x.substr(13, 1) != "5") {
			document.getElementById(id + 'P').innerHTML = "14th digit should be 4/5";
			correct = 'n';
		}
	}
	
	if (correct == 'y') {
		isNumber(id, x.substr(14, 4), 4, "Last 4 digits");
	}
	
	if (correct == 'y') {
		isNumber(id, x.substr(5, 2), 2, "6th and 7th digit");
	}
	
	if(correct == 'y') {
		checkDate(x.substr(7,6), id);
	}

}

function isNumber(id, value, len, str) // (Function to check value entered is
		 								// number or
// not) and (length ig equal to len or not)
{
	var x = value; // Getting value in text box

	if (x == '') {
		document.getElementById(id + 'P').innerHTML = str + " should be numeric value";
		correct = 'n';
		correctQuantity = 'n';
	}

	else if (!(!isNaN(x - 0))) {
		document.getElementById(id + 'P').innerHTML = str + " should be numeric value";
		correct = 'n';
		correctQuantity = 'n';
	}

	else if ((x - 0) < 0) {
		document.getElementById(id + 'P').innerHTML = str + " should be positive value";
		correct = 'n';
		correctQuantity = 'n';
	}

	else if ((x.length != len)) {
		document.getElementById(id + 'P').innerHTML = str + " should be of " + len
				+ " digits!";
		correct = 'n';
		correctQuantity = 'n';
	}

	else // When the value in text box is correct
	{
		document.getElementById(id + 'P').innerHTML = "";
	}
}