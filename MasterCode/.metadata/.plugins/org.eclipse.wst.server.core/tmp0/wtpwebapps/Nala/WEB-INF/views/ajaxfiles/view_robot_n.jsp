<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
 <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title">View Robot Deatils</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="table-responsive">
                <table class="table table-striped">
                   <tbody>
                    <tr>
                      <td><b>Robot ID</b></td>
                      <td>45</td>
                    </tr>
                    <tr>
                      <td><b>Robot Name</b></td>
                      <td>Robot 1.0</td>
                    </tr>
                   <tr>
                      <td><b>Description</b></td>
                      <td>Robot Description placed here</td>
                    </tr>
                    <tr>
                      <td><b>Mapped Station</b></td>
                      <td>Station 1</td>
                    </tr>
                    <tr>
                      <td><b>Mapped Rack</b></td>
                      <td>Rack 1</td>
                    </tr>
                    <tr>
                      <td><b>Mapped Holding Station</b></td>
                      <td>Holding Station 1</td>
                    </tr>
                    <tr>
                      <td><b>Mapped Fryer</b></td>
                      <td>Fryer 1</td>
                    </tr>
                   <tr>
                      <td><b>Image</b></td>
                      <td><img src="https://www.softbankrobotics.com/emea/themes/custom/softbank/images/full-nao.png" class="img-fluid" alt="" width="400" height="400"></td>
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