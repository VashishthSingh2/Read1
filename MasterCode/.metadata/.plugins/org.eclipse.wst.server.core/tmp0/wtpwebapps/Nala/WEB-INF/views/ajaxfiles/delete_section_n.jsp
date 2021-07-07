
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
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#deleteModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#deleteModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">Are You Sure Want To Delete this Entry ?</div>
        <div class="modal-footer">
        <form:form method="post" id="deleteSectionForm" name="deleteSectionForm" action="${pageContext.request.contextPath}/admin/deleteSection">
          <form:input type="hidden" path="id" id="id" class="form-control" value="${section.id}"/>
          <button class="btn btn-danger" type="button" data-dismiss="modal" onclick="$('#deleteModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#deleteModal').addClass('bg-blur');">No</button>
           <button class="btn btn-success" type="button" onclick="deleteSection();">Yes</button>
        </form:form>
        </div>
   </div>
</div>