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
          <h5 class="modal-title text-dark">Add Bowl </h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close" onclick="$('#addModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#addModal').addClass('bg-blur');">    
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form:form method="post" id="bowlForm" name="bowlForm" action="${pageContext.request.contextPath}/admin/saveBowl" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Name</label>
                        <form:input type="text" path="name" class="form-control" placeholder="Enter Bowl Name"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Description</label>
                        <form:input type="text" path="description" class="form-control" placeholder="Enter Description"/>
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Bowl Type </label>
                        <select name="bowlType.id" id="bowlType" class="custom-select mr-sm-2">
                            <option value="">Select Bowl Type</option>
                            <c:forEach items="${bowlTypeList}" var="bowlType">
        						<option value="${bowlType.id}">${bowlType.name}</option>
    						</c:forEach>                 
                        </select>
                      </div>
                    </div>
                     <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Max Volume (Cubic Units)</label>
                        <input type="text" id="maxvolume" name="maxvolume" class="form-control" placeholder="Enter Max Volume">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                  <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Select Bowl Status</label>
                        <select name="status" id="status" class="custom-select mr-sm-2">
                            <option value="">Status</option>
                            <option value="Active">Active</option>
                            <option value="In Active">In Active</option>                
                    	</select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Image</label>
                        <div class="input-group">
                          <div class="custom-file">
                            <input type="file" class="custom-file-input" id="image" name="image" accept="image/*">
                            <label class="custom-file-label" for="image">Choose file</label>
                          </div>
                        </div>
                      </div>
                    </div>
 				 </div>
                 <div class="row">
                    <div class="col-md-12">
                    <button type="button" id="saveBowlButton" name="saveBowlButton" class="btn btn-primary my-2" data-dismiss="modal" onclick="saveBowl();">Add Bowl</button>
                  </div>
                  </div>
               </form:form>
        </div>
      </div>
    </div>