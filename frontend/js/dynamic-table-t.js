function addRowWeightHeight() {
         
    var height = document.getElementById("inputHeight");
    var weight = document.getElementById("inputWeight");
	var date = document.getElementById("weightheight-date-input");
    var table = document.getElementById("WeightHeightTable");

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    row.insertCell(0).innerHTML= String(weight.value) + ' <br> <input type="hidden" name="inputWeight' + String(rowCount) + '" value="' + String(weight.value) + '" />';
    row.insertCell(1).innerHTML= String(height.value) + ' <br> <input type="hidden" name="inputHeight' + String(rowCount) + '" value="' + String(height.value) + '" />';
	row.insertCell(2).innerHTML= String(date.value) + ' <br> <input type="hidden" name="inputWeightHeightDate' + String(rowCount) + '" value="' + String(date.value) + '" />';;
	row.insertCell(3).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRowWeightHeight(this)">';

}

function deleteRowWeightHeight(obj) {
     
    var index = obj.parentNode.parentNode.rowIndex;
    var table = document.getElementById("WeightHeightTable");
    table.deleteRow(index);
   
}

function addRowTeeth() {
         
    var teeth = document.getElementById("inputTeeth");
	var date = document.getElementById("teeth-date-input");
    var table = document.getElementById("TeethTable");

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    row.insertCell(0).innerHTML= String(teeth.value) + ' <br> <input type="hidden" name="inputTeeth' + String(rowCount) + '" value="' + String(teeth.value) + '" />';
	row.insertCell(1).innerHTML= String(date.value) + ' <br> <input type="hidden" name="inputTeethDate' + String(rowCount) + '" value="' + String(date.value) + '" />';;
	row.insertCell(2).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRowTeeth(this)">';

}

function deleteRowTeeth(obj) {
     
    var index = obj.parentNode.parentNode.rowIndex;
    var table = document.getElementById("TeethTable");
    table.deleteRow(index);
   
}

function addRowHead() {
         
    var head = document.getElementById("inputHead");
	var date = document.getElementById("head-date-input");
    var table = document.getElementById("HeadTable");

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    row.insertCell(0).innerHTML= String(head.value) + ' <br> <input type="hidden" name="inputHead' + String(rowCount) + '" value="' + String(head.value) + '" />';
	row.insertCell(1).innerHTML= String(date.value) + ' <br> <input type="hidden" name="inputHeadDate' + String(rowCount) + '" value="' + String(date.value) + '" />';;
	row.insertCell(2).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRowHead(this)">';

}

function deleteRowHead(obj) {
     
    var index = obj.parentNode.parentNode.rowIndex;
    var table = document.getElementById("HeadTable");
    table.deleteRow(index);
   
}

function load() {
   
    console.log("Page load finished");

}