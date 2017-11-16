//ORDER ID,ORDER DATE,SERVICE PROVIDER NAME,IMSI RANGE,SUBSCRIPTION TYPE,IMSI TYPE,QUANTITY,MANUFACTURER NAME

var i = 0;
var size;					// no of records
var noRows = 10; 				// no of records to be displayed at a time
// Data
var orderId = [];
var orderDate = [];				// yyyy/mm/dd
var companyName = [];
var subsType = [];
var imsiType = [];
var quantity = [];
var manuName = [];


var ordBy = 0;
var ordAsDes = 0; 						// 0-none , 1-ascending, 2-descending
var ordArray = [];			// no of records
var actualOrdArray = [];
// can be sorted by MANUFACTURER NAME ,SERVICE PROVIDER and SUBSCRIPTION TYPE.

// Table


function pushOrderId(value) {
	orderId.push(value);
	 
}

function pushOrderDate(value) {

	orderDate.push(value);
	 
}

function pushCompanyName(value) {
	companyName.push(value);
	
}


function pushSubsType(value) {
	subsType.push(value);
	
}

function pushImsiType(value) {
	imsiType.push(value);
	
}

function pushQuantity (value) {
	var val = value + "";
	while(val.length<4) {
		val = "0" + val;
	}
	quantity.push(val);
	
}





function onLoadPage () {
	size= document.getElementById("sizeOfTable").value;
	
}


function createTable() {
	document.write('<table id="orderTable" border=1px>'); 

	document.write('<tr>');
		document.write('<th>' + 'Order Id' + '</th>');
		document.write('<th >' + '<a href="#" id="sProvider"  onclick="javascript:orderBy(1)">Company</br>Name</br> </br></a>' + '</th>');
		document.write('<th>' + 'Subscription<br/>Type' + '</th>');
		document.write('<th>' + 'IMSI</br>Type' + '</th>') ; 
		document.write('<th>' + '<a href="#" id="sType"  onclick="javascript:orderBy(2)">Quantity</a>' + '</th>' + '<th width="8%">' + '<a href="#" id="mName"  onclick="javascript:orderBy(3)">Order Date</a>' + '</th>');		
	document.write('</tr>');


	size= document.getElementById("sizeOfTable").value;

	for (;i<noRows && i<size;i++) 				// Display table rows
	{ 
		document.write('<tr>'); 

			document.write('<td ><a href="#" onclick="orderClick(' + orderId[i] + ')">' + orderId[i] + '</a></td>' +  '<td>' + companyName[i] + '</td>' );
			document.write('<td>' + subsType[i] + '</td>' + '<td>' + imsiType[i] + '</td>' + '<td>' + quantity[i] + '</td>' +'<td>' + orderDate[i] + '</td>' ) ; 
		
		document.write('</tr>'); 
	} 

	document.write('</table>');


	document.write('<table align="center" width="50%">');
	document.write('<tr>');
	document.write('<td width="50%" align="center">');
	document.write('<a href="#" id="prvPage"  onclick="javascript:prvnxtPage(0)"></a>');
	document.write('</td>');

	document.write('<td width="50%" align="center">');
	document.write('<a href="#" id="nxtPage" onclick="javascript:prvnxtPage(1)">Next</a>');
	document.write('</td>');
	document.write('</tr>');
	document.write('</table>');


	if((size-0) <= 10) {

		document.getElementById("nxtPage").innerHTML='';
	}

}


function prvnxtPage(x)			// x==0 Previous Page, x==1 Next Page
{
	var table=document.getElementById('orderTable').rows;
	
	if(x==0)			// 0 - previous page
	{
		if(i==size && size%10!=0)				// If on last page
		{
			i=i-noRows-size%10;					// Change required when noRows
												// changed
		}
		else
		{
			i=i-noRows*2;
		}
	}
	
	// Table rows with new data
	for (j=1 ;j<=noRows && j<=size; j++,i++) 
	{ 

		if(i<size)
		{
			table[j].cells[0].innerHTML='<a href="#" onclick="orderClick(' + orderId[i] + ')">' + orderId[i] + '</a>';
			table[j].cells[1].innerHTML=companyName[i];
			table[j].cells[2].innerHTML=subsType[i];
			table[j].cells[3].innerHTML=imsiType[i];
			table[j].cells[4].innerHTML=quantity[i];
			table[j].cells[5].innerHTML=orderDate[i];
			
		}
		else			// After last record is displayed and there are still
						// rows left in table
		{
			for(k=0; k<6; k++)
			{
				table[j].cells[k].innerHTML=' NA ';
			}
			
		}
	}
	
	
	// Disabling next/previous page
	if(i>=size)
	{
		document.getElementById("nxtPage").innerHTML='';
		i=size;
	}
	else if(!(size<=10))
	{
		document.getElementById("nxtPage").innerHTML='Next';
	}
	
	if(i<=noRows)
	{
		document.getElementById("prvPage").innerHTML='';
	}
	else
	{
		document.getElementById("prvPage").innerHTML='Previous';
	}	
	
}


