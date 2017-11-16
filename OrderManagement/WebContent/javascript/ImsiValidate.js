var correct = 'y';

function isImsi(id, len) {

	document.getElementById("msg").style.color = "Black";
	document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";

	
	
	checkImsi(id, len);

	if (correct == 'y'&& document.getElementById("checkPage").value=='imsiDetails') {
		document.getElementById("msg").style.color = "Green";
		document.getElementById("msg").innerHTML = "IMSI submit Success";
		document.forms["imsiForm"].submit();
	}
	else (correct == 'y'&& document.getElementById("checkPage").value=='imsiDetailsView') {
		document.getElementById("msg").style.color = "Green";
		document.getElementById("msg").innerHTML = "IMSI submit Success";
		document.forms["imsiViewForm"].submit();
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
		document.getElementById(id + 'P').innerHTML = "IMSI should start with 'D' or 'S'";
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
	
	else if (x.substr(14, 1) != '0' && x.substr(0, 1) == 'S'
			&& correct == 'y') {
		document.getElementById(id + 'P').innerHTML = "The last digit is incorrect for single IMSI type";
		correct = 'n';

	} else if ((x.substr(14, 1) != '1' && x.substr(14, 1) != '2')
			&& correct == 'y') {
		if (x.substr(0, 1) == 'D') {
			document.getElementById(id + 'P').innerHTML = "The last digit is incorrect for Dual IMSI type";
			correct = 'n';
		}

	}

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

function resetValues() // To reset values
{
	document.getElementById("txtImsi").value = "";

	document.getElementById("txtImsiP").innerHTML = "";

	document.getElementById("msg").style.color = "Black";
	document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";
}
