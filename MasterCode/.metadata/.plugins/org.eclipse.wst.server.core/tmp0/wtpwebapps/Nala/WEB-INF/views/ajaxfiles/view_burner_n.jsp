<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
 <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title">View Burner Details</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#viewModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#viewModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">
          <div class="table-responsive">
                <table class="table table-striped">
                   <tbody>
                    <tr>
                      <td><b>Burner ID</b></td>
                      <td>45</td>
                    </tr>
                    <tr>
                      <td><b>Burner Name</b></td>
                      <td>Burner 1</td>
                    </tr>
                   <tr>
                      <td><b>Description</b></td>
                      <td>Right side Burner 1</td>
                    </tr>
                   <tr>
                      <td><b>Mapped Station </b></td>
                      <td>Station 2</td>
                    </tr>
                    <tr>
                      <td><b>Image</b></td>
                      <td><img src="https://4.imimg.com/data4/TY/CV/MY-1101769/canteen-burner-medium-dlx-500x500.jpg" class="img-fluid" alt="" width="400" height="400"></td>
                    </tr>
                    <tr>
                      <td><b>Status</b></td>
                      <td>Active</td>
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
          <button class="btn btn-danger" type="button" data-dismiss="modal">Close</button>
         </div>
      </div>
    </div>