function indexOfMyArray(a,b)		// A replacement to indexOf function
{
	for( x= b; x<size; x++ )
	{
		if(actualOrdArray[x]===a)
		{
			return x;
		}
	}
	return -1;
}


function orderBy(x)			// x==1 Service provider, x==2 Subscription type,
							// x==3 Manufacturer Name
{
	var presentI = i;
	
	
	if(ordAsDes==0)
	{
		ordAsDes = 1;			// 1-Ascending 2-Descending
	}
	else if(ordAsDes==1)
	{
		ordAsDes = 2;
	}
	else
	{
		ordAsDes = 1;
	}
	
	
	// Copying actual order to ordArray of the column that is required to be
	// sorted
	if(x==1)
	{
		for(i=0;i<size;i++)
		{
			ordArray[i] = companyName[i];
			
		}
		ordBy = 1;
		document.getElementById("sProvider").innerHTML='Comapny</br>Name</br>(As)';
		document.getElementById("sType").innerHTML='Quantity';
		document.getElementById("mName").innerHTML='Order Date';
		if(ordAsDes==2)
		{
			document.getElementById("sProvider").innerHTML='Company</br>Name</br>(Des)';
		}
	}
	
	else if(x==2)
	{
		for(i=0;i<size;i++)
		{
			ordArray[i] = quantity[i];
			
		}
		ordBy = 2;
		document.getElementById("sProvider").innerHTML='Company</br>Name</br> </br>';
		document.getElementById("mName").innerHTML='Order Date';
		document.getElementById("sType").innerHTML='Quantity(As)';
		if(ordAsDes==2)
		{
			document.getElementById("sType").innerHTML='Quantity(Des)';
		}
	}
	
	else
	{
		for(i=0;i<size;i++)
		{
			ordArray[i] = orderDate[i];
		}
		ordBy = 3;
		document.getElementById("sProvider").innerHTML='Service</br>Provider</br> </br>';
		document.getElementById("sType").innerHTML='Quantity';
		document.getElementById("mName").innerHTML='Order Date(As)';
		if(ordAsDes==2)
		{
			document.getElementById("mName").innerHTML='Order Date(Des)';
		}
	}
	
	for(i=0; i<size; i++)
	{
		actualOrdArray[i] = ordArray[i];
	}
	
	
	ordArray.sort();	// Sorting the copied array
	
	if(ordAsDes==2)		// For descending order
	{
		ordArray.reverse();
	}
	var k;
	
	// Sorting
	
	for(i=0; i<orderId.length; i++)
	{
		// This will be supported in higher version of browser
		/*
		 * if(x==1) { k = servProvider.indexOf(ordArray[i],i);
		 *  } else if(x==2) { k = subsType.indexOf(ordArray[i],i); } else { k =
		 * manufacturerName.indexOf(ordArray[i],i); }
		 */

		// Swapping rows to change order
		k = indexOfMyArray(ordArray[i],i);
		
		temp = actualOrdArray[k];
		actualOrdArray[k] = actualOrdArray[i];
		actualOrdArray[i] = temp;
		
		temp = orderId[k];
		orderId[k] = orderId[i];
		orderId[i] = temp;
		
		temp = orderDate[k];
		orderDate[k] = orderDate[i];
		orderDate[i] = temp;

		temp = companyName[k];
		companyName[k] = companyName[i];
		companyName[i] = temp;

		temp = subsType[k];
		subsType[k] = subsType[i];
		subsType[i] = temp;

		temp = imsiType[k];
		imsiType[k] = imsiType[i];
		imsiType[i] = temp;

		temp = quantity[k];
		quantity[k] = quantity[i];
		quantity[i] = temp;
	
	}
		
	// Going back to 1st page
	i=0;
	document.getElementById("prvPage").innerHTML='';
	prvnxtPage(1);
	
}