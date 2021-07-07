<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title">View Section Deatils</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#viewModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#viewModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">
          <div class="table-responsive">
                <table class="table table-striped">
                   <tbody>
                    <tr>
                      <td><b>Section ID</b></td>
                      <td>${section.id}</td>
                    </tr>
                    <tr>
                      <td><b>Section Name</b></td>
                      <td>${section.name}</td>
                    </tr>
                   <tr>
                      <td><b>Description</b></td>
                      <td>${section.description}</td>
                    </tr>
                   <tr>
                      <td><b>Image</b></td>
                      <td><img src="https://images-na.ssl-images-amazon.com/images/I/81gBzfUpG3L._SY606_.jpg" class="img-fluid" alt="" width="400" height="400"></td>
                    </tr>
                    <tr>
                      <td><b>Status</b></td>
                      <td>${section.status}</td>
                    </tr>
                    <tr>
                      <td><b>Created On</b></td>
                      <td>${section.createdDateTime}</td>
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