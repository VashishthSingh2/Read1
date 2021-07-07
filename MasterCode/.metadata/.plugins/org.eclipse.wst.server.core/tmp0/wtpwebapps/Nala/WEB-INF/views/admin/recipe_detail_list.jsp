<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ page session="false" %> 
<html> 
    <head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .mtop30 {margin-top: 30px}
            tr th {font-weight: 500;font-size: 13px;padding: 2px;}
            tr td {padding: 2px !important;}
            .form-control {padding: 3px; height: 35px !important;}
            .auto-snumbers tr {counter-increment: row-num;}
.auto-snumbers tr td:first-child::before { content: counter(row-num); }
            
        </style>
 
    </head>
<body> 
    <script>
window.addEventListener("load", function () {
	var recipeDetailsCount='${recipeDetailsForm.recipeDetails.size()}';
	//set the main action
	for (i = 0; i < recipeDetailsCount; i++) {
	var formObj = document.getElementById('recipeDetails['+i+'].mainAction.id');
    var mainAction = document.getElementById('recipeDetails['+i+'].actionValue').value;
    let len;
    for (let i = 0, len = formObj.length; i < len; i++){
        if (formObj[i].value ==mainAction) 
         formObj.options[i].selected = true;
    }
  }
  //set the Flame Level
  for (i = 0; i < recipeDetailsCount; i++) {
	var formObj = document.getElementById('recipeDetails['+i+'].flameLevel.id');
    var flameLevel = document.getElementById('recipeDetails['+i+'].percentage').value;
    let len;
    for (let i = 0, len = formObj.length; i < len; i++){
        if (formObj[i].value ==flameLevel) 
         formObj.options[i].selected = true;
    }
  }
  
  //set the main item
  for (i = 0; i < recipeDetailsCount; i++) {
	var formObj = document.getElementById('recipeDetails['+i+'].mainItemId');
    var mainItem = document.getElementById('recipeDetails['+i+'].mainItemhiddenValue').value;
    let len;
    for (let i = 0, len = formObj.length; i < len; i++){
        if (formObj[i].value ==mainItem) 
         formObj.options[i].selected = true;
    }
  }
  
  //set the parallel item
  for (i = 0; i < recipeDetailsCount; i++) {
	var formObj = document.getElementById('recipeDetails['+i+'].parllelItemId');
    var parllelItem = document.getElementById('recipeDetails['+i+'].parllelItemhiddenValue').value;
    let len;
    for (let i = 0, len = formObj.length; i < len; i++){
        if (formObj[i].value ==parllelItem) 
         formObj.options[i].selected = true;
    }
  }
  
//set the parallel action
	for (i = 0; i < recipeDetailsCount; i++) {
	var formObj = document.getElementById('recipeDetails['+i+'].parllelAction.id');
    var parllelAction = document.getElementById('recipeDetails['+i+'].parllelActionValue').value;
  	let len;
  	for (let i = 0, len = formObj.length; i < len; i++){
      if (formObj[i].value ==parllelAction) 
       formObj.options[i].selected = true;
  }
}
  
});
</script>
<script>
function validateFunction(){
	var recipeDetailsCount=document.getElementById('recordCounter').value;
	//get the main action
	for (i = 0; i < recipeDetailsCount; i++) {
	var formObj = document.getElementById('recipeDetails['+i+'].mainAction.id');
	var validForm=true;
	if (formObj.value =="") {
		validForm=false;
		break;
	  }
	}
	if(!validForm){
		alert("Main Action Cannot Empty")
		event.preventDefault();
	}
}
</script>       
 <input type="hidden" name="recordCounter" id="recordCounter" value="${recipeDetailsForm.recipeDetails.size()}">
 
    <div class="container">
        <div>
            
              <div class="row">
                <div class="col">
                    <label>Recipe Name: ${recipe.name}</label>
                </div>
                <div class="col">
                    <label>Recipe Type: ${recipe.recipeType.name}</label>
                </div>
                <div class="col">
                    <button class="btn btn-primary mtop10 show-btn">Add/Edit Recipe Details</button>
                </div>
              </div>
            
        </div>
        <div class="clear"></div>
        <div class="table-data">
        <div class="table-responsive">
