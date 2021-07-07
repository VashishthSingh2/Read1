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
	 if('${nextRecipeDetail}'!="" && '${nextRecipeDetail.stepNo}'!=1){
	 document.getElementById("executeRecipePreparationStep").submit();
	 }
 });
 </script> 
    
        <div class="clear"></div>
        <div class="table-data">
        <div class="table-responsive">

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
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${recipeDetailsList}" var="recipeDetail">
	<tr>
    	<td></td>
    	<td>${recipeDetail.mainAction.name}</td>
    	<td>${recipeDetail.mainAction.name}</td>
    	<td>${recipeDetail.mainActionValueInGmsMl}</td>
    	<td>${recipeDetail.mainActionDelayInMilliSeconds}</td>
    	<td>${recipeDetail.flameLevel.percentage}</td>
    	<td>${recipeDetail.parllelAction.name}</td>
    	<td>${recipeDetail.parllelAction.name}</td>
    	<td>${recipeDetail.parllelActionValueInGmsMl}</td>
    	<td>${recipeDetail.parllelActionDelayInMilliSeconds}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<form:form method="post" action="${pageContext.request.contextPath}/admin/adminexecuteRecipePreparationStep" id="executeRecipePreparationStep">
<table class="table table-bordered mtop30">
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
    </tr>
  </thead>
   <tbody>
	<tr>
    	<td>${nextRecipeDetail.stepNo}</td>
    	<td>${nextRecipeDetail.mainAction.name}</td>
    	<td>${nextRecipeDetail.mainAction.name}</td>
    	<td>${nextRecipeDetail.mainActionValueInGmsMl}</td>
    	<td>${nextRecipeDetail.mainActionDelayInMilliSeconds}</td>
    	<td>${nextRecipeDetail.flameLevel.percentage}</td>
    	<td>${nextRecipeDetail.parllelAction.name}</td>
    	<td>${nextRecipeDetail.parllelAction.name}</td>
    	<td>${nextRecipeDetail.parllelActionValueInGmsMl}</td>
    	<td>${nextRecipeDetail.parllelActionDelayInMilliSeconds}<input type="hidden" name="id" value ="${nextRecipeDetail.id}" class="form-control" /></td>
    </tr>
     </tbody>
</table>
<c:set var="stepNo" value="${nextRecipeDetail.stepNo}" />
<c:if test = "${stepNo==1}">
<input type="submit" value="Start">
</c:if>
</form:form>
     </div>
     </div>



</body> 
</html>
