<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ page session="false" %> 
<html> 
    <head>
        <title>Add Recepie</title>
<%@include file="../includes/admin_links_n.jsp"%>
        <style>
            .mtop30 {margin-top: 30px}
            tr th {font-weight: 500;font-size: 13px;padding: 2px;}
            tr td {padding: 2px !important;}
            tr th:last-child {min-width: 150px; }
            input, select { min-width: 120px !important; padding: 3px !important; height: 35px !important;}
        </style>
        
    </head>
<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">
    <div id="content-wrapper" class="d-flex flex-column">
		<%@include file="../includes/adminHeader_n.jsp"%> 
   <form:form method="post" action="">
    <div class="container">
        
        <div class="table-data">
            <div class="table-responsive">
		<table class="table table-bordered mtop30">
  <thead>
    <tr>
      <th>Recie</th>
      <th>Burner</th>
      <th>Cook</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <select class="form-control" name="recipeId" id="recipeId">
        	<option value=""> Select Recipe</option>
    		<c:forEach items="${demoRecipesList}" var="demoRecipes">
        		<option value="${demoRecipes.recipeId}">${demoRecipes.recipeName}</option>
    		</c:forEach>
          </select>
        </td>
      <td>
        <select class="form-control" name="burnerId" id="burnerId">
        	<option value=""> Select Burner</option>
    		<c:forEach items="${demoBurnersList}" var="demoBurners">
        		<option value="${demoBurners.burnerNo}">${demoBurners.name}</option>
    		</c:forEach>
          </select>
        </td>
      <td>
      <button type="button" id="cook" onclick="cookRecipe();" class="btn btn-primary">Execute</button>
      </td>
    </tr>
  </tbody>
</table>
            </div>
            </div>
</div>

</form:form>
<%@include file="../includes/adminFooter_n.jsp"%>
</body>
</html>
