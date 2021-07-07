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
    var formObj = document.getElementById('classificationType.id');

    // Setting option as selected
    let len;
    for (let i = 0, len = formObj.length; i < len; i++){
        if (formObj[i].value =='${ingredient.classificationType.id}') 
         formObj.options[i].selected = true;
    }
});

</script>
<h1>
    Nala Application!
</h1>

<b>Edit a new Ingredient:</b>
</br>
</br>
<form:form method="post" action="${pageContext.request.contextPath}/admin/updateIngredient">
    <table>
    	<tr>
              <td></td>
              <td><form:hidden path = "id" value = '${ingredient.id}' /></td>
            <tr>
        <tr>
            <td><form:label path="name">Recipe Type Name</form:label></td>
            <td><form:input path="name" value ='${ingredient.name}' /></td>
        </tr>
        <tr>
            <td><form:label path="shortDescription">ShortDescription</form:label></td>
            <td><form:input path="shortDescription" value ='${ingredient.shortDescription}'/></td>
        </tr>
        <tr>
            <td><form:label path="description">Description</form:label></td>
            <td><form:input path="description" value ='${ingredient.description}'/></td>
        </tr>
        <tr>
            <td><form:label path="Sequence">Sequence</form:label></td>
            <td><form:input path="sequence" value ='${ingredient.sequence}' /></td>
        </tr>
        <tr>
        	<td>
        	Classification Type
        	</td>
            <td>
            <select name="classificationType.id" id="classificationType.id">
    		<c:forEach items="${classificationTypeList}" var="classification">
        		<option value="${classification.id}">${classification.name}</option>
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
<a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/listIngredients">Ingredients</a>  
</form:form>
</body>
</html>
