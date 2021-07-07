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
          <h5 class="modal-title text-dark">Update Dispense Settings </h5>
		<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('body').removeClass('modal-open');$('#editModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#editModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>  
        </div>
        <div class="modal-body">
          <form:form method="post" id="dispenseSettingsForm" name="dispenseSettingsForm" action="${pageContext.request.contextPath}/admin/updateDispenseSettings?ingredientid=${ingredientid}" enctype="multipart/form-data">
                <div class="row">
                  <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">ID</label>
                        <form:input type="text" path="id"  class="form-control" value="${dispenseSettings.id}" disabled="disabled"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Start</label>
                        <form:input type="text" path="start" class="form-control" placeholder="Enter Start" value="${dispenseSettings.start}"/>
                      </div>
                    </div>
                    </div>
                   <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">End</label>
                        <form:input type="text" path="end" class="form-control" placeholder="Enter End" value="${dispenseSettings.end}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Bulk Feed (%)</label>
                         <form:input type="text" path="bulkFeedPercentage" class="form-control" placeholder="Enter Bulk Feed Percentage" value="${dispenseSettings.bulkFeedPercentage}"/>
                      </div>
                    </div>
                    </div>
                     <div class="row">
                      <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Gap Timer (Sec)</label>
                        <form:input type="text" path="gapTimerSeconds" class="form-control" placeholder="Enter Gap Timer (Seconds)" value="${dispenseSettings.gapTimerSeconds}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Inch On Timer</label>
                        <form:input type="text" path="inchOnTimer" class="form-control" placeholder="Enter Inch On Timer" value="${dispenseSettings.inchOnTimer}"/>
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Inch Off Timer</label>
                        <form:input type="text" path="inchOffTimer" class="form-control" placeholder="Enter Inch Off Timer" value="${dispenseSettings.inchOffTimer}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Cut Of (%)</label>
                        <form:input type="text" path="cutOfPercentage" class="form-control" placeholder="Enter Cut Of Percentage" value="${dispenseSettings.cutOfPercentage}"/>
                      </div>
                    </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">RPM</label>
                        <form:input type="text" path="RPM" class="form-control" placeholder="Enter RPM" value="${dispenseSettings.RPM}"/>
                      </div>
                      </div>
                     <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Status</label>
                        <select name="status" id="status" class="custom-select">
                            <option value="">Select</option>
                            <option value="Active" <c:if test="${dispenseSettings.status == 'Active'}">selected="selected" </c:if>>Active</option>
                            <option value="In Active" <c:if test="${dispenseSettings.status == 'In Active'}">selected="selected" </c:if>>In Active</option> 
                        </select>
                      </div>
                    </div>
                    
                    </div>
                 <div class="row">
                    <div class="col-md-12">
                    <button type="button" class="btn btn-warning my-2" data-dismiss="modal" onclick="updateDispenseSettingsSubmit();">Update Dispense Settings</button>
                  </div>
                  </div>
               </form:form>
        </div>
      </div>
    </div>