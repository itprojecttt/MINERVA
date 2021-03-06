function addRowWeightHeight() {
         
    var height = document.getElementById("inputHeight");
    var weight = document.getElementById("inputWeight");
	var date = document.getElementById("weightheight-date-input");
    var table = document.getElementById("WeightHeightTable");

    // Condition to ensure all values are filled before adding to table.
    if(height.value == '' || weight.value == '' || date.value == '' || isNaN(height.value) || isNaN(weight.value)){
        return;
    }

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    row.insertCell(0).innerHTML= String(weight.value) + ' <br> <input type="hidden" class="form-control form-control-lg" name="inputWeight' + String() + '" value="' + String(weight.value) + '" />';
    row.insertCell(1).innerHTML= String(height.value) + ' <br> <input type="hidden" class="form-control form-control-lg" name="inputHeight' + String() + '" value="' + String(height.value) + '" />';
	row.insertCell(2).innerHTML= String(date.value) + ' <br> <input type="hidden" class="form-control form-control-lg" name="inputWeightHeightDate' + String() + '" value="' + String(date.value) + '" />';;
	row.insertCell(3).innerHTML= '<input type="button" value = "Delete" onClick="Javascript:deleteRowWeightHeight(this)">';

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

    // Condition to ensure all values are filled before adding to table.
    if(teeth.value == '' || date.value == '' || isNaN(teeth.value)){
        return;
    }
    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    row.insertCell(0).innerHTML= String(teeth.value) + ' <br> <input type="hidden" class="form-control form-control-lg" name="inputTeeth' + String() + '" value="' + String(teeth.value) + '" />';
	row.insertCell(1).innerHTML= String(date.value) + ' <br> <input type="hidden" class="form-control form-control-lg" name="inputTeethDate' + String() + '" value="' + String(date.value) + '" />';;
	row.insertCell(2).innerHTML= '<input type="button" value = "Delete" onClick="Javascript:deleteRowTeeth(this)">';

}

function deleteRowTeeth(obj) {
     
    var index = obj.parentNode.parentNode.rowIndex;
    var table = document.getElementById("TeethTable");
    table.deleteRow(index);
   
}

function addRowHead() {
         
    var head = document.getElementById("inputHead");
	var date = document.getElementById("date_head");
    var table = document.getElementById("HeadTable");

    // Condition to ensure all values are filled before adding to table.
    if(head.value == '' || date.value == '' || isNaN(head.value)){
        return;
    }

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    row.insertCell(0).innerHTML= String(head.value) + ' <br> <input type="hidden" class="form-control form-control-lg" name="inputHead' + String() + '" value="' + String(head.value) + '" />';
	row.insertCell(1).innerHTML= String(date.value) + ' <br> <input type="hidden" class="form-control form-control-lg" name="inputHeadDate' + String() + '" value="' + String(date.value) + '" />';;
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