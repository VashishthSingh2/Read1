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
          <h5 class="modal-title">View Utensil Details</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('body').removeClass('modal-open');$('#viewModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#viewModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
            
        </div>
        <div class="modal-body">
          <div class="table-responsive">
                <table class="table table-striped">
                   <tbody>
                    <tr>
                      <td><b>Utensil ID</b></td>
                      <td>${utensil.id}</td>
                    </tr>
                    <tr>
                      <td><b>Utensil Name</b></td>
                      <td>${utensil.name}</td>
                    </tr>
                   <tr>
                      <td><b>Description</b></td>
                      <td>${utensil.description} </td>
                    </tr>
                   <tr>
                      <td><b>Type</b></td>
                      <td>${utensil.utensilType}</td>
                    </tr>
                    <tr>
                      <td><b>Image</b></td>
                      <td><img src="data:image/jpg;base64,${image}" class="img-fluid" alt="Utensil" width="400" height="400"></td>
                    </tr>
                    <tr>
                      <td><b>Status</b></td>
                      <td>${utensil.status}</td>
                    </tr>
                    <tr>
                      <td><b>Created On</b></td>
                      <td>${utensil.createdDateTime}</td>
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