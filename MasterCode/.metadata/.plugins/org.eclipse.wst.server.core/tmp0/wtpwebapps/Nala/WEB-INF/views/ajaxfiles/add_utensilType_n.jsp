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
          <h5 class="modal-title text-dark">Add Utensil Type</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#addModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#addModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
         
        </div>
        <div class="modal-body">
          <form:form method="post" id="utensilTypeForm" name="utensilTypeForm" action="${pageContext.request.contextPath}/admin/saveUtensilType"  enctype="multipart/form-data">
        
                <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Utensil Type ID</label>
                        <form:input type="text" path="typeid"  class="form-control" placeholder="Enter Utensil Type ID"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Utensil Type Name</label>
                        <form:input type="text" path="name"  class="form-control" placeholder="Enter Utensil Type Name"/>
                      </div>
                    </div>
                     <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Utensil Type Status</label>
                       <select name="status" id="status" class="custom-select mr-sm-2">
                            <option value="">Status</option>
                            <option value="Active">Active</option>
                            <option value="In Active">In Active</option>                 
                        </select>
                      </div>
                      
                    </div>         
                    </div>
                <div class="row">
                <div class="col-md-12">
                <input type="button" id="saveUtensilTypeButton" name="saveUtensilTypeButton" class="btn btn-primary my-2" data-dismiss="modal" value="Save UtensilType" onclick="saveUtensilType();">
                </div>
              </div>
               </form:form>
        </div>
      </div>
    </div>