function resetValues() // To reset values
{
	document.getElementById("hiddenMaximumQuantity").value = 9999;
	var spId = document.getElementById("hiddenServiceProviderId").value;
	var maxQuantity = document.getElementById("hiddenMaximumQuantity").value;
	
	startQuantity = 9999 - (maxQuantity - 0);
	var newStartQuantity = startQuantity +"";
	var newEndQuantity;
	if ( newStartQuantity.length == 1) {
		newStartQuantity = "000" + newStartQuantity;
	}
	
	else if ( newStartQuantity.length == 2) {
		newStartQuantity = "00" + newStartQuantity;
	}
	
	else if ( newStartQuantity.length == 3) {
		newStartQuantity = "0" + newStartQuantity;
	}
	
	else {
		newStartQuantity = newStartQuantity;
	}
	
	startQuantity = (startQuantity-0) + 1;
	newEndQuantity = startQuantity+"";
	if ( newEndQuantity.length == 1) {
		newEndQuantity = "000" + newEndQuantity;
	}
	
	else if ( newEndQuantity.length == 2) {
		newEndQuantity = "00" + newEndQuantity;
	}
	
	else if ( newEndQuantity.length == 3) {
		newEndQuantity = "0" + newEndQuantity;
	}
	
	else {
		newEndQuantity = newEndQuantity;
	}
	
	document.getElementById("selectManufacturerId").selectedIndex='0';
	document.getElementById("selectImsiType").selectedIndex='0';
	document.getElementById("selectSubscriptionType").selectedIndex='0';
	document.getElementById("txtQuantity").value = "0000";
	
	
	var d = new Date();
	var month = d.getMonth()+1;
	var date = d.getDate();
	var year = d.getFullYear();
	
	if(month.toString().length == 1) {
		month = "0" + month;
	}
	
	if(date.toString().length == 1) {
		date = "0" + date;
	}
	
	document.getElementById("txtDate").value = date + "-" + month + "-" + year;
	
	document.getElementById("txtIccidNumber").value = "89358"+spId+year.toString().substring(2,4)+month+date+"4"+newStartQuantity+"-"+newEndQuantity;
	document.getElementById("txtImsiNumber").value = "S4"+year.toString().substring(2,4)+month+date+spId+newStartQuantity+"0"+"-"+newEndQuantity+"0";
	
	document.getElementById("selectManufacturerIdP").innerHTML="";
	document.getElementById("selectImsiTypeP").innerHTML="";
	document.getElementById("selectSubscriptionTypeP").innerHTML="";
	document.getElementById("txtQuantityP").innerHTML="";
	document.getElementById("txtDateP").innerHTML="";
	
	document.getElementById("msg").style.color = "Black";
	document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";
}

var correct;

function registerOrderValidate() {

	document.getElementById("msg").style.color = "Black";
	document.getElementById("msg").innerHTML = "Fields marked as <font color=#FF0000>*</font> are mandatory";

	correct = 'y'; // Initially considering values to be correct
	checkSelectBox("selectManufacturerId");
	checkSelectBox("selectImsiType");
	checkSelectBox("selectSubscriptionType");	
	checkDate("txtDate");
	isNumber("txtQuantity", 4);
	checkImsiType();
	if (correct == 'y') // If every detail is correct
	{
		document.getElementById("msg").style.color = "Green";
		document.getElementById("msg").innerHTML = "Order Details Success";
		document.getElementById("hiddenIccidRange").value = document.getElementById("txtIccidNumber").value;
		
		document.getElementById("hiddenImsiRange").value = document.getElementById("txtImsiNumber").value;
		document.forms["registerOrderForm"].submit();

	}
}


