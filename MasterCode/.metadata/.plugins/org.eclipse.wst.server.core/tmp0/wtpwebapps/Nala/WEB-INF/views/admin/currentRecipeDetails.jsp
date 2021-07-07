<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="stepNo" value="${currentRecipeDetail.stepNo}" />
<div id="currentStepDetails">
					<div class="row">
						<div class="col-lg-4">
							<div class="form-group">
								<label class="form-control-label" for="">Current Step</label> 
								<c:choose>
								<c:when test = "${stepNo>=1}">
								<input type="text" id="currentStep" name="currentStep" class="form-control" value="${currentRecipeDetail.stepNo}">
								</c:when>	
							 <c:otherwise>
							 	<input type="text" id="currentStep" name="currentStep" class="form-control" value="0">
							 </c:otherwise>
							 </c:choose>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="form-group">
								<label class="form-control-label" for="">Row Increment</label> <input
									type="text" id="rowIncrement" name="rowIncrement" class="form-control" value="${rowIncrement}">
							</div>
						</div>
					</div>
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>Action Item</th>
								<th>UIP Id</th>
								<th>Value Gms/ml</th>
								<th>Delay S/ms</th>
								<th>Gas Level</th>
								<th>Parallel Action Item</th>
								<th>Bin/Equip ID</th>
								<th>Value Gms/ml</th>
								<th>Delay S/ms</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<c:choose>
							<c:when test = "${stepNo>=1}">
								    <td>${currentRecipeDetail.mainAction.name}</td>
									<td>${currentRecipeDetail.mainAction.name}</td>
									<td>${currentRecipeDetail.mainActionValueInGmsMl}</td>
									<td>${currentRecipeDetail.mainActionDelayInMilliSeconds}</td>
									<td>${currentRecipeDetail.flameLevel.percentage}</td>
									<td>${currentRecipeDetail.parllelAction.name}</td>
									<td>${currentRecipeDetail.parllelAction.name}</td>
									<td>${currentRecipeDetail.parllelActionValueInGmsMl}</td>
									<td>${currentRecipeDetail.parllelActionDelayInMilliSeconds}</td>
							</c:when>	
							 <c:otherwise>
							    <td>--</td>
								<td>--</td>
								<td>--</td>
								<td>--</td>
								<td>--</td>
								<td>--</td>
								<td>--</td>
								<td>--</td>
								<td>--</td>
							 </c:otherwise>
							 </c:choose>
							</tr>
						</tbody>
					</table>
				</div>
			   </div>
				<!--table End -->
				
<script>
   $(document).ready(function(){
	//alert("2:::"+$("#currentStep").val());
	//alert("2:::"+$("#rowIncrement").val());
	//alert("2:::"+$("#totalSteps").val());
	var burnerId = $("#burnerList").val();
    var recipeId = $("#recipetype1").val();
    var currentStepNo=parseInt($("#currentStep").val())+1;
    //alert("2_________________________________"+currentStepNo);
    var rowIncrement=parseInt($("#rowIncrement").val());
    var totalSteps=parseInt($("#totalSteps").val());
    if((currentStepNo==rowIncrement) && (currentStepNo<=totalSteps)){
	var  formData = "burner="+burnerId+"&recipe="+recipeId+"&stepNo="+currentStepNo;  //Name value Pair
    $.ajax({
	        type: 'POST',
	        url: "${pageContext.request.contextPath}/admin/executeCookingProcessStep",
	        data : formData,
	        success: function(data){
	        	$('#currentStepDetails').html(data);
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	        	alert('error '+errorThrown);
	        }

	    });
    } else{
    	alert("Recipe Preparation Completed");
    	 $.ajax({
   	        type: 'GET',
   	        url: "${pageContext.request.contextPath}/admin/getCookingProcessDetails/"+recipeId+"/0",
   	        success: function(data){
   	        	$('#recipe-load').html(data);
   	        },
   	        error:function(jqXHR, textStatus, errorThrown){
   	        	alert('error '+errorThrown);
   	        }

   	    });
    }
});
</script>