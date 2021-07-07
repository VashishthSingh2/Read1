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

<b>Add a new Recipe Type:</b>
</br>
</br>
<form:form method="post" action="${pageContext.request.contextPath}/admin/updateRecipeType">
    <table>
    <tr>
              <td></td>
              <td><form:hidden path = "id" value = '${recipeType.id}' /></td>
            <tr>
        <tr>
            <td><form:label path="name">Recipe Type Name</form:label></td>
            <td><form:input path="name" value ='${recipeType.name}' /></td>
        </tr>
        <tr>
            <td><form:label path="shortDescription">ShortDescription</form:label></td>
            <td><form:input path="shortDescription" value ='${recipeType.shortDescription}'/></td>
        </tr>
        <tr>
            <td><form:label path="description">Description</form:label></td>
            <td><form:input path="description" value ='${recipeType.description}'/></td>
        </tr>
        <tr>
            <td><form:label path="Sequence">Sequence</form:label></td>
            <td><form:input path="sequence" value ='${recipeType.sequence}' /></td>
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
<a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/listRecipeTypes">Recipe Types</a>
</body>
</html>
