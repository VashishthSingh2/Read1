<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
 <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-dark">Update Station </h5>
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
                        <label class="form-control-label" for="">Name</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Station Name" value="Cook Station 1">
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Description</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Description" value="Cook Station Description">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Map to Burner </label>
                        <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Burner 1" selected="selected">Burner 1</option>
                            <option value="Burner 2">Burner 2</option>                 
                        </select>
                      </div>
                    </div>
                   </div>
                   <div class="row">
                    <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="">Map to Robot</label>
                        <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Robot 1" selected="selected">Robot 1</option>
                            <option value="Robot 2">Robot 2</option>                 
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="">Map to Fryer </label>
                        <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Fryer 1">Fryer 1</option>
                            <option value="Fryer 2" selected="selected">Fryer 2</option>                 
                        </select>
                      </div>
                    </div>
                    </div>
                     <div class="row">
                    <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="">Map to Liquid Bin </label>
                        <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Liquid Bin 1" selected="selected">Liquid Bin 1</option>
                            <option value="Liquid Bin 2">Liquid Bin 2</option>                 
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="">Map to Serving Station </label>
                        <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Serving Station 1">Serving Station 1</option>
                            <option value="Serving Station 2" selected="selected">Serving Station 2</option>                 
                        </select>
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                     <div class="form-group">
                        <label class="form-control-label" for="">Map to Holding Station </label>
                        <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Holding Station  1" selected="selected">Holding Station  1</option>
                            <option value="Holding Station  2">Holding Station  2</option>                 
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
                    <button type="button" class="btn btn-warning my-2" data-dismiss="modal">Update Station</button>
                  </div>
                  </div>
               </form>
        </div>
      </div>
    </div>