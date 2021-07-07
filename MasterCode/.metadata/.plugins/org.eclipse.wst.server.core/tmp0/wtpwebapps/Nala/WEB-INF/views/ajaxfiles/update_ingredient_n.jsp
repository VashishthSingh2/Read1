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
          <h5 class="modal-title text-dark">Update Ingredient</h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('body').removeClass('modal-open');$('#editModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#editModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">
           <form:form method="post" id="ingredientForm" name="ingredientForm" action="${pageContext.request.contextPath}/admin/updateIngredient" enctype="multipart/form-data">

                <div class="row">
                  <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">ID</label>
                        <form:input type="text" path="id"  class="form-control" value="${ingredient.id}" disabled="disabled"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Name</label>
                        <form:input type="text" path="name" class="form-control" placeholder="Enter Ingredient Name" value="${ingredient.name}"/>
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Description</label>
                        <form:input type="text" path="description" class="form-control" placeholder="Enter Description" value="${ingredient.description}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Classification </label>
                        <select name="ingredientClassificationType" id="ingredientClassificationType" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Veg" <c:if test="${ingredient.ingredientClassificationType == 'Veg'}">selected="Veg" </c:if>>Veg</option>
                            <option value="Meat" <c:if test="${ingredient.ingredientClassificationType == 'Meat'}">selected="Meat" </c:if>>Meat</option>
                            <option value="Spice" <c:if test="${ingredient.ingredientClassificationType == 'Spice'}">selected="Spice" </c:if>>Spice</option>
                            <option value="Leaf" <c:if test="${ingredient.ingredientClassificationType == 'Leaf'}">selected="Leaf" </c:if>>Leaf</option>
                            <option value="Paste" <c:if test="${ingredient.ingredientClassificationType == 'Paste'}">selected="Paste" </c:if>>Paste</option>
                            <option value="Liquid" <c:if test="${ingredient.ingredientClassificationType == 'Liquid'}">selected="Liquid" </c:if>>Liquid</option>                                                                     
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Type of Usage </label>
                        <select name="ingredientTypeOfUsage" id="ingredientTypeOfUsage" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Frequent" <c:if test="${ingredient.ingredientTypeOfUsage == 'Frequent'}">selected="Frequent" </c:if>>Frequent</option>
                            <option value="Rare" <c:if test="${ingredient.ingredientTypeOfUsage == 'Rare'}">selected="Rare" </c:if>>Rare</option>
                            <option value="Moderate" <c:if test="${ingredient.ingredientTypeOfUsage == 'Moderate'}">selected="Moderate" </c:if>>Moderate</option>
                                       
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Weight to Volume Rato</label>
                         <form:input type="text" path="ingredientWeightToVolumeRatio" class="form-control" placeholder="Enter Ingredient Name" value="${ingredient.ingredientWeightToVolumeRatio}"/>
                      </div>
                    </div>
                  </div>

                 <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Ingrident Type </label>
                        <select name="ingredientType" id="ingredientType" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Solid Ingrident" <c:if test="${ingredient.ingredientType == 'Solid Ingrident'}">selected="selected" </c:if>>Solid Ingrident</option>
                            <option value="Liquid Ingrident" <c:if test="${ingredient.ingredientType == 'Liquid Ingrident'}">selected="selected" </c:if>>Liquid Ingrident</option>
                        </select>
                      </div>
                    </div>       
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Status</label>
                        <select name="status" id="status" class="custom-select">
                            <option value="">Select</option>
                            <option value="Active" <c:if test="${ingredient.status == 'Active'}">selected="selected" </c:if>>Active</option>
                            <option value="In Active" <c:if test="${ingredient.status == 'In Active'}">selected="selected" </c:if>>In Active</option> 
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
                 </div>
                 
                 <div class="row">
                    <div class="col-md-12">
                   <button type="button" class="btn btn-warning my-2" data-dismiss="modal" onclick="updateIngredientSubmit();">Update Ingredient</button>
                  </div>
                  </div>
                <!-- Address ingredientType -->
               </form:form>
        </div>
      </div>
    </div>