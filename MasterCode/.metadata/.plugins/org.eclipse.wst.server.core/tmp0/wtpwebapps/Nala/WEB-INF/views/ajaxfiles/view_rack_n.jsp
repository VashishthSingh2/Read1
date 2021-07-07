<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
 <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title">View Rack Deatils</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#viewModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#viewModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">
          <div class="table-responsive">
                <table class="table table-striped">
                   <tbody>
                    <tr>
                      <td><b>Rack ID</b></td>
                      <td>${rack.id}</td>
                    </tr>
                    <tr>
                      <td><b>Rack Name</b></td>
                      <td>${rack.name}</td>
                    </tr>
                   <tr>
                      <td><b>Description</b></td>
                      <td>${rack.description}</td>
                    </tr>
                    <tr>
                      <td><b>Rack Type</b></td>
                      <td>${rack.rackType}</td>
                    </tr>
                    <tr>
                      <td><b>Rack ID</b></td>
                      <td>${rack.rackId}</td>
                    </tr>
                    <tr>
                      <td><b>Mapped Robot</b></td>
                      <td>${rack.maptoRobot}</td>
                    </tr>
                   <tr>
                      <td><b>Image</b></td>
                      <td><img src="https://www.softbankrobotics.com/emea/themes/custom/softbank/images/full-nao.png" class="img-fluid" alt="" width="400" height="400"></td>
                    </tr>
                    <tr>
                      <td><b>Status</b></td>
                      <td>${rack.status}</td>
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