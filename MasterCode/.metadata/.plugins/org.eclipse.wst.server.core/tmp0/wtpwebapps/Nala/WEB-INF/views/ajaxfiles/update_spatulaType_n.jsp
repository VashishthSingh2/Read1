<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-dark">Update Spatula Type</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#editModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#editModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">
         <form:form method="post" id="spatulaTypeForm" name="spatulaTypeForm" action="${pageContext.request.contextPath}/admin/updateSpatulaType" enctype="multipart/form-data">
                <div class="row">
                  <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">ID</label>
                         <form:input type="text" path="id" class="form-control" value="${spatulaType.id}" disabled="disabled"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Spatula Type ID</label>
                         <form:input type="text" path="spatulaTypeUniqueId" class="form-control" placeholder="Enter Spatula Type ID" value="${spatulaType.spatulaTypeUniqueId}"/>
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Spatula Type Name</label>
                         <form:input type="text" path="name" class="form-control" placeholder="Enter Spatula Type Name" value="${spatulaType.name}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="isActive">Status</label>
                        <select name="status" id="status" class="custom-select">
                            <option value="">Select</option>
                            <option value="Active" selected="selected">Active</option>
                            <option value="Inactive">In Active </option> 
                        </select>
                      </div>
                    </div>
                  </div>
                <div class="row">
                    <div class="col-md-12">
                     <button type="button" class="btn btn-warning my-2" data-dismiss="modal" onclick="updateSpatulaType()">Update Spatula Type</button>
                  </div>
                  </div>
                <!-- Address -->
               </form:form>
        </div>
      </div>
    </div>