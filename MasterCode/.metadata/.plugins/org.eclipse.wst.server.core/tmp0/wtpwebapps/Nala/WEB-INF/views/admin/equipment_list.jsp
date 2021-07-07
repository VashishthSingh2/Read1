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
<h1>
    Nala Application!
</h1>
<script>
		function searchFunction(){
		var equipmentName= document.getElementById("name").value;
		var description= document.getElementById("description").value;
		if((equipmentName === null || equipmentName === '') && (description === null || description === ''))
		{
		    alert("Please enter any one of search fields")
		} else {
			window.location.href='${pageContext.request.contextPath}/admin/searchEquipment?name='+equipmentName+'&description='+description;
		}
	}
	</script>
	<b>Show the list of equipments in the database:</b>
	<table class="c">
	<tr><td>Equipment Name</td><td>Description</td></tr>
	<tr><td><input type="text" name="name" id="name"></td> <td><input type="text" name="description" id="description"></td><td><input type="button" onclick="searchFunction()" value="Search Equipment"></td></tr>
	</table>
		<display:table name="equipmentList" requestURI="${pageContext.request.contextPath}/admin/listEquipments"
			pagesize="5" export="false" sort="list" uid="one" class="its">
			<display:column property="name" title="Name" sortable="true"
				headerClass="sortable" href="${pageContext.request.contextPath}/admin/editEquipment" paramId="id" paramProperty="id"/>
			<display:column property="description" title="Description"
				sortable="true" headerClass="sortable" />
			<display:column property="sequence" title="Sequence" sortable="true"
				headerClass="sortable" />
			<display:column property="equipmentType.name" title="Equipment Type" sortable="true"
				headerClass="sortable" />
		</display:table>
	<br/>
	<a href="${pageContext.request.contextPath}/admin/homeAction">Home</a> | <a href="${pageContext.request.contextPath}/admin/newEquipment">New Equipment</a>
</body>
</html>
