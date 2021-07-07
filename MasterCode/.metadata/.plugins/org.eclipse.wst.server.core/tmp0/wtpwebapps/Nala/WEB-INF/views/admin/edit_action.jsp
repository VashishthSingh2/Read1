<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>New Action</title>
</head>
<body>
<h1>
    Nala Application!
</h1>

<b>Add a new action:</b>
</br>
</br>

<script>
window.addEventListener("load", function () {
    
	var formObj = document.getElementById('actionType.id');
    // Setting option as selected
    let len;
    for (let i = 0, len = formObj.length; i < len; i++){
        if (formObj[i].value =='${action.actionType.id}') 
         formObj.options[i].selected = true;
    }
    
    var formObj = document.getElementById('classificationType.id');
    // Setting option as selected
    for (let i = 0, len = formObj.length; i < len; i++){
        if (formObj[i].value =='${action.classificationType.id}') 
         formObj.options[i].selected = true;
    }
});
</script>
<form:form method="post" action="${pageContext.request.contextPath}/admin/updateAction">
    <table>
         <tr>
              <td></td>
              <td><form:hidden path = "id" value = '${action.id}' /></td>
            </tr>
        <tr>
            <td><form:label path="name">Action Name</form:label></td>
            <td><form:input path="name" value='${action.name}'/></td>
        </tr>
        <tr>
            <td><form:label path="description">Description</form:label></td>
            <td><form:input path="description" value='${action.description}'/></td>
        </tr>
        <tr>
            <td><form:label path="Sequence">Sequence</form:label></td>
            <td><form:input path="sequence" value='${action.sequence}'/></td>
        </tr>
        <tr>
        	<td>
        	Action Type
        	</td>
            <td>
            <select name="actionType.id" id="actionType.id">
    		<c:forEach items="${actionTypeList}" var="actionType">
        		<option value="${actionType.id}">${actionType.name}</option>
    		</c:forEach>
			</select>
			</td>
        </tr>
        
        <tr>
        	<td>
        	Classification Type
        	</td>
            <td>
            <select name="classificationType.id" id="classificationType.id">
            <option value="" selected>--Select--</option>
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
</form:form>
<br/>
<a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/listActions">Actions</a>
</body>
</html>
