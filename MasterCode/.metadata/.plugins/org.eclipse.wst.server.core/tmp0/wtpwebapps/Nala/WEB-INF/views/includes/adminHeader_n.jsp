<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<nav class="navbar navbar-expand-lg mb-4 bg-white shadow">
  <a class="navbar-brand" href="dashboard.html"><img class="img-fluid" src="${pageContext.request.contextPath}/assets/img/logo.png" alt="Logo"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="fa fa-bars"></span>
  </button>
  <div class="collapse navbar-collapse" id="main_nav">
    <ul class="navbar-nav ml-auto">
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'dashboard'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard"> Dashboard </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'recipeCooking'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/recipeCooking"> Recipe Cooking </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'cooking'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list-orders"> Order </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq '4BurnerCooking'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/startCooking"> 4 Burner Cooking </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'openStepExecuter'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/openStepExecuter"> Step Executer </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'openRegisterInfo'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/openRegisterInfo"> Register Testing </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'bins'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/rack-list-bins"> Bin </a></li>
         <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'racks'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list-racks"> Racks </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && (urlPage eq 'spatulas' || urlPage eq 'spatulaTypes') }">active</c:if> dropdown">
            <a class="nav-link  dropdown-toggle" href="${pageContext.request.contextPath}/admin/list-spatulas" data-toggle="dropdown"> Spatula </a>
            <ul class="dropdown-menu dropdown-menu-right">
              <li <c:if test="${not empty urlPage && urlPage eq 'spatulas' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/list-spatulas"> Spatula </a></li>
              <li <c:if test="${not empty urlPage && urlPage eq 'spatulaTypes' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/list-spatulaTypes"> Spatula Types</a></li>
            </ul>
        </li>
        <li class="nav-item <c:if test="${not empty urlPage && (urlPage eq 'utensils' || urlPage eq 'utensilTypes') }">active</c:if> dropdown">
            <a class="nav-link  dropdown-toggle" href="${pageContext.request.contextPath}/admin/list-utensils" data-toggle="dropdown"> Utensil </a>
            <ul class="dropdown-menu dropdown-menu-right">
              <li <c:if test="${not empty urlPage && urlPage eq 'utensils' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/list-utensils"> Utensils </a></li>
              <li <c:if test="${not empty urlPage && urlPage eq 'utensilTypes' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/list-utensilTypes"> Utensil Types</a></li>
            </ul>
        </li>
        <li class="nav-item <c:if test="${not empty urlPage && (urlPage eq 'stirs' || urlPage eq 'stirTypes') }">active</c:if> dropdown">
            <a class="nav-link  dropdown-toggle" href="${pageContext.request.contextPath}/admin/list-stirs" data-toggle="dropdown"> Stir </a>
            <ul class="dropdown-menu dropdown-menu-right">
              <li <c:if test="${not empty urlPage && urlPage eq 'stirs' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/list-stirs"> Stir </a></li>
              <li <c:if test="${not empty urlPage && urlPage eq 'stirTypes' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/list-stirTypes"> Stir Types</a></li>
            </ul>
        </li>
        <li class="nav-item <c:if test="${not empty urlPage && (urlPage eq 'tosses' || urlPage eq 'tossTypes') }">active</c:if> dropdown">
            <a class="nav-link  dropdown-toggle" href="${pageContext.request.contextPath}/admin/list-tosses" data-toggle="dropdown"> Toss </a>
            <ul class="dropdown-menu dropdown-menu-right">
              <li <c:if test="${not empty urlPage && urlPage eq 'tosses' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/list-tosses"> Toss </a></li>
              <li <c:if test="${not empty urlPage && urlPage eq 'tossTypes' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/list-tossTypes"> Toss Types</a></li>
            </ul>
        </li>
        <li class="nav-item <c:if test="${not empty urlPage && (urlPage eq 'bowls' || urlPage eq 'bowlTypes') }">active</c:if> dropdown">
            <a class="nav-link  dropdown-toggle" href="#" data-toggle="dropdown"> Registers </a>
            <ul class="dropdown-menu dropdown-menu-right">
              <li <c:if test="${not empty urlPage && urlPage eq 'bowls' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/openRegisterInfo"> Register </a></li>
            </ul>
        </li>
        <li class="nav-item <c:if test="${not empty urlPage && (urlPage eq 'bowls' || urlPage eq 'bowlTypes') }">active</c:if> dropdown">
            <a class="nav-link  dropdown-toggle" href="#" data-toggle="dropdown"> Bowl </a>
            <ul class="dropdown-menu dropdown-menu-right">
              <li <c:if test="${not empty urlPage && urlPage eq 'bowls' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/list-bowls"> Bowl </a></li>
              <li <c:if test="${not empty urlPage && urlPage eq 'bowlTypes' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/list-bowlTypes"> Bowl Types</a></li>
            </ul>
        </li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'burners'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list-burners"> Burner </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && (urlPage eq 'stations' || urlPage eq 'holdingStations' || urlPage eq 'servingStations') }">active</c:if> dropdown">
            <a class="nav-link  dropdown-toggle" href="${pageContext.request.contextPath}/admin/list-stations" data-toggle="dropdown"> Station </a>
            <ul class="dropdown-menu dropdown-menu-right">
              <li <c:if test="${not empty urlPage && urlPage eq 'stations' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/list-stations"> Stations </a></li>
              <li <c:if test="${not empty urlPage && urlPage eq 'holdingStations' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/list-holdingStations"> Holding Stations</a></li>
              <li <c:if test="${not empty urlPage && urlPage eq 'servingStations' }">class="active"</c:if> ><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/list-servingStations"> Serving Stations</a></li>
            </ul>
        </li>
       <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'sections'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list-sections"> Section </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'racks'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list-racks"> Rack </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'robots'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list-robots"> Robot </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'actions'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list-actions"> Action </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'orders'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list-orders"> Order </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'fryers'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list-fryers"> Fryer </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'ingredients'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/listIngredients"> Ingredients </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'recipies'}">active</c:if>"><a class="nav-link" href="${pageContext.request.contextPath}/admin/list-recipies"> Recipies </a></li>
        <li class="nav-item <c:if test="${not empty urlPage && urlPage eq 'update-password'}">active</c:if> dropdown">
            <a class="nav-link  dropdown-toggle" href="#" data-toggle="dropdown"> Account Info </a>
            <ul class="dropdown-menu dropdown-menu-right">
              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/#">Profile Details</a></li>
              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/update-password">Update Password</a></li>
              <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </ul>
        </li>
    </ul>
  </div>
</nav>
<input type="hidden" id="contextPath" name="contextPath" value="${pageContext.servletContext.contextPath}"/>