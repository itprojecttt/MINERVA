function addRow() {
         
    var height = document.getElementById("inputHeight");
    var weight = document.getElementById("inputWeight");
	var date = document.getElementById("weightheight-date-input");
    var table = document.getElementById("WeightHeightTable");

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    row.insertCell(0).innerHTML= String(weight.value) + ' <br> <input type="hidden" name="inputWeight' + String(rowCount) + '" value="' + String(weight.value) + '" />';
    row.insertCell(1).innerHTML= String(height.value) + ' <br> <input type="hidden" name="inputHeight' + String(rowCount) + '" value="' + String(height.value) + '" />';
	row.insertCell(2).innerHTML= String(date.value) + ' <br> <input type="hidden" name="inputDate' + String(rowCount) + '" value="' + String(date.value) + '" />';;
	row.insertCell(3).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRow(this)">';

}

function deleteRow(obj) {
     
    var index = obj.parentNode.parentNode.rowIndex;
    var table = document.getElementById("WeightHeightTable");
    table.deleteRow(index);
   
}

function load() {
   
    console.log("Page load finished");

}