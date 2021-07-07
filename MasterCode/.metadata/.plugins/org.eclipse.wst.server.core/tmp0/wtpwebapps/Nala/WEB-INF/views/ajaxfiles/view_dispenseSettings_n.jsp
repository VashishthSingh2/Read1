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
          <h5 class="modal-title">View Dispense Settings </h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('body').removeClass('modal-open');$('#viewModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#viewModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">
          <div class="table-responsive">
                <table class="table table-striped">
                   <tbody>
                    <tr>
                      <td><b>ID</b></td>
                      <td>${dispenseSettings.id}</td>
                    </tr>
                    <tr>
                      <td><b>Start</b></td>
                      <td>${dispenseSettings.start}</td>
                    </tr>
                   <tr>
                      <td><b>End</b></td>
                      <td>${dispenseSettings.end}</td>
                    </tr>
                   <tr>
                      <td><b>Bulk Feed %</b></td>
                      <td>${dispenseSettings.bulkFeedPercentage}</td>
                    </tr>
                    <tr>
                      <td><b>Gap Timer</b></td>
                      <td>${dispenseSettings.gapTimerSeconds}</td>
                    </tr>
                    <tr>
                      <td><b>Inch On Timer</b></td>
                      <td>${dispenseSettings.inchOnTimer}</td>
                    </tr>
                    <tr>
                      <td><b>Inch Off Timer</b></td>
                      <td>${dispenseSettings.inchOffTimer}</td>
                    </tr>
                    <tr>
                      <td><b>Cut Of %</b></td>
                      <td>${dispenseSettings.cutOfPercentage}</td>
                    </tr>
                    <tr>
                      <td><b>RPM</b></td>
                      <td>${dispenseSettings.RPM}</td>
                    </tr>
                    <tr>
                      <td><b>Status</b></td>
                      <td>${dispenseSettings.status}</td>
                    </tr>
                    <tr>
                      <td><b>Created On</b></td>
                      <td>${dispenseSettings.createdDateTime}</td>
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