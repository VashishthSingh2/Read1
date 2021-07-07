<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="stepNo" value="${currentRecipeDetail.stepNo}" />	
		<div id="recipe-details1">
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="form-group">
                        <label class="form-control-label" for="">Recipe Description</label>
                        <textarea class="form-control" id="" name="" rows="3" disabled="disabled">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</textarea>
                      </div>
                    </div>
                  </div>
                 <div class="row">
                    <div class="col-lg-12">
                      <div class="form-group">
                        <label class="form-control-label" for="">No.of Steps</label>
                        <input type="text" id="totalSteps" name="totalSteps" class="form-control" value="${recipeDetailsList.size()}" disabled="disabled">
                      </div>
                    </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-md-12">
                    <button type="button" class="btn btn-outline-success my-2">Start</button>
                    <button type="button" class="btn btn-outline-danger my-3">Stop</button>
                    <button type="button" class="btn btn-outline-info my-4">Prev</button>
                    <button type="button" class="btn btn-outline-warning my-5">Next</button>
                  </div>
                  </div>
                <!-- Address -->
              
             
			  <!-- Search End -->
			  <div id="onRecipeSelection">
			  
			  <div class="card shadow mb-4" id="nextStep">
			  <div class="card-body">
				<div class="row">
					<div class="col">
						<h5 class="m-0 font-weight-bold text-dark">Current Action</h5>
					</div>
				</div>
				<hr>
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
									type="text" id="rowIncrement" name="rowIncrement" class="form-control" value="0">
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
									<td>${currentRecipeDetail.mainItemId}</td>
									<td>${currentRecipeDetail.mainActionValueInGmsMl}</td>
									<td>${currentRecipeDetail.mainActionDelayInMilliSeconds}</td>
									<td>${currentRecipeDetail.flameLevel.percentage}</td>
									<td>${currentRecipeDetail.parllelAction.name}</td>
									<td>${currentRecipeDetail.parllelItemId}</td>
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
			</div>
		</div>
		<!-- Card End -->
		<div class="card shadow mb-4">
			<div class="card-body">
				<div class="row">
					<div class="col">
						<h5 class="m-0 font-weight-bold text-dark">List of Actions</h5>
					</div>
				</div>
				<hr>
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead class="thead-light">
							<tr>
								<th>#</th>
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
							<c:forEach items="${recipeDetailsList}" var="recipeDetail">
								<tr>
									<td>${recipeDetail.stepNo}</td>
									<td>${recipeDetail.mainAction.name}</td>
									<td>${recipeDetail.mainItemId}</td>
									<td>${recipeDetail.mainActionValueInGmsMl}</td>
									<td>${recipeDetail.mainActionDelayInMilliSeconds}</td>
									<td>${recipeDetail.flameLevel.percentage}</td>
									<td>${recipeDetail.parllelAction.name}</td>
									<td>${recipeDetail.parllelItemId}</td>
									<td>${recipeDetail.parllelActionValueInGmsMl}</td>
									<td>${recipeDetail.parllelActionDelayInMilliSeconds}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!--table End -->
			</div>
		         </div>
			</div>		
	<script>
	$(".my-2").click(function(){
		var burnerId = $("#burnerList").val();
	    var recipeId = $("#recipetype1").val();
		var  formData = "burner="+burnerId+"&recipe="+recipeId+"&stepNo=1";  //Name value Pair
	    //alert(formData);
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
	  	});
	
	$(".my-3").click(function(){
	    $.ajax({
  	        type: 'GET',
  	        url: "${pageContext.request.contextPath}/admin/stopCookingProcess",
  	        success: function(data){
  	        	alert(data);
  	        },
  	        error:function(jqXHR, textStatus, errorThrown){
  	        	alert('error '+errorThrown);
  	        }

  	    });
	  	});
	</script>		
