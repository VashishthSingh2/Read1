<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ page session="false" %> 
<html> 
    <head>
        <title>Add Recepie</title>
<%@include file="../includes/admin_links_n.jsp"%>
        <style>
            .mtop30 {margin-top: 30px}
            tr th {font-weight: 500;font-size: 13px;padding: 2px;}
            tr td {padding: 2px !important;}
            tr th:last-child {min-width: 150px; }
            input, select { min-width: 120px !important; padding: 3px !important; height: 35px !important;}
        </style>
        
    </head>
<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">
    <div id="content-wrapper" class="d-flex flex-column">
		<%@include file="../includes/adminHeader_n.jsp"%> 
   <form:form method="post" action="">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 border border-info">
                Write Data<br>
                <c:forEach var="writeDetail" items="${writeDetails}">
    			Register Address: ${writeDetail.key} - Value: ${writeDetail.value}
    			<br>
			   </c:forEach>
            </div>
            <div class="col-sm-6 border border-info">
                Read Data<br>
               <c:forEach var="readDetail" items="${readDetails}">
    			Register Address: ${readDetail.key} - Value: ${readDetail.value}
    			<br>
			   </c:forEach>
            </div>
        </div>
</div>

</form:form>
<%@include file="../includes/adminFooter_n.jsp"%>
</body>
</html>
