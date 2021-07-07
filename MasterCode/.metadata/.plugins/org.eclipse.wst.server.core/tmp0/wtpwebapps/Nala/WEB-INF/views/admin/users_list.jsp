<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<style><%@include file="/assets/css/alternative.css"%></style>
	<style><%@include file="/assets/css/displaytag.css"%></style>
	<style><%@include file="/assets/css/maven-base.css"%></style>
	<style><%@include file="/assets/css/maven-theme.css"%></style>
	<style><%@include file="/assets/css/print.css"%></style>
	<style><%@include file="/assets/css/screen.css"%></style>
	<style><%@include file="/assets/css/site.css"%></style>
	<style><%@include file="/assets/css/teststyles.css"%></style>
	<style>
		table.c {
  		table-layout: auto;
  		width: 20%;
  		}
  	</style>  
</head>
<body>
	<h1>Nala Application!</h1>
	<script>
		function searchFunction(){
		var actionName= document.getElementById("name").value;
		var description= document.getElementById("description").value;
		if((actionName === null || actionName === '') && (description === null || description === ''))
		{
		    alert("Please enter any one of search fields")
		} else {
			window.location.href='${pageContext.request.contextPath}/admin/searchAction?name='+actionName+'&description='+description;
		}
	}
	</script>
	Show the list of User:
	<table class="c">
	<tr><td>User Profile</td><td>Description</td></tr>
	<tr><td><input type="text" name="name" id="name"></td> <td><input type="text" name="description" id="description"></td><td><input type="button" onclick="searchFunction()" value="Search Action"></td></tr>
	</table>
		<display:table name="userList" requestURI="${pageContext.request.contextPath}/admin/listUsers"
			pagesize="10" export="false" sort="list" uid="one" class="its">
			
			<display:column property="ssoId" title="ssoId" sortable="true"
				headerClass="sortable" href="${pageContext.request.contextPath}/admin/editUserProfile" paramId="id" paramProperty="id"/>
			<display:column property="firstName" title="firstName"
				sortable="true" headerClass="sortable" />
			<display:column property="lastName" title="lastName" sortable="true"
				headerClass="sortable" />
			
		</display:table>
	<br/>
	<a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/newUser">New User</a>
</body>
</html>
