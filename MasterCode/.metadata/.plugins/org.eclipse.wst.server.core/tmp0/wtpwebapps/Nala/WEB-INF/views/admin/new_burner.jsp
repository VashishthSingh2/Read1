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

<b>Add a new Burner:</b>
</br>
</br>	
<form:form method="post" action="${pageContext.request.contextPath}/admin/saveBurner">
    <table>
        <tr>
            <td><form:label path="name">Burner Name</form:label></td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td><form:label path="description">Description</form:label></td>
            <td><form:input path="description"/></td>
        </tr>
        <tr>
            <td><form:label path="sequence">Sequence</form:label></td>
            <td><form:input path="sequence"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="save"></td>
        </tr>
    </table>
</form:form>
 <a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/listBurners">Burners List</a>
</body>
</html>
