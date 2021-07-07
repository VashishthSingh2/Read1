<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
 <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-dark">Add Burner</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#addModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#addModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">
          <form class="">
                <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Name</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Burner Name">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Description</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Description">
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Map to Station</label>
                        <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Station 1">Station 1</option>
                            <option value="Station 2">Station 2</option>
                            <option value="Station 3">Station 3</option>                 
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Image</label>
                        <div class="input-group">
                          <div class="custom-file">
                            <input type="file" class="custom-file-input" id="image">
                            <label class="custom-file-label" for="image">Choose file</label>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                 <div class="row">
                <div class="col-md-12">
                <button type="button" class="btn btn-primary my-2" data-dismiss="modal">Add Burner</button>
                </div>
              </div>
            </form>
        </div>
      </div>
    </div>