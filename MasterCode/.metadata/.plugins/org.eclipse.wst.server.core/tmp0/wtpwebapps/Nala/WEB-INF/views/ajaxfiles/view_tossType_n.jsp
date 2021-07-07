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
          <h5 class="modal-title">View Toss Type Deatils</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close" onclick="$('#viewModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#viewModal').addClass('bg-blur');">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="table-responsive">
                <table class="table table-striped">
                   <tbody>
                    <tr>
                      <td><b>Toss Type ID</b></td>
                      <td>${tossType.id}</td>
                    </tr>
                    <tr>
                      <td><b>Toss Type Name</b></td>
                      <td>${tossType.name}</td>
                    </tr>
                   <tr>
                      <td><b>Description</b></td>
                      <td>${tossType.description}</td>
                    </tr>
                    <tr>
                      <td><b>Status</b></td>
                      <td>${tossType.status}</td>
                    </tr>
                    <tr>
                      <td><b>Created On</b></td>
                      <td>Jul-22-2020 02:05 AM</td>
                    </tr>
                  </tbody>
                </table>
              </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-danger" type="button" data-dismiss="modal" onclick="$('#viewModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#viewModal').addClass('bg-blur');">Close</button>
         </div>
      </div>
    </div>