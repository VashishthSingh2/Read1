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
          <h5 class="modal-title text-dark">Add Fryer</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('body').removeClass('modal-open');$('#addModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#addModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>

        </div>
        <div class="modal-body">
           <form:form method="post" id="fryerForm" name="fryerForm" action="${pageContext.request.contextPath}/admin/saveFryer"  enctype="multipart/form-data">
          
          
                <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Name</label>
                        <form:input type="text" path="name"  class="form-control" placeholder="Enter Fryer Name"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Description</label>
                         <form:input type="text" path="description"  class="form-control" placeholder="Enter Description"/>
                      </div>
                    </div>
                    </div>
                     <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Map to Station</label>
                        <form:select name="mapToStation" id="mapToStation" path="mapToStation" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Station 1">Station 1</option>
                            <option value="Station 2">Station 2</option>                 
                         </form:select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="">Map to Robot</label>
                        <form:select name="mapToRobot" id="mapToRobot" path="mapToRobot" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Robot 1">Robot 1</option>
                            <option value="Robot 2">Robot 2</option>                 
                        </form:select>
                      </div>
                    </div>
                    </div>
                     <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Region 1</label>
                        <form:select name="region1" id="region1" path="region1" class="custom-select mr-sm-2">
                           <option value="">Select</option>
                            <option value="Veg">Veg</option>
                            <option value="Meat">Meat</option>            
                        </form:select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="">Region 2</label>
                        <form:select name="region2" id="region2" path="region2" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Veg">Veg</option>
                            <option value="Meat">Meat</option>                 
                        </form:select>
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Image</label>
                        <div class="input-group">
                          <div class="custom-file">
                            <form:input type="file" class="custom-file-input" id="image" name="image" path ="image" accept="image/*" />
                            <label class="custom-file-label" for="image">Choose file</label>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="isActive">Status</label>
                        <select name="status" id="status" class="custom-select">
                            <option value="">Select</option>
                            <option value="Active">Active</option>
                            <option value="In Active">In Active </option> 
                        </select>
                      </div>
                    </div>
                    
                  </div>
                 <div class="row">
                <div class="col-md-12">
                <input type="button" id="saveFryerButton" name="saveFryerButton" class="btn btn-primary my-2" data-dismiss="modal" value="Save Fryer" onclick="saveFryer();">
                </div>
              </div>
              </form:form>
        </div>
      </div>
    </div>