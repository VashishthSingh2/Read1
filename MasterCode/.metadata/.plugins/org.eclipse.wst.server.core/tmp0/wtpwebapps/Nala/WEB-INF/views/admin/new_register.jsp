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

<b>Add a new Register:</b>
</br>
</br>	
<form:form method="post" action="${pageContext.request.contextPath}/admin/saveRegister">
    <table>
        <tr>
            <td><form:label path="registerName">Register Name</form:label></td>
            <td><form:input path="registerName"/></td>
        </tr>
        <tr>
        	<td>
        	Burner List
        	</td>
            <td>
            <select name="burner.id">
    		<c:forEach items="${burnerList}" var="burner">
        		<option value="${burner.id}">${burner.name}</option>
    		</c:forEach>
			</select>
			</td>
        </tr>
        <tr>
            <td><form:label path="Sequence">Sequence</form:label></td>
            <td><form:input path="sequence"/></td>
        </tr>
        
        <tr>
            <td><br/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="save"></td>
        </tr>
    </table>
</form:form>
<a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/listRegisters">Registers</a>
</body>
</html>
