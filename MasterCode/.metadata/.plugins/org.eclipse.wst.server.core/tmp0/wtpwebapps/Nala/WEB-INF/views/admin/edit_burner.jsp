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

<b>Edit Burner:</b>
</br>
</br>
<form:form method="post" action="${pageContext.request.contextPath}/admin/updateBurner">
    <table>
    	<tr>
            <td></td>
            <td><form:hidden path = "id" value = '${burner.id}' /></td>
        <tr>
        <tr>
            <td><form:label path="name">Burner Name</form:label></td>
            <td><form:input path="name" value ='${burner.name}' /></td>
        </tr>
        <tr>
            <td><form:label path="description">Description</form:label></td>
            <td><form:input path="description" value ='${burner.description}'/></td>
        </tr>
        <tr>
            <td><form:label path="Sequence">Sequence</form:label></td>
            <td><form:input path="sequence" value ='${burner.sequence}' /></td>
        </tr>
        <tr>
            <td><br/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="save"></td>
        </tr>
    </table>
</form:form>
<a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/listBurners">Burners List</a>
</body>
</html>
