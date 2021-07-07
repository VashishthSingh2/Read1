
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
 <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-dark">Update Fryer </h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('body').removeClass('modal-open');$('#editModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#editModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>

        </div>
        <div class="modal-body">
          <form:form method="post" id="fryerForm" name="fryerForm" action="${pageContext.request.contextPath}/admin/updateFryer?id=${fryer.id}" enctype="multipart/form-data">
                <div class="row">
                  <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">ID</label>
                        <form:input type="text" path="id" class="form-control" placeholder="Enter Ingredient Name" disabled="disabled" value="${fryer.id}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Name</label>
                        <form:input type="text" path="name" class="form-control" placeholder="Enter Fryer Name" value="${fryer.name}"/>
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Description</label>
                        <form:input type="text" path="description" class="form-control" placeholder="Enter Description" value="${fryer.description}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Map to Station</label>
                        <select name="mapToStation" id="mapToStation" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Station 1" <c:if test="${fryer.mapToStation == 'Station 1'}">selected="Station 1" </c:if>>Station 1</option>
                            <option value="Station 2" <c:if test="${fryer.mapToStation == 'Station 2'}">selected="Station 2" </c:if>>Station 2</option>               
                        </select>
                      </div>
                    </div>
                   </div>
                   <div class="row">
                    <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="">Region 1</label>
                        <select name="region1" id="region1" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Veg" <c:if test="${fryer.region1 == 'Veg'}">selected="selected" </c:if>>Veg</option>
                            <option value="Meat" <c:if test="${fryer.region1 == 'Meat'}">selected="selected" </c:if>>Meat</option>
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="">Region 2</label>
                        <select name="region2" id="region2" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Veg" <c:if test="${fryer.region2 == 'Veg'}">selected="selected" </c:if>>Veg</option>
                            <option value="Meat" <c:if test="${fryer.region2 == 'Meat'}">selected="selected" </c:if>>Meat</option>                
                        </select>
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="">Map to Robot</label>
                        <select name="mapToRobot" id="mapToRobot" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Robot 1" <c:if test="${fryer.mapToRobot == 'Robot 1'}">selected="selected" </c:if>>Robot 1</option>
                            <option value="Robot 2" <c:if test="${fryer.mapToRobot == 'Robot 2'}">selected="selected" </c:if>>Robot 2</option>                   
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Image</label>
                        <div class="input-group">
                          <div class="custom-file">
                            <input type="file" class="custom-file-input" id="image">
                            <label class="custom-file-label" for="image">Choose file</label>
                          </div>
                        </div>
                      </div>
                    </div>
                    </div>
                     <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Status</label>
                        <select name="status" id="status" class="custom-select">
                            <option value="">Select</option>
                            <option value="Active" <c:if test="${fryer.status == 'Active'}">selected="selected" </c:if>>Active</option>
                            <option value="In Active" <c:if test="${fryer.status == 'In Active'}">selected="selected" </c:if>>In Active</option>
                        </select>
                      </div>
                    </div>
                  </div>
                 <div class="row">
                    <div class="col-md-12">
                    <button type="button" class="btn btn-warning my-2" data-dismiss="modal" onclick="updateFryerSubmit();">Update Fryer</button>
                  </div>
                  </div>
               </form:form>
        </div>
      </div>

    </div>