function isNumber(id, len) // (Function to check value entered is number or
// not) and (length ig equal to len or not)
{
	var correctQuantity = 'y'; 
	var x = document.getElementById(id).value; // Getting value in text box

	if (x == '') {
		document.getElementById(id + 'P').innerHTML = "Enter numeric value";
		correct = 'n';
		correctQuantity = 'n';
	}

	else if (!(!isNaN(x - 0))) {
		document.getElementById(id + 'P').innerHTML = "Enter numeric value";
		correct = 'n';
		correctQuantity = 'n';
	}

	else if ((x - 0) < 0) {
		document.getElementById(id + 'P').innerHTML = "Enter positive value";
		correct = 'n';
		correctQuantity = 'n';
	}

	else if ((x.length != len)) {
		document.getElementById(id + 'P').innerHTML = "Must be of " + len
				+ " digits!";
		correct = 'n';
		correctQuantity = 'n';
	}
	
	else // When the value in text box is correct
	{
		document.getElementById(id + 'P').innerHTML = "";
	}
	var maxQuantity = document.getElementById("hiddenMaximumQuantity").value;
	
	if(id == "txtQuantity" && (x-0)>(maxQuantity) - 0) {
		document.getElementById(id + 'P').innerHTML = "Must be less than " + maxQuantity;
		correct = 'n';
		correctQuantity = 'n';
	}
	
	else if(correctQuantity == 'y' && id == "txtQuantity") {
		var startQuantity = document.getElementById("txtIccidNumber").value.substr(14,4);
		
		var newEndQuantity;
		
		startQuantity = (startQuantity-0) + (x-1);
		
		if(x-0 == 0) {
			startQuantity +=1;
		}
		
		newEndQuantity = startQuantity+"";
		if ( newEndQuantity.length == 1) {
			newEndQuantity = "000" + newEndQuantity;
		}
		
		else if ( newEndQuantity.length == 2) {
			newEndQuantity = "00" + newEndQuantity;
		}
		
		else if ( newEndQuantity.length == 3) {
			newEndQuantity = "0" + newEndQuantity;
		}
		
		else {
			newEndQuantity = startQuantity;
		}
			
		var startIccid = document.getElementById("txtIccidNumber").value;
		startIccid = startIccid.substr(0,19) + newEndQuantity;
		document.getElementById("txtIccidNumber").value = startIccid;
		
		var startImsi = document.getElementById("txtImsiNumber").value;
		startImsi = startImsi.substr(0,16) + newEndQuantity + startImsi.substr(20,1);
		
		document.getElementById("txtImsiNumber").value = startImsi;
		checkImsiType();
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



function checkManuSelectBox(id) {	
	var x=document.getElementById(id).selectedIndex;
	var d = document.getElementsByTagName("option")[x].value;
	
	document.getElementById("hiddenMaximumQuantity").value = document.getElementById("hiddenMaximumQuantity"+x).value;
	if (d == "Nothing") {
		document.getElementById(id + 'P').innerHTML = "Please select value";
		correct = 'n';
	}
	
	else {
		document.getElementById(id + 'P').innerHTML = "";
	}
	

	var maxQuantity = document.getElementById("hiddenMaximumQuantity").value;
	
	var startQuantity = 10000 - (maxQuantity - 0);
	var newStartQuantity = startQuantity +"";
	var newEndQuantity;
	if ( newStartQuantity.length == 1) {
		newStartQuantity = "000" + newStartQuantity;
	}
	
	else if ( newStartQuantity.length == 2) {
		newStartQuantity = "00" + newStartQuantity;
	}
	
	else if ( newStartQuantity.length == 3) {
		newStartQuantity = "0" + newStartQuantity;
	}
	
	else {
		newStartQuantity = newStartQuantity;
	}
	
	
	startQuantity = (startQuantity-0) + 1;
	newEndQuantity = startQuantity+"";
	if ( newEndQuantity.length == 1) {
		newEndQuantity = "000" + newEndQuantity;
	}
	
	else if ( newEndQuantity.length == 2) {
		newEndQuantity = "00" + newEndQuantity;
	}
	
	else if ( newEndQuantity.length == 3) {
		newEndQuantity = "0" + newEndQuantity;
	}
	
	else {
		newEndQuantity = newEndQuantity;
	}
	
	var x = document.getElementById("txtIccidNumber").value;
	var y = "abc";
	y = document.getElementById("txtImsiNumber").value;
	
	
	document.getElementById("txtIccidNumber").value = x.substring(0,14)+newStartQuantity+"-"+newEndQuantity;
	document.getElementById("txtImsiNumber").value = y.substring(0,10)+newStartQuantity +"a-"+newEndQuantity+y.substring(20,1);
	
	
	document.getElementById("txtImsiNumber").value = document.getElementById("txtImsiNumber").value.substring(0,20);
	
	checkImsiType();
	
	document.getElementById("txtQuantity").value = "0000";
}

function checkSubscriptionType () {
	select = document.getElementById("selectSubscriptionType").selectedIndex;
	if(select == '1') {
		var startIccid = document.getElementById("txtIccidNumber").value;
		startIccid = startIccid.substr(0,13) + "5" + startIccid.substr(14,10);
		document.getElementById("txtIccidNumber").value = startIccid;
		
		var startImsi = document.getElementById("txtImsiNumber").value;
		startImsi = startImsi.substr(0,1) + "5" +startImsi.substr(2,19);
		document.getElementById("txtImsiNumber").value = startImsi;
		
		checkSelectBox("selectSubscriptionType");
	}	
	else if(select == '2') {
		var startIccid = document.getElementById("txtIccidNumber").value;
		startIccid = startIccid.substr(0,13) + "4" + startIccid.substr(14,10);
		document.getElementById("txtIccidNumber").value = startIccid;
		
		var startImsi = document.getElementById("txtImsiNumber").value;
		startImsi = startImsi.substr(0,1) + "4" +startImsi.substr(2,19);
		document.getElementById("txtImsiNumber").value = startImsi;
		
		checkSelectBox("selectSubscriptionType");
	}
}


function orderClick(id) {
	document.getElementById("hiddenOrderId").value = id;
	document.forms["orderListForm"].submit();
}

function checkImsiType () {
	select = document.getElementById("selectImsiType").selectedIndex;
	if(select == '1') {
	
		var startImsi = document.getElementById("txtImsiNumber").value;
		startImsi = "S" + startImsi.substr(1,13) + "0" + startImsi.substr(15,5) + "0";
		document.getElementById("txtImsiNumber").value = startImsi;
		
		checkSelectBox("selectImsiType");
	}	
	else if(select == '2') {

		
		var startImsi = document.getElementById("txtImsiNumber").value;
		startImsi = "D" + startImsi.substr(1,13) + "1" + startImsi.substr(15,5) + "2";;
		document.getElementById("txtImsiNumber").value = startImsi;
		
		checkSelectBox("selectImsiType");
	}
	else {
		var startImsi = document.getElementById("txtImsiNumber").value;
		startImsi = "S" + startImsi.substr(1,13) + "0" + startImsi.substr(15,5) + "0";
		document.getElementById("txtImsiNumber").value = startImsi;
		
		checkSelectBox("selectImsiType");
	}
}

function checkDate()
{
	var correctDate = 'y';
	//format is dd-mm-yyyy
	var str = document.getElementById("txtDate").value;
	
	var dd = str.substr(0,2);
	var mm = str.substr(3,2);
	var yy = str.substr(6,4); 
	
	var presentDate = new Date();		//Getting system date
	
	if(str.substr(2,1)!='-' || str.substr(5,1)!='-')
	{
		document.getElementById("txtDateP").innerHTML = "Incorrect format";
		correct = 'n';
		correctDate = 'n';
	}
	
	else if((!(! isNaN (dd-0)) || (dd-0)<=0) ||(!(! isNaN (mm-0)) || (mm-0)<=0) || (mm-0)>12 || (!(! isNaN (yy-0)) || (yy-0)<=0) )
	{
		document.getElementById("txtDateP").innerHTML = "Incorrect date";
		correct = 'n';
		correctDate = 'n';
	}
	
	else if(((mm-0) < (presentDate.getMonth()+1) && (yy-0) == presentDate.getFullYear()) || ((dd-0)<(presentDate.getDate()) && (mm-0) == (presentDate.getMonth()) && (yy-0) == presentDate.getFullYear()) || (yy-0) < presentDate.getFullYear()) 
	{
		document.getElementById("txtDateP").innerHTML = "Date already passed";
		correct = 'n';
		correctDate = 'n';
	}
	else
	{
		document.getElementById("txtDateP").innerHTML = "";
	}
	
	if(((mm-0)%2!=0 && (mm-0)<=7)||((mm-0)%2==0) && (mm-0)>7)
	{
		if(dd-0 >31)
		{
			document.getElementById("txtDateP").innerHTML = "Incorrect date";
			correct = 'n';
			correctDate = 'n';
		}
	}
	else if(mm!='02')
	{
		if(dd-0 >30)
		{
			document.getElementById("txtDateP").innerHTML = "Incorrect date";
			correct = 'n';
			correctDate = 'n';
		}
	}
	else if(mm='02')
	{
		if((((yy-0)%4==0 && (yy-0)%100!=0) || (yy-0)%400==0) && (dd-0)>29)				//Leap year
		{
			document.getElementById("txtDateP").innerHTML = "Incorrect date";
			correct = 'n';
			correctDate = 'n';
		}
		else if((yy-0)%4!=0 && (dd-0)>28)
		{
			document.getElementById("txtDateP").innerHTML = "Incorrect date";
			correct = 'n';
			correctDate = 'n';
		}
	}
	
	if(correctDate == 'y') {
		var startIccid = document.getElementById("txtIccidNumber").value;
		var startImsi = document.getElementById("txtImsiNumber").value;
		
		startIccid = startIccid.substr(0,7)+yy.substr(2,2)+mm+dd+startIccid.substr(13,10);
		
		document.getElementById("txtIccidNumber").value = startIccid;
		
		
		startImsi = startImsi.substr(0,2) + yy.substr(2,2)+mm+dd + startImsi.substr(8,13);
		
		document.getElementById("txtImsiNumber").value = startImsi;
	}
}
