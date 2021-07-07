<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>New Ingredient</title>
</head>
<body>
<h1>
    Nala Application!
</h1>

<b>Add a new Ingredient:</b>
</br>
</br>
<form:form method="post" action="${pageContext.request.contextPath}/admin/saveIngredient">
    <table>
        <tr>
            <td><form:label path="name">Ingredient Name</form:label></td>
            <td><form:input path="name"/></td>
        </tr>
        
        <tr>
            <td><form:label path="shortDescription">Short Description</form:label></td>
            <td><form:input path="shortDescription"/></td>
        </tr>
        
        <tr>
            <td><form:label path="description">Description</form:label></td>
            <td><form:input path="description"/></td>
        </tr>
        <tr>
            <td><form:label path="Sequence">Sequence</form:label></td>
            <td><form:input path="sequence"/></td>
        </tr>
        <tr>
        	<td>
        	Classification Type
        	</td>
            <td>
            <select name="classificationType.id">
    		<c:forEach items="${classificationTypeList}" var="classificationType">
        		<option value="${classificationType.id}">${classificationType.name}</option>
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
<a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/listIngredients">Ingredients</a>
</body>
</html>
