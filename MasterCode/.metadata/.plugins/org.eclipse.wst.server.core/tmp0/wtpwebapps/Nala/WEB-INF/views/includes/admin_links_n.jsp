<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Nala">
<link rel="icon" href="../assets/img/fav.png" type="image/png">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<!-- Custom fonts -->
<script src="https://kit.fontawesome.com/c0abd2a385.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles-->
<link rel='stylesheet' href='${pageContext.request.contextPath}/assets/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' href='${pageContext.request.contextPath}/assets/css/bootstrap-datepicker.css' type='text/css' media='all' />
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>