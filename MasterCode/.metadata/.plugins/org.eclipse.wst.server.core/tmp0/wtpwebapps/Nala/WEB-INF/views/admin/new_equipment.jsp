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

<b>Add a new Equipment:</b>
</br>
</br>	
<form:form method="post" action="${pageContext.request.contextPath}/admin/saveEquipment">
    <table>
        <tr>
            <td><form:label path="name">Equipment Name</form:label></td>
            <td><form:input path="name"/></td>
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
        	Equipment Type
        	</td>
            <td>
            <select name="equipmentType.id">
    		<c:forEach items="${equipmentTypeList}" var="equipmentType">
        		<option value="${equipmentType.id}">${equipmentType.name}</option>
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
<a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/listEquipments">Equipments</a>
</body>
</html>
