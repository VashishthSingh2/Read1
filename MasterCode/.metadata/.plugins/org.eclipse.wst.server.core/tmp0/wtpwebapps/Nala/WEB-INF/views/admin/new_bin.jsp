<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<h1>
    Nala Application!
</h1>

<b>Add a new Bin:</b>
</br>
</br>	
<form:form method="post" action="${pageContext.request.contextPath}/admin/saveBin">
    <table>
        <tr>
            <td><form:label path="name">Bin Name</form:label></td>
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
        	<td>
        	Ingredient
        	</td>
            <td>
            <select name="ingredient.id">
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
<a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/listBins">Bins</a>
</body>
</html>
