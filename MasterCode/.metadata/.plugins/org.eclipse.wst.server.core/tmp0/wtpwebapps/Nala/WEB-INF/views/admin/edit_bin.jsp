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
        if (formObj[i].value =='${bin.classificationType.id}') 
         formObj.options[i].selected = true;
    }
    
    var ingredientFormObj = document.getElementById('ingredient.id');
    // Setting option as selected
      for (let i = 0, len = ingredientFormObj.length; i < len; i++){
        if (ingredientFormObj[i].value =='${bin.ingredient.id}') 
        	ingredientFormObj.options[i].selected = true;
    }
});
</script>
<h1>Nala Application!</h1>
<b>Edit Bin:</b>
</br>
</br>
<form:form method="post" action="${pageContext.request.contextPath}/admin/updateBin">
    <table>
    	<tr>
          <td></td>
          <td><form:hidden path = "id" value = '${bin.id}' /></td>
        <tr>
        <tr>
            <td><form:label path="name">Bin Type Name</form:label></td>
            <td><form:input path="name" value ='${bin.name}' /></td>
        </tr>
        <tr>
            <td><form:label path="shortDescription">ShortDescription</form:label></td>
            <td><form:input path="shortDescription" value ='${bin.shortDescription}'/></td>
        </tr>
        <tr>
            <td><form:label path="description">Description</form:label></td>
            <td><form:input path="description" value ='${bin.description}'/></td>
        </tr>
        <tr>
            <td><form:label path="Sequence">Sequence</form:label></td>
            <td><form:input path="sequence" value ='${bin.sequence}' /></td>
        </tr>
        <tr>
        	<td>
        	Classification Type
        	</td>
            <td>
            <select name="classificationType.id" id="classificationType.id">
    		<c:forEach items="${classificationTypeList}" var="classificationType">
        		<option value="${classificationType.id}">${classificationType.name}</option>
    		</c:forEach>
			</select>
			</td>
        </tr>
        <tr>
        	<td>
        	Ingredient
        	</td>
            <td>
            <select name="ingredient.id" id="ingredient.id">
    		<c:forEach items="${ingredientList}" var="ingredient">
        		<option value="${ingredient.id}">${ingredient.name}</option>
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
</form:form>
<br/>
<a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/listBins">Bins</a>
</body>
</html>
