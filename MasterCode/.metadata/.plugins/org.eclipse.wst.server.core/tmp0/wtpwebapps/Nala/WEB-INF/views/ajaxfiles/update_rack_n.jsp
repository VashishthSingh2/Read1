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
          <h5 class="modal-title text-dark">Update Rack</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#editModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#editModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">
          <form:form method="post" id="rackForm" name="rackForm" action="${pageContext.request.contextPath}/admin/updateRack" enctype="multipart/form-data">
                <div class="row">
                  <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">ID</label>
                        <form:input type="text" path="id" name="id" class="form-control" value="${rack.id}" disabled="disabled"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Name</label>
                        <form:input  type="text" path="name" name="name" class="form-control" placeholder="Enter Rack Name" value="${rack.name}"/>
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Description</label>
                        <form:input type="text" path="description" name="description" class="form-control" placeholder="Enter Description" value="${rack.description}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Rack Type</label>
                        <select name="rackType" id="rackType" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Solid Rack" selected="selected">Solid Rack</option>
                            <option value="Liquid Rack">Liquid Rack</option>
                        </select>
                      </div>
                    </div>
                   </div>
                  <div class="row">
                      <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Rack ID</label>
                        <select name="rackId" id="rackId" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="1.1" selected="selected">1.1</option>
                            <option value="1.2">1.2</option>                 
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="">Map to Robot</label>
                        <select name="maptoRobot" id="maptoRobot" class="multiple-select custom-select mr-sm-2" multiple placeholder="select">
                            <option value="Robot 1" selected="selected">Robot 1</option>
                            <option value="Robot 2">Robot 2</option>                 
                        </select>
                      </div>
                    </div>
                    </div>
                  <div class="row">
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
                    <div class="col-md-12">
                    <button type="button" class="btn btn-warning my-2" data-dismiss="modal" onclick="updateRack()">Update Rack</button>
                  </div>
                  </div>
                <!-- Address -->
               </form:form>
        </div>
      </div>
    </div>