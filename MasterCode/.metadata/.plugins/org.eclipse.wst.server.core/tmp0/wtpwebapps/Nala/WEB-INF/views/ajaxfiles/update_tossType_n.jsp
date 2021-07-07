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
          <h5 class="modal-title text-dark">Update Toss Type</h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#editModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#editModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">
          <form:form method="post" id="tossTypeForm" name="tossTypeForm" action="${pageContext.request.contextPath}/admin/updateTossType" enctype="multipart/form-data">

                <div class="row">
                  <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">ID</label>
                       <form:input type="text" path="id"  class="form-control" value="${tossType.id}" disabled="disabled"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Toss Type ID</label>
                        <form:input type="text" path="typeid"  class="form-control" value="${tossType.typeid}" disabled="disabled"/>
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Toss Type Name</label>
                        <form:input type="text" path="name" class="form-control" placeholder="Enter Toss Type Name" value="${tossType.name}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Toss Type Description</label>
                        <form:input type="text" path="description" class="form-control" placeholder="Enter Toss Type Description" value="${tossType.description}"/>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                  	<div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Select TossType Status</label>
                        <select name="status" id="status" class="custom-select mr-sm-2">
                            <option value="">Status</option>
                            <option value="Active" <c:if test="${tossType.status == 'Active'}">selected="selected" </c:if>>Active</option>
                            <option value="In Active" <c:if test="${tossType.status == 'In Active'}">selected="selected" </c:if>>In Active</option>                
                    	</select>
                      </div>
                    </div>
                  </div>
                <div class="row">
                    <div class="col-md-12">
                    <button type="button" class="btn btn-warning my-2" data-dismiss="modal" onclick="updateTossTypeSubmit();">Update Toss Type</button>
                    
                  </div>
                  </div>
               </form:form>
        </div>
      </div>
    </div>