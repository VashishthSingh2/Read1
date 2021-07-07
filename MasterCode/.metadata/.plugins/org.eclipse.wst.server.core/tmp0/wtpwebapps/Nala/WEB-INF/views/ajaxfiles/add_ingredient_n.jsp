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
          <h5 class="modal-title text-dark">Add Ingredient</h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('body').removeClass('modal-open');$('#addModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#addModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">
           <form:form method="post" id="ingredientForm" name="ingredientForm" action="${pageContext.request.contextPath}/admin/saveIngredient"  enctype="multipart/form-data">
 
                <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Name</label>
                        <form:input type="text" path="name"  class="form-control" placeholder="Enter Ingredient Name"/>
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
                        <label class="form-control-label" for="">Classification </label>
                        <form:select name="ingredientClassificationType" id="ingredientClassificationType" path="ingredientClassificationType" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Veg">Veg</option>
                            <option value="Meat">Meat</option>
                            <option value="Spice">Spice</option>
                            <option value="Leaf">Leaf</option>
                            <option value="Paste">Paste</option>
                            <option value="Liquid">Liquid</option>                 
                        </form:select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label"  for="">Type of Usage </label>
                        <form:select name="ingredientTypeOfUsage" id="ingredientTypeOfUsage" path ="ingredientTypeOfUsage" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Frequent">Frequent</option>
                            <option value="Rare">Rare </option>
                            <option value="Moderate">Moderate</option>                
                        </form:select>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Weight to Volume Ratio</label>
                        <form:input type="text" id="" name="" path="ingredientWeightToVolumeRatio" class="form-control" placeholder="Enter Weight to Volume Ratio"/>
                      </div>
                    </div>
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
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Ingrident Type </label>
                         <form:select name="ingredientType" id="ingredientType" path ="ingredientType" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Solid Ingrident">Solid Ingrident</option>
                            <option value="Liquid Ingrident">Liquid Ingrident</option>
                        </form:select>
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
                    <input type="button" id="saveIngredientButton" name="saveIngredientButton" class="btn btn-primary my-2" data-dismiss="modal" value="Save Ingredient" onclick="saveIngredient();">
                    
                  </div>
                  </div>
               </form:form>
        </div>
      </div>
    </div>