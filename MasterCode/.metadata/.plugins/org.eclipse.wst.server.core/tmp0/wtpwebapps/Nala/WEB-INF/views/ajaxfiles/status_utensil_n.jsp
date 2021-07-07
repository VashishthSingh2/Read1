<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-danger">Warning Message</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#activeModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#activeModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
         <c:set var="utensilStatus" value="${utensil.status}" />
                       <c:choose>
                       	<c:when test = "${utensilStatus == 'Active'}">
                       	 <div class="modal-body">Are You Sure Want To Inactive this Entry ?</div>
                       	</c:when>
                       	<c:otherwise>
            				<div class="modal-body">Are You Sure Want To Active this Entry?</div>
         				</c:otherwise>
                       </c:choose> 
        <div class="modal-footer">
          <button class="btn btn-danger" type="button" data-dismiss="modal" onclick="$('#activeModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#activeModal').addClass('bg-blur');">No</button>
          <button class="btn btn-success" type="button" onclick="updateUtensilStatus('${utensil.id}')">Yes</button>
         </div>
      </div>
</div>