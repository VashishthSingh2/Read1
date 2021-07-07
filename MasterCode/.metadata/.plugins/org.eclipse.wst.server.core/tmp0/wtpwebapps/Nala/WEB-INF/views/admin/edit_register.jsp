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
    var formObj = document.getElementById('burner.id');
    // Setting option as selected
    let len;
    for (let i = 0, len = formObj.length; i < len; i++){
        if (formObj[i].value =='${register.burner.id}') 
         formObj.options[i].selected = true;
    }
});
</script>
<h1>Nala Application!</h1>
<b>Edit Register:</b>
</br>
</br>
<form:form method="post" action="${pageContext.request.contextPath}/admin/updateRegister">
    <table>
    	<tr>
          <td></td>
          <td><form:hidden path = "id" value = '${register.id}' /></td>
        <tr>
        <tr>
            <td><form:label path="registerName">Register Name</form:label></td>
            <td><form:input path="registerName" value ='${register.registerName}' /></td>
        </tr>
        <tr>
        	<td>
        	Burner List
        	</td>
            <td>
            <select name="burner.id" id="burner.id">
    		<c:forEach items="${burnerList}" var="burner">
        		<option value="${burner.id}">${burner.name}</option>
    		</c:forEach>
			</select>
			</td>
        </tr>
         <tr>
            <td><form:label path="Sequence">Sequence</form:label></td>
            <td><form:input path="sequence" value ='${register.sequence}' /></td>
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
<a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/listRegisters">Registers</a>
</body>
</html>
