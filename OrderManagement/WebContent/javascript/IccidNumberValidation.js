var correct = 'y';

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


function checkDate(str,id)
{
	
	var yy = str.substr(0,2);
	yy = "20" + yy;
	var mm = str.substr(2,2);
	var dd = str.substr(4,2); 
	
	var presentDate = new Date();		//Getting system date
	
	
	if((!(! isNaN (dd-0)) || (dd-0)<=0) ||(!(! isNaN (mm-0)) || (mm-0)<=0) || (mm-0)>12 || (!(! isNaN (yy-0)) || (yy-0)<=0) )
	{
		document.getElementById(id+"P").innerHTML = "Incorrect date";
		correct = 'n';
		correctDate = 'n';
	}
	else
	{
		document.getElementById(id+"P").innerHTML = "";
	}
	
	if(((mm-0)%2!=0 && (mm-0)<=7)||((mm-0)%2==0) && (mm-0)>7)
	{
		if(dd-0 >31)
		{
			document.getElementById(id+"P").innerHTML = "Incorrect date";
			correct = 'n';
			correctDate = 'n';
		}
	}
	else if(mm!='02')
	{
		if(dd-0 >30)
		{
			document.getElementById(id+"P").innerHTML = "Incorrect date";
			correct = 'n';
			correctDate = 'n';
		}
	}
	else if(mm='02')
	{
		if((((yy-0)%4==0 && (yy-0)%100!=0) || (yy-0)%400==0) && (dd-0)>29)				//Leap year
		{
			document.getElementById(id+"P").innerHTML = "Incorrect date";
			correct = 'n';
			correctDate = 'n';
		}
		else if((yy-0)%4!=0 && (dd-0)>28)
		{
			document.getElementById(id+"P").innerHTML = "Incorrect date";
			correct = 'n';
			correctDate = 'n';
		}
	}
}
