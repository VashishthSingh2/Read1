<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Home</title>
</head>
<body>

<script>
window.addEventListener("load", function () {
    var formObj = document.getElementById('recipeType.id');

    // Setting option as selected
    let len;
    for (let i = 0, len = formObj.length; i < len; i++){
        if (formObj[i].value =='${recipe.recipeType.id}') 
         formObj.options[i].selected = true;
    }
});

</script>
<h1>
    Nala Application!
</h1>

<b>Edit a new Recipe:</b>
</br>
</br>
<form:form method="post" action="${pageContext.request.contextPath}/admin/updateRecipe">
    <table>
    	<tr>
              <td></td>
              <td><form:hidden path = "id" value = '${recipe.id}' /></td>
            <tr>
        <tr>
            <td><form:label path="name">Recipe Type Name</form:label></td>
            <td><form:input path="name" value ='${recipe.name}' /></td>
        </tr>
        <tr>
            <td><form:label path="shortDescription">ShortDescription</form:label></td>
            <td><form:input path="shortDescription" value ='${recipe.shortDescription}'/></td>
        </tr>
        <tr>
            <td><form:label path="description">Description</form:label></td>
            <td><form:input path="description" value ='${recipe.description}'/></td>
        </tr>
        <tr>
            <td><form:label path="Sequence">Sequence</form:label></td>
            <td><form:input path="sequence" value ='${recipe.sequence}' /></td>
        </tr>
        <tr>
        	<td>
        	Recipe Type
        	</td>
            <td>
            <select name="recipeType.id" id="recipeType.id">
    		<c:forEach items="${recipeTypeList}" var="recipeType">
        		<option value="${recipeType.id}">${recipeType.name}</option>
    		</c:forEach>
			</select>
			</td>
        </tr>
        <tr>
            <td><br/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="save"></td>
        </tr>
    </table>
    <br/>
<a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/listRecipesDeatils?id=${recipe.id}">Add Or Edit Recipe Details</a> | <a href="./admin/listRecipePreparationSteps?id=${recipe.id}&stepNo=1">Add Or Edit Recipe Details</a> | <a href="./admin/listRecipes">Recipes</a>  
</form:form>
</body>
</html>
