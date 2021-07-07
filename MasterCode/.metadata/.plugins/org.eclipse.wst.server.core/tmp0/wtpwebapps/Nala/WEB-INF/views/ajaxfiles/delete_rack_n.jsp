<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-danger">Delete Entry</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Are You Sure Want To Delete this Entry ?</div>
        <form:form method="post" id="deleteRackForm" name="deleteRackForm" action="${pageContext.request.contextPath}/admin/deleteRack">
        <div class="modal-footer">
        <form:input type="hidden" path="id" id="id" class="form-control" value="${spatula.id}"/>
          <button class="btn btn-danger" type="button" data-dismiss="modal" onclick="$('#deleteModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#deleteModal').addClass('bg-blur');">No</button>
          <button class="btn btn-success" type="button" onclick="deleteRack()">Yes</button>
         </div>
          </form:form>
      </div>
    </div>