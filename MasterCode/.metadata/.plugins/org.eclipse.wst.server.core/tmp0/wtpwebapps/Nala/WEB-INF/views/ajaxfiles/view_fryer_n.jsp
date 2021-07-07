
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
          <h5 class="modal-title">View Fryer Details</h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('body').removeClass('modal-open');$('#viewModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#viewModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>

        </div>
        <div class="modal-body">
          <div class="table-responsive">
                <table class="table table-striped">
                   <tbody>
                    <tr>
                      <td><b>Fryer ID</b></td>
                      <td>${fryer.id}</td>
                    </tr>
                    <tr>
                      <td><b>Fryer Name</b></td>
                      <td>${fryer.name}</td>
                    </tr>
                   <tr>
                      <td><b>Description</b></td>
                      <td>${fryer.description}</td>
                    </tr>
                    <tr>
                      <td><b>Mapped Station</b></td>
                      <td>${fryer.mapToStation}</td>
                    </tr>
                    <tr>
                      <td><b>Mapped Robot</b></td>
                      <td>${fryer.mapToRobot}</td>
                    </tr>
                    <tr>
                      <td><b>Region 1</b></td>
                      <td>${fryer.region1}</td>
                    </tr>
                    <tr>
                      <td><b>Region 2</b></td>
                      <td>${fryer.region2}</td>
                    </tr>
                   <tr>
                      <td><b>Image</b></td>
                      <td><img src="data:image/jpg;base64,${image}" class="img-fluid" alt="fryer" width="400" height="400"></td>
                    </tr>
                    <tr>
                      <td><b>Status</b></td>
                      <td>${fryer.status}</td>
                    </tr>
                    <tr>
                      <td><b>Created On</b></td>
                      <td>${fryer.createdDateTime}</td>
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