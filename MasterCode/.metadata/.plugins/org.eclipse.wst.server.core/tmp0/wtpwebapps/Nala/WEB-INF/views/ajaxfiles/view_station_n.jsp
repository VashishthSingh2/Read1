<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
 <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title">View Station Deatils</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="table-responsive">
                <table class="table table-striped">
                   <tbody>
                    <tr>
                      <td><b>Station ID</b></td>
                      <td>45</td>
                    </tr>
                    <tr>
                      <td><b>Station Name</b></td>
                      <td>Station 1</td>
                    </tr>
                   <tr>
                      <td><b>Description</b></td>
                      <td>Station Description</td>
                    </tr>
                    <tr>
                      <td><b>Mapped Burner</b></td>
                      <td>Burner 1</td>
                    </tr>
                    <tr>
                      <td><b>Mapped Robot</b></td>
                      <td>Robot 1</td>
                    </tr>
                    <tr>
                      <td><b>Mapped Fryer</b></td>
                      <td>Fryer 1</td>
                    </tr>
                    <tr>
                      <td><b>Mapped Liquid Bin</b></td>
                      <td>Liquid Bin 1</td>
                    </tr>
                    <tr>
                      <td><b>Mapped Serving Station</b></td>
                      <td>Serving Station 1</td>
                    </tr>
                    <tr>
                      <td><b>Mapped Holding Station</b></td>
                      <td>Holding Station 1</td>
                    </tr>
                   <tr>
                      <td><b>Image</b></td>
                      <td><img src="https://www.alpina-belgium.com/wp-content/uploads/2015/03/image001-1.jpg" class="img-fluid" alt="" width="400" height="400"></td>
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