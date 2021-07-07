<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.nala.util.DateHelper"%>
<!-- Footer -->
<footer class="sticky-footer bg-white">
  <div class="container my-auto">
    <div class="copyright text-center my-auto">
      <span>Copyright &copy;  Nala  <%=DateHelper.getCurrentYear()%></span>
    </div>
  </div>
</footer>
</div><!-- End of Content Wrapper -->
</div><!-- End of Page Wrapper -->
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>
<!-- Scripts-->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/custom.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>
<script>$(document).ready(function(){$('[data-toggle="tooltip"]').tooltip();});</script>
<div class="alert alert-loading" id="loading">
	<img src="<c:url value='/assets/img/loading-icon.gif' />" alt="loading" class="loading-icon" />
 	</div>
<div class="alert alert-success-empty fade" id="success">
<div class="alert-text">
  	<button type="button" class="close" onclick="$('#sMsg').html(''); $('#success').hide()">×</button>
  	<div id="sMsg"></div>
</div>
</div>
<div class="alert alert-danger-empty fade" id="failure">
	<div class="alert-text">
  	<button type="button" class="close" onclick="$('#eMsg').html(''); $('#failure').hide()">×</button>
  	<div id="eMsg"></div>
  	</div>
</div>