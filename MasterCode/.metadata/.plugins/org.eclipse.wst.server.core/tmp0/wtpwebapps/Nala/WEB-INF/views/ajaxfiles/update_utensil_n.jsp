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
          <h5 class="modal-title text-dark">Update Utensil</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('body').removeClass('modal-open');$('#editModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#editModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">
           <form:form method="post" id="utensilForm" name="utensilForm" action="${pageContext.request.contextPath}/admin/updateUtensil" enctype="multipart/form-data">

                <div class="row">
                  <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">ID</label>
                        <form:input type="text" path="id"  class="form-control" value="${utensil.id}" disabled="disabled"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Name</label>
                        <form:input type="text" path="name" class="form-control" placeholder="Enter Utensil Name" value="${utensil.name}"/>
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Description</label>
                        <form:input type="text" path="description" class="form-control" placeholder="Enter Description" value="${utensil.description}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Type </label>
                        <select name="utensilType" id="utensilType" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                           <!--   <option value="Utensil Type1" selected="selected">Utensil Type1</option>
                           <c:if test="${utensil.utensilType}==${utensilType.name}">selected="selected"</c:if>
                           --> 
                            	
                            <c:forEach items="${utensilTypeList}" var="utensilType">
        					<option value="${utensilType.name}" <c:if test="${utensil.utensilType == utensilType.name}">selected="selected" </c:if> > ${utensilType.name}</option>
    						</c:forEach>
    						                
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
                            <input type="file" class="custom-file-input" id="image" name="image" accept="image/*">
                            <label class="custom-file-label" for="image">Choose file</label>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Status</label>
                        <select name="status" id="status" class="custom-select">
                            <option value="">Select</option>
                            <option value="Active" <c:if test="${utensil.status == 'Active'}">selected="selected" </c:if>>Active</option>
                            <option value="In Active" <c:if test="${utensil.status == 'In Active'}">selected="selected" </c:if>>In Active</option> 
                        </select>
                      </div>
                    </div>
                    
                 </div>
       
                 <div class="row">
                    <div class="col-md-12">
                    <button type="button" class="btn btn-warning my-2" data-dismiss="modal" onclick="updateUtensilSubmit();">Update Utensil</button>
                  </div>
                  </div>
                <!-- Address -->
              </form:form>
        </div>
      </div>
    </div>