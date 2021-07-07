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
        
        <div class="table-data">
            <div class="table-responsive">
		<table class="table table-bordered mtop30">
  <thead>
    <tr>
      <th>Robo</th>
      <th>Burner</th>
      <th>Action</th>
      <th>Bin</th>
      <th>Qty</th>
      <th>Time</th>
      <th>Flame</th>
      <th>Read/Write</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <select class="form-control" name="robo" id="robo">
            <option value="robo1" >Robo 1</option>
            <option value="robo2">Robo 2</option>
            <option value="robo3">Robo 3</option>
            <option value="robo4">Robo 4</option>
          </select>
        </td>
      <td>
        <select class="form-control" name="burner" id="burner">
            <option value="burner1">Burner 1</option>
            <option value="burner2">Burner 2</option>
            <option value="burner3">Burner 3</option>
            <option value="burner4">Burner 4</option>
          </select>
        </td>
      <td>
        <select class="form-control" name="actionName" id="actionName">
            <option value="UTENSIL_PICK">UTENSIL PICK</option>
            <option value="SPATULA_PICK">SPATULA PICK</option>
            <option value="VEGG_PICKUP">VEGG PICKUP</option>
            <option value="SPICE_PICKUP">SPICE PICKUP</option>
            <option value="MEAT_PICKUP">MEAT PICKUP</option>
            <option value="TOSS_ACTION">TOSS ACTION</option>
            <option value="STIRR_ACTION">STIRR ACTION</option>
            <option value="SERVE_ACTION">SERVE ACTION</option>
            <option value="LIQUID_DISPENSING">LIQUID DISPENSING</option>
            <option value="VEGG_COLLECTION">VEGG COLLECTION</option>
            <option value="MEAT_COLLECTION">MEAT COLLECTION</option>
            <option value="SPICE_COLLECTION">SPICE COLLECTION</option>
            <option value="IGNITION">IGNITION</option>
            <option value="DELAY_ACTION">DELAY ACTION</option>
            <option value="FRYER_PICKUP">FRYER PICKUP</option>
            <option value="FRYER_ACTION">FRYER ACTION</option>
            <option value="FRYER_SERVE">FRYER SERVE</option>
          </select>
        </td>
      <td><form:input  path="bin" id="bin" name="bin" class="form-control" /></td>
      <td><form:input  path="qty" id="qty" name="qty" class="form-control" /></td>
      <td><form:input  path="time" id="time" name="time" class="form-control" /></td>
      <td>
        <select class="form-control" name="flame" id="flame">
            <option value="0">Ignition On</option>
            <option value="5">5%</option>
            <option value="10">10%</option>
            <option value="15">15%</option>
            <option value="20">20%</option>
            <option value="25">25%</option>
            <option value="30">30%</option>
            <option value="35">35%</option>
            <option value="40">40%</option>
            <option value="45">45%</option>
            <option value="50">50%</option>
            <option value="55">55%</option>
            <option value="60">60%</option>
            <option value="65">65%</option>
            <option value="70">70%</option>
            <option value="75">75%</option>
            <option value="80">80%</option>
            <option value="85">85%</option>
            <option value="90">90%</option>
            <option value="95">95%</option>
            <option value="100">100%</option>
            <option value="0">Ignition Off</option>
          </select>
        </td>
      
      <td>
      <button type="submit" formaction="${pageContext.request.contextPath}/admin/writeRegsiters" class="btn btn-primary">Write</button>
      <button type="submit" formaction="${pageContext.request.contextPath}/admin/readRegsiters" class="btn btn-primary">Read</button>
        </td>
    </tr>
  </tbody>
</table>
            </div>
            </div>
        <div class="row">
            <div class="col-sm-6 border border-info">
                Read Data
                <br>
                <c:forEach var="registerDetail" items="${registerReadDetails}">
    			Register Address: ${registerDetail.key} - Value: ${registerDetail.value}
    			<br>
			   </c:forEach>
            </div>
            <div class="col-sm-6 border border-info">
                Write Data<br>
               <c:forEach var="registerDetail" items="${registerUpdateDetails}">
    			Register Address: ${registerDetail.key} - Value: ${registerDetail.value}
    			<br>
			   </c:forEach>
            </div>
        </div>
</div>

</form:form>
<%@include file="../includes/adminFooter_n.jsp"%>
</body>
</html>
