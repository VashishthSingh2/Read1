<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title">View Bin Deatils</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#viewModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#viewModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">
          <div class="table-responsive">
                <table class="table table-striped">
                   <tbody>
                    <tr>
                      <td><b>Bin ID</b></td>
                      <td>${bin.id}</td>
                    </tr>
                    <tr>
                      <td><b>Bin Name</b></td>
                      <td>${bin.name}</td>
                    </tr>
                   <tr>
                      <td><b>Description</b></td>
                      <td>${bin.description} </td>
                    </tr>
                   <tr>
                      <td><b>Rack</b></td>
                      <td>${bin.rack.rackId}</td>
                    </tr>
                      <tr>
                      <td><b>Section</b></td>
                      <td>${bin.section}</td>
                    </tr>
                    <tr>
                      <td><b>Seq in Rack</b></td>
                      <td>${bin.seqRack}</td>
                    </tr>
                    <tr>
                      <td><b>Min Volume</b></td>
                      <td>${bin.minVolume}</td>
                    </tr>
                    <tr>
                      <td><b>Max Volume</b></td>
                      <td>${bin.maxVolume}</td>
                    </tr>
                    <tr>
                      <td><b>Threshold Volume</b></td>
                      <td>${bin.thresholdVolume}</td>
                    </tr>
                    <tr>
                      <td><b>Ingredient</b></td>
                      <td>${bin.ingredient.name}</td>
                    </tr>
                    <tr>
                      <td><b>Min Qty</b></td>
                      <td>${bin.minQty}</td>
                    </tr>
                    <tr>
                      <td><b>Max Qty</b></td>
                      <td>${bin.maxQty}</td>
                    </tr>
                    <tr>
                      <td><b>Threshold Qty</b></td>
                      <td>${bin.thresholdQty}</td>
                    </tr>
                    <tr>
                      <td><b>Present Qty</b></td>
                      <td>${bin.presentQty}</td>
                    </tr>
                    <tr>
                      <td><b>Last Refilled Qty</b></td>
                      <td>${bin.lastRefilledQty}</td>
                    </tr>
                    <tr>
                      <td><b>Last Refilled Time</b></td>
                      <td>2020-01-11 09:45:33 hrs</td>
                    </tr>
                    <tr>
                      <td><b>Image</b></td>
                      <td><img src="https://www.muenzer.at/files/cto_layout/img/07-Gastro/Sammlung.jpg" class="img-fluid" alt="Bin" width="400" height="400"></td>
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
          <button class="btn btn-danger" type="button" data-dismiss="modal" onclick="$('#viewModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#viewModal').addClass('bg-blur');">Close</button>
         </div>
      </div>
    </div>