<form:form method="post" action="${pageContext.request.contextPath}/admin/updateRecipeDetail" modelAttribute="recipeDetailsForm">
	<table class="table table-bordered mtop30 auto-snumbers">
  	<thead>
    <tr>
      <th>Step #</th>
      <th>Action Item</th>
      <th>Bin/ Equip ID</th>
      <th>Value Gms/ml</th>
      <th>Delay S/ms</th>
      <th>Gas Level</th>
      <th>Parallel Action Item</th>
      <th>Bin/ Equip ID</th>
      <th>Value Gms/ml</th>
      <th>Delay S/ms</th>
      <th>Delete</th>
    </tr>
  </thead>
  <tbody>
    <c:choose>
    <c:when test="${recipeDetailsForm.recipeDetails.size() > '0'}">
       <c:forEach items="${recipeDetailsForm.recipeDetails}" var="recipeDetail" varStatus="status">
    <tr>
      <td></td>
      <td>
        <select name="recipeDetails[${status.index}].mainAction.id" id="recipeDetails[${status.index}].mainAction.id" class="form-control">
        	<option value="" selected>--Select--</option>
            <c:forEach items="${actionList}" var="action">
        		<option value="${action.id}">${action.name}</option>
    		</c:forEach>
          </select>
          <input type="hidden" name="recipeDetails[${status.index}].actionValue" id="recipeDetails[${status.index}].actionValue" value="${recipeDetail.mainAction.id}">
        </td>
      <td>
      <c:set var="mainItemValue" value="${recipeDetail.mainItemId}" />
      <select name="recipeDetails[${status.index}].mainItemId" id="recipeDetails[${status.index}].mainItemId" class="form-control">
      		<c:if test="${fn:contains(mainItemValue, 'B|')}"> 
      		<c:forEach items="${recipeDetail.mainItemList}" var="mainActionItem">
        		<option value="${mainActionItem.id}">${mainActionItem.name}</option>
    		</c:forEach>
    		</c:if>
            <c:if test="${fn:contains(mainItemValue, 'E|')}"> 
    		<c:forEach items="${recipeDetail.mainItemList}" var="mainActionItem">
        		<option value="${mainActionItem.id}">${mainActionItem.name}</option>
    		</c:forEach>
    		</c:if>
    		<c:if test="${fn:contains(mainItemValue, 'S|')}"> 
      		<c:forEach items="${recipeDetail.mainItemList}" var="mainActionItem">
        		<option value="${mainActionItem.id}">${mainActionItem.name}</option>
    		</c:forEach>
    		</c:if>
    		<c:if test="${fn:contains(mainItemValue, 'T|')}"> 
      		<c:forEach items="${recipeDetail.mainItemList}" var="mainActionItem">
        		<option value="${mainActionItem.id}">${mainActionItem.name}</option>
    		</c:forEach>
    		</c:if>
      	 </select>
      	 <input type="hidden" name="recipeDetails[${status.index}].mainItemhiddenValue" id="recipeDetails[${status.index}].mainItemhiddenValue" value="${recipeDetail.mainItemId}">
      	 </td>  
      <td><form:input path="recipeDetails[${status.index}].mainActionValueInGmsMl" id="recipeDetails[${status.index}].mainActionValueInGmsMl" value ='${recipeDetail.mainActionValueInGmsMl}' class="form-control" /></td>
      <td><form:input path="recipeDetails[${status.index}].mainActionDelayInMilliSeconds" id="recipeDetails[${status.index}].mainActionDelayInMilliSeconds" value ='${recipeDetail.mainActionDelayInMilliSeconds}' class="form-control" /></td>
      <td>
        <select name="recipeDetails[${status.index}].flameLevel.id" id="recipeDetails[${status.index}].flameLevel.id" class="form-control">
            <option value="" selected>--Select--</option>
            <c:forEach items="${flameLevelList}" var="flameLevel">
        		<option value="${flameLevel.id}">${flameLevel.percentage}</option>
    		</c:forEach>
          </select>
          <input type="hidden" name="recipeDetails[${status.index}].percentage" id="recipeDetails[${status.index}].percentage" value="${recipeDetail.flameLevel.id}">
        </td>
      <td>
        <select name="recipeDetails[${status.index}].parllelAction.id" id="recipeDetails[${status.index}].parllelAction.id" class="form-control">
            <option value="" selected>--Select--</option>
            <c:forEach items="${actionList}" var="parallelItem">
        		<option value="${parallelItem.id}">${parallelItem.name}</option>
    		</c:forEach>
          </select>
          <input type="hidden" name="recipeDetails[${status.index}].parllelActionValue" id="recipeDetails[${status.index}].parllelActionValue" value="${recipeDetail.parllelAction.id}">
        </td>
      <td>
      <c:set var="parllelIItemValue" value="${recipeDetail.parllelItemId}" />
      <select name="recipeDetails[${status.index}].parllelItemId" id="recipeDetails[${status.index}].parllelItemId" class="form-control">
      		<c:if test="${fn:contains(parllelIItemValue, 'B|')}"> 
      		<c:forEach items="${recipeDetail.parallelItemList}" var="parallelActionItem">
        		<option value="${parallelActionItem.id}">${parallelActionItem.name}</option>
    		</c:forEach>
    		</c:if>
            <c:if test="${fn:contains(parllelIItemValue, 'E|')}"> 
    		<c:forEach items="${recipeDetail.parallelItemList}" var="parallelActionItem">
        		<option value="${parallelActionItem.id}">${parallelActionItem.name}</option>
    		</c:forEach>
    		</c:if>
    		<c:if test="${fn:contains(parllelIItemValue, 'S|')}"> 
      		<c:forEach items="${recipeDetail.parallelItemList}" var="parallelActionItem">
        		<option value="${parallelActionItem.id}">${parallelActionItem.name}</option>
    		</c:forEach>
    		</c:if>
    		<c:if test="${fn:contains(parllelIItemValue, 'T|')}"> 
      		<c:forEach items="${recipeDetail.parallelItemList}" var="parallelActionItem">
        		<option value="${parallelActionItem.id}">${parallelActionItem.name}</option>
    		</c:forEach>
    		</c:if>
      </select>
      <input type="hidden" name="recipeDetails[${status.index}].parllelItemhiddenValue" id="recipeDetails[${status.index}].parllelItemhiddenValue" value="${recipeDetail.parllelItemId}">
      </td>
      <td><form:input path="recipeDetails[${status.index}].parllelActionValueInGmsMl" id="recipeDetails[${status.index}].parllelActionValueInGmsMl" value ='${recipeDetail.parllelActionValueInGmsMl}' class="form-control" /></td>
      <td><form:input path="recipeDetails[${status.index}].parllelActionDelayInMilliSeconds" id="recipeDetails[${status.index}].parllelActionDelayInMilliSeconds" value ='${recipeDetail.parllelActionDelayInMilliSeconds}' class="form-control"/>
           <input type="hidden" name="recipeDetails[${status.index}].recipe.id" value ='${recipe.id}' class="form-control" />
           <input type="hidden" name="recipeDetails[${status.index}].id" value ='${recipeDetail.id}' class="form-control" /></td>
      <td><a href="javascript:void(0)" class="remove">X</a></td>
    </tr>
    </c:forEach>
    </c:when>    
    <c:otherwise>
        <tr>
      <td></td>
      <td>
        <select name="recipeDetails[0].mainAction.id" id="recipeDetails[0].mainAction.id" class="form-control">
        	<option value="" selected>--Select--</option>
            <c:forEach items="${actionList}" var="action">
        		<option value="${action.id}">${action.name}</option>
    		</c:forEach>
          </select>
        </td>
      <td><select name="recipeDetails[0].mainItemId" id="recipeDetails[0].mainItemId" class="form-control"></select></td>
      <td><form:input path="recipeDetails[0].mainActionValueInGmsMl" id="recipeDetails[0].mainActionValueInGmsMl" value ='${recipeDetail.mainActionValueInGmsMl}' class="form-control" /></td>
      <td><form:input path="recipeDetails[0].mainActionDelayInMilliSeconds" id="recipeDetails[0].mainActionDelayInMilliSeconds" value ='${recipeDetail.mainActionDelayInMilliSeconds}' class="form-control" /></td>
      <td>
        <select name="recipeDetails[0].flameLevel.id" id="recipeDetails[0].flameLevel.id" class="form-control">
         	<option value="" selected>--Select--</option>
            <c:forEach items="${flameLevelList}" var="flameLevel">
        		<option value="${flameLevel.id}">${flameLevel.percentage}</option>
    		</c:forEach>
          </select>
        </td>
      <td>
        <select name="recipeDetails[0].parllelAction.id" id="recipeDetails[0].parllelAction.id" class="form-control">
        		<option value="" selected>--Select--</option>
            <c:forEach items="${actionList}" var="action">
        		<option value="${action.id}">${action.name}</option>
    		</c:forEach>
          </select>
        </td>
      <td><select name="recipeDetails[0].parllelItemId" id="recipeDetails[0].parllelItemId" class="form-control"></select></td>
      <td><form:input path="recipeDetails[0].parllelActionValueInGmsMl" id="recipeDetails[0].parllelActionValueInGmsMl" value ='${recipeDetail.parllelActionValueInGmsMl}' class="form-control" /></td>
      <td><form:input path="recipeDetails[0].parllelActionDelayInMilliSeconds" id="recipeDetails[0].parllelActionDelayInMilliSeconds" value ='${recipeDetail.parllelActionDelayInMilliSeconds}' class="form-control" /><input type="hidden" name="recipeDetails[0].recipe.id" value ="${recipe.id}" class="form-control" /></td>
      <td><a href="javascript:void(0)" class="remove">X</a></td>
    </tr>

      
    </c:otherwise>
