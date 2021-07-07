<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title">View Ingredient Details</h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('body').removeClass('modal-open');$('#viewModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#viewModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>

        </div>
        <div class="modal-body">
          <div class="table-responsive">
                <table class="table table-striped">
                   <tbody>
                    <tr>
                      <td><b>Ingredient ID</b></td>
                      <td>${ingredient.id}</td>
                    </tr>
                    <tr>
                      <td><b>Ingredient Name</b></td>
                      <td>${ingredient.name}</td>
                    </tr>
                    <tr>
                      <td><b>Ingredient Type</b></td>
                      <td>${ingredient.ingredientType}</td>
                    </tr>
                   <tr>
                      <td><b>Description</b></td>
                      <td>${ingredient.description}</td>
                    </tr>
                   <tr>
                      <td><b>Classification</b></td>
                      <td>${ingredient.ingredientClassificationType}</td>
                    </tr>
                    <tr>
                      <td><b>Type of Usage</b></td>
                      <td>${ingredient.ingredientTypeOfUsage}</td>
                    </tr>
                    <tr>
                      <td><b>Weight to Volume Rato</b></td>
                      <td>${ingredient.ingredientWeightToVolumeRatio}</td>
                    </tr>
                    <tr>
                      <td><b>Image</b></td>
                      <td><img src="data:image/jpg;base64,${image}" class="img-fluid" alt="Ingredient" width="400" height="400"></td>
                    </tr>
                    <tr>
                      <td><b>Status</b></td>
                      <td>${ingredient.status}</td>
                    </tr>
                    <tr>
                      <td><b>Created On</b></td>
                      <td>${ingredient.createdDateTime}</td>
                    </tr>
                  </tbody>
                </table>
             </div>
        </div>
        <div class="modal-footer">
 		<button class="btn btn-danger" type="button" data-dismiss="modal" onclick="$('body').removeClass('modal-open');$('#viewModal').html('').css({display:'none'});$('.modal-backdrop').css({display:'none'});$('#viewModal').addClass('bg-blur');">Close</button>
         </div>
      </div>
    </div>