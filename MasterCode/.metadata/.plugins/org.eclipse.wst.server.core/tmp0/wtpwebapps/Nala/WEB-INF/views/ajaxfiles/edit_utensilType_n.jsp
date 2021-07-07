<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
 <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-dark">Update Utensil Type</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <form class="">
                <div class="row">
                  <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">ID</label>
                        <input type="text" id="" name="" class="form-control" value="213" disabled="disabled">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Utensil Type ID</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Utensil Type ID" value="CK13">
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="form-group">
                        <label class="form-control-label" for="">Utensil Type Name</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Utensil Type Name" value="Chopping Knife">
                      </div>
                    </div>
                  </div>
                <div class="row">
                    <div class="col-md-12">
                    <button type="button" class="btn btn-warning my-2" data-dismiss="modal">Update Utensil Type</button>
                  </div>
                  </div>
               </form>
        </div>
      </div>
    </div>