</c:choose> 
  </tbody>
</table>
<input type="submit" onclick="validateFunction();" value="save">
</form:form>
    <span class="btn btn-primary add-btn">Add New Row</span>
    <!-- <button class="btn btn-primary delete-row">Delete Rows</button> -->
     </div>
     </div>
</div>

<script>
$(document).ready(function(){
	var recordCount = parseInt($('#recordCounter').val());
	if(recordCount > 0){
		$(".table-data").show();
	} else {
		$(".table-data").hide();
	}
  	$(".show-btn").click(function(){
    $(".table-data").show();
  	});
  	
   $(".add-btn").click(function(){
	  var recordCount = parseInt($('#recordCounter').val());
	  if(recordCount==0){
	  recordCount=recordCount+1;
	  }
	 // alert(recordCount);
	 // $("table").append('<tr><td></td><td> <select name="recipeDetails["+'recordCount'+"].mainAction.id" id="recipeDetails[0].mainAction.id" class="form-control"><option>Utensil</option><option>Spatula</option><option>Veg Dispense</option><option>Spice Dispense</option><option>Non Veg Dispense</option><option>Toss</option><option>Stir</option><option>Serve</option><option>Liquid Dispense</option><option>Veg Collect</option><option>Non Veg Collect</option><option>Spice Collect</option> </select></td><td><input type="text" class="form-control" /></td><td><input type="text" class="form-control" /></td><td><input type="text" class="form-control" /></td><td> <select class="form-control"><option>Ignition On</option><option>50</option><option>40</option><option>30</option><option>20</option><option>10</option><option>Ignition Off</option> </select></td><td> <select class="form-control"><option>Utensil</option><option>Spatula</option><option>Veg Dispense</option><option>Spice Dispense</option><option>Non Veg Dispense</option><option>Toss</option><option>Stir</option><option>Serve</option><option>Liquid Dispense</option><option>Veg Collect</option><option>Non Veg Collect</option><option>Spice Collect</option> </select></td><td><input type="text" class="form-control" /></td><td><input type="text" class="form-control" /></td><td><input type="text" class="form-control" /></td></tr>');
     $("table").append('<tr><td></td><td>'+
	     		 '<select name="recipeDetails[' + recordCount + '].mainAction.id" id="recipeDetails[' + recordCount + '].mainAction.id" class="form-control">'+
	     		 '<option value="" selected>--Select--</option>'+
	         	 '<c:forEach items="${actionList}" var="action">'+
	     		 '<option value="${action.id}">${action.name}</option>'+
	 			 '</c:forEach>'+
	       		 '</select></td><td>'+
	       		 '<select name="recipeDetails[' + recordCount + '].mainItemId" id="recipeDetails[' + recordCount + '].mainItemId" class="form-control">'+
	       		 '</select></td><td>'+
	     		 '<input name="recipeDetails[' + recordCount + '].mainActionValueInGmsMl" id="recipeDetails[' + recordCount + '].mainActionValueInGmsMl" class="form-control" /></td><td>'+
	     		 '<input name="recipeDetails[' + recordCount + '].mainActionDelayInMilliSeconds" id="recipeDetails[' + recordCount + '].mainActionDelayInMilliSeconds" class="form-control" /></td><td>'+
	     		 '<select name="recipeDetails[' + recordCount + '].flameLevel.id" id="recipeDetails[' + recordCount + '].flameLevel.id" class="form-control">'+
	     		 '<option value="" selected>--Select--</option>'+
	         	 '<c:forEach items="${flameLevelList}" var="flameLevel">'+
	     		 '<option value="${flameLevel.id}">${flameLevel.percentage}</option>'+
	 			 '</c:forEach>'+
	       		 '</select></td><td>'+
	     		 '<select name="recipeDetails[' + recordCount + '].parllelAction.id" id="recipeDetails[' + recordCount + '].parllelAction.id" class="form-control">'+
	     		 '<option value="" selected>--Select--</option>'+
	         	 '<c:forEach items="${actionList}" var="action">'+
	     		 '<option value="${action.id}">${action.name}</option>'+
	 			 '</c:forEach>'+
	       		 '</select></td><td>'+
	       		 '<select name="recipeDetails[' + recordCount + '].parllelItemId" id="recipeDetails[' + recordCount + '].parllelItemId" class="form-control">'+
	       		 '</select></td><td>'+
	     		 '<input name="recipeDetails[' + recordCount + '].parllelActionValueInGmsMl" id="recipeDetails[' + recordCount + '].parllelActionValueInGmsMl" class="form-control" /></td><td>'+
	     		  '<input name="recipeDetails[' + recordCount + '].parllelActionDelayInMilliSeconds" id="recipeDetails[' + recordCount + '].parllelActionDelayInMilliSeconds" class="form-control" /><input type="hidden" name="recipeDetails[' + recordCount + '].recipe.id" value ="${recipe.id}" class="form-control" /></td> <td><a href="javascript:void(0)" class="remove">X</a></td> </tr>')  
     recordCount=recordCount+1; 
	 $('#recordCounter').val(recordCount);
  });
    
    add-btn
});

var previousValue;
$(document).on('focus', "select" , function(){
	previousValue=$(this).val();
	//alert("Previous:: "+previousValue);
});

$(document).on('change', "select" , function(){
	var actionId = $(this).val();
	var selectComponentName=this.id;
	var actionName = $(this).find('option:selected').text();
	var startindex=selectComponentName.indexOf("[")+1;
	var endIndex=selectComponentName.indexOf("]");
	var index=selectComponentName.substring(startindex,endIndex);
	if(actionId==""){
      	if(selectComponentName.indexOf("mainAction") != -1){
              document.getElementById('recipeDetails['+index+'].mainItemId').innerText = null;
      	} else if(selectComponentName.indexOf("parllelAction") != -1){
            document.getElementById('recipeDetails['+index+'].parllelItemId').innerText = null;
      	}
	} else if(actionName.indexOf("Serve") != -1){
		var recordCount = parseInt($('#recordCounter').val());
		if(parseInt(index)+1!=recordCount){
			alert("Serve action Should be end of recipe process");
			var formObj = document.getElementById('recipeDetails['+index+'].mainAction.id');
			let len;
		    for (let i = 0, len = formObj.length; i < len; i++){
		    	//alert(formObj[i].value+"::::"+previousValue)
		        if (formObj[i].value == previousValue) {
		        	//alert("Matched");
		         formObj.options[i].selected = true;
		         return false;
		        }
		    }
		}
		var formObj = document.getElementById('recipeDetails['+index+'].flameLevel.id');
		let len;
	    for (let i = 0, len = formObj.length; i < len; i++){
	        if (formObj[i].text =="OFF") {}
	         formObj.options[i].selected = true;
	    }
	    if(selectComponentName.indexOf("mainAction") != -1){
            document.getElementById('recipeDetails['+index+'].mainItemId').innerText = null;
      	} else if(selectComponentName.indexOf("parllelAction") != -1){
            document.getElementById('recipeDetails['+index+'].parllelItemId').innerText = null;
      	}
		 	$(document.getElementById('recipeDetails['+index+'].mainActionValueInGmsMl')).attr("disabled", "disabled");
			$(document.getElementById('recipeDetails['+index+'].mainActionDelayInMilliSeconds')).attr("disabled", "disabled");
			$(document.getElementById('recipeDetails['+index+'].parllelActionValueInGmsMl')).attr("disabled", "disabled");
			$(document.getElementById('recipeDetails['+index+'].parllelActionDelayInMilliSeconds')).attr("disabled", "disabled");
	} else if(actionName.indexOf("Utensile Pick") != -1){
		var recordCount = parseInt($('#recordCounter').val());
		var mainActionvalidated=true;
		var parallelActionValidated=true;
		for (i = 0; i < recordCount; i++) {
		var formObj = document.getElementById('recipeDetails['+i+'].mainAction.id');
		var actionName = $(formObj).find('option:selected').text();
		if(actionName=="Utensile Pick" && (i!=index)){
			mainActionvalidated=false;
			alert("Utensile Pick already selected")
			break;
			}
		}
		if(mainActionvalidated){
			for (i = 0; i < recordCount; i++) {
				var parallelActionformObj = document.getElementById('recipeDetails['+i+'].parllelAction.id');
				var actionName = $(parallelActionformObj).find('option:selected').text();
				if(actionName=="Utensile Pick" && (i!=index)){
					parallelActionValidated=false;
					alert("Utensile Pick already selected")
					break;
					}
				}
		}
		if(!mainActionvalidated || !parallelActionValidated){
		var formObj;
		if(selectComponentName.indexOf("mainAction") != -1){
		   formObj = document.getElementById('recipeDetails['+index+'].mainAction.id');
		} else {
			formObj = document.getElementById('recipeDetails['+index+'].parllelAction.id');
		}
		let len;
	    for (let i = 0, len = formObj.length; i < len; i++){
	        if (formObj[i].value == previousValue) {
	         formObj.options[i].selected = true;
	         return false;
	        }
	     }
		} else {
			$.ajax({
	  	        type: 'GET',
	  	        url: "${pageContext.request.contextPath}/admin/getDropDownOptions/" + actionId,
	  	        dataType:'json',
	  	        headers: { 
	  	            Accept : "application/json"
	  	        },
	  	        success: function(data){
	  	        	var formObj;
	  	        	if(selectComponentName.indexOf("mainAction") != -1){
	  	        		formObj = document.getElementById('recipeDetails['+index+'].mainItemId');
	  	                document.getElementById('recipeDetails['+index+'].mainItemId').innerText = null;
	  	        	} else if(selectComponentName.indexOf("parllelAction") != -1){
	  	        	    formObj = document.getElementById('recipeDetails['+index+'].parllelItemId');
		                document.getElementById('recipeDetails['+index+'].parllelItemId').innerText = null;
	  	        	}
	            for (var i=0; i < data.length;++i){
	            	
	            	 var optn = document.createElement("OPTION");
	            	    optn.text = data[i].name;
	            	    optn.value = data[i].id;
	            	    formObj.appendChild(optn);
	  	  	       
	  	  	    }
	  	        },
	  	        error:function(jqXHR, textStatus, errorThrown){
	  	        	alert('error '+errorThrown);
	  	        }

	  	    });
			if(selectComponentName.indexOf("mainAction") != -1){
			 	$(document.getElementById('recipeDetails['+index+'].mainActionValueInGmsMl')).attr("disabled", "disabled");
				$(document.getElementById('recipeDetails['+index+'].mainActionDelayInMilliSeconds')).attr("disabled", "disabled");
			} else if(selectComponentName.indexOf("parllelAction") != -1){ 
				$(document.getElementById('recipeDetails['+index+'].parllelActionValueInGmsMl')).attr("disabled", "disabled");
				$(document.getElementById('recipeDetails['+index+'].parllelActionDelayInMilliSeconds')).attr("disabled", "disabled");
			}
			
		}
	} else if(actionName.indexOf("Spatula Pick") != -1){
		var recordCount = parseInt($('#recordCounter').val());
		var mainActionvalidated=true;
		var parallelActionValidated=true;
		for (i = 0; i < recordCount; i++) {
		var mainActionformObj = document.getElementById('recipeDetails['+i+'].mainAction.id');
		var actionName = $(mainActionformObj).find('option:selected').text();
		if(actionName=="Spatula Pick" && (i!=index)){
			mainActionvalidated=false;
			alert("Spatula Pick already selected")
			break;
			}
		}
		if(mainActionvalidated){
			for (i = 0; i < recordCount; i++) {
				var parallelActionformObj = document.getElementById('recipeDetails['+i+'].parllelAction.id');
				var actionName = $(parallelActionformObj).find('option:selected').text();
				if(actionName=="Spatula Pick" && (i!=index)){
					parallelActionValidated=false;
					alert("Spatula Pick already selected")
					break;
					}
				}
		}
		if(!mainActionvalidated || !parallelActionValidated){
			var formObj;
			if(selectComponentName.indexOf("mainAction") != -1){
				formObj= document.getElementById('recipeDetails['+index+'].mainAction.id');
			} else {
				formObj= document.getElementById('recipeDetails['+index+'].parllelAction.id');
			}
		let len;
	    for (let i = 0, len = formObj.length; i < len; i++){
	    	//alert(formObj[i].value+"::::"+previousValue)
	        if (formObj[i].value == previousValue) {
	        	//alert("Matched");
	         formObj.options[i].selected = true;
	         return false;
	        }
	     }
		} else {
			$.ajax({
	  	        type: 'GET',
	  	        url: "${pageContext.request.contextPath}/admin/getDropDownOptions/" + actionId,
	  	        dataType:'json',
	  	        headers: { 
	  	            Accept : "application/json"
	  	        },
	  	        success: function(data){
	  	        	var formObj;
	  	        	if(selectComponentName.indexOf("mainAction") != -1){
	  	        		formObj = document.getElementById('recipeDetails['+index+'].mainItemId');
	  	                document.getElementById('recipeDetails['+index+'].mainItemId').innerText = null;
	  	        	} else if(selectComponentName.indexOf("parllelAction") != -1){
	  	        	    formObj = document.getElementById('recipeDetails['+index+'].parllelItemId');
		                document.getElementById('recipeDetails['+index+'].parllelItemId').innerText = null;
	  	        	}
	            for (var i=0; i < data.length;++i){
	            	
	            	 var optn = document.createElement("OPTION");
	            	    optn.text = data[i].name;
	            	    optn.value = data[i].id;
	            	    formObj.appendChild(optn);
	  	  	       
	  	  	    }
	  	        },
	  	        error:function(jqXHR, textStatus, errorThrown){
	  	        	alert('error '+errorThrown);
	  	        }

	  	    });
			if(selectComponentName.indexOf("mainAction") != -1){
			 	$(document.getElementById('recipeDetails['+index+'].mainActionValueInGmsMl')).attr("disabled", "disabled");
				$(document.getElementById('recipeDetails['+index+'].mainActionDelayInMilliSeconds')).attr("disabled", "disabled");
			} else if(selectComponentName.indexOf("parllelAction") != -1){ 
				$(document.getElementById('recipeDetails['+index+'].parllelActionValueInGmsMl')).attr("disabled", "disabled");
				$(document.getElementById('recipeDetails['+index+'].parllelActionDelayInMilliSeconds')).attr("disabled", "disabled");
			}
		}		
	} else if(actionName.indexOf("Toss") != -1){
		var formObj;
		if(selectComponentName.indexOf("mainAction") != -1){
      		formObj = document.getElementById('recipeDetails['+index+'].mainItemId');
            document.getElementById('recipeDetails['+index+'].mainItemId').innerText = null;
      	} else if(selectComponentName.indexOf("parllelAction") != -1){
      	    formObj = document.getElementById('recipeDetails['+index+'].parllelItemId');
            document.getElementById('recipeDetails['+index+'].parllelItemId').innerText = null;
      	}
		   var optn = document.createElement("OPTION");
 	    	optn.text = "${recipe.name}"
 	    	optn.value ="T|${recipe.id}";
 	    	formObj.appendChild(optn);
	} else if(selectComponentName.indexOf("Action") != -1){
		$.ajax({
  	        type: 'GET',
  	        url: "${pageContext.request.contextPath}/admin/getDropDownOptions/" + actionId,
  	        dataType:'json',
  	        headers: { 
  	            Accept : "application/json"
  	        },
  	        success: function(data){
  	        	var formObj;
  	        	if(selectComponentName.indexOf("mainAction") != -1){
  	        		formObj = document.getElementById('recipeDetails['+index+'].mainItemId');
  	                document.getElementById('recipeDetails['+index+'].mainItemId').innerText = null;
  	        	} else if(selectComponentName.indexOf("parllelAction") != -1){
  	        	    formObj = document.getElementById('recipeDetails['+index+'].parllelItemId');
	                document.getElementById('recipeDetails['+index+'].parllelItemId').innerText = null;
  	        	}
            for (var i=0; i < data.length;++i){
            	
            	 var optn = document.createElement("OPTION");
            	    optn.text = data[i].name;
            	    optn.value = data[i].id;
            	    formObj.appendChild(optn);
  	  	       
  	  	    }
  	        },
  	        error:function(jqXHR, textStatus, errorThrown){
  	        	alert('error '+errorThrown);
  	        }

  	    });
		
		if(selectComponentName.indexOf("mainAction") != -1){
			$(document.getElementById('recipeDetails['+index+'].mainActionValueInGmsMl')).removeAttr("disabled");
			$(document.getElementById('recipeDetails['+index+'].mainActionDelayInMilliSeconds')).removeAttr("disabled");
		} else if(selectComponentName.indexOf("parllelAction") != -1){ 
			$(document.getElementById('recipeDetails['+index+'].parllelActionValueInGmsMl')).removeAttr("disabled");
			$(document.getElementById('recipeDetails['+index+'].parllelActionDelayInMilliSeconds')).removeAttr("disabled");
		}
	}
	
  });
  
$(document).on("click", "a.remove" , function() {
    $(this).parents("tr").remove();
});
</script>

</body> 
</html>
