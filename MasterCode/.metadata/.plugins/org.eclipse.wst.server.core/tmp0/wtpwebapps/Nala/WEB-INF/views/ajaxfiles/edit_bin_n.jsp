<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
 <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-dark">Update Bin</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <form class="">
            <div class="row">
                    <div class="col-lg-12">
                      <div class="form-group">
                        <label class="form-control-label" for="">Bin ID</label>
                        <input type="text" id="" name="" class="form-control" value="213" disabled="disabled">
                      </div>
                    </div>
                   </div>
                <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Bin Name</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Bin Name" value="VB1">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Description</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Description" value="Vegetable Bin 1">
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Rack </label>
                        <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="1.1" selected="selected">1.1</option>
                            <option value="1.2">1.2</option>                 
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Section </label>
                        <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Veg" selected="selected">Veg</option>
                            <option value="Meat">Meat </option> 
                            <option value="Spice">Spice </option>  
                            <option value="Liq">Liq</option>                 
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Seq in Rack</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Sequence" value="1">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Min Volume</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Min Volume" value="24">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Max Volume</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Max Volume" value="34">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Threshold Volume</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Threshold Volume" value="65">
                      </div>
                    </div>
                    </div>
                    <div class="row">
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
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Ingredient</label>
                        <select name="ingredient" id="ingredient" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Carrot" selected="selected">Carrot Dice</option>
                            <option value="Beans">Beans </option> 
                            <option value="Onion">Onion Slice </option>  
                        </select>
                      </div>
                    </div>
                  </div>
                  <div id="ingredient-info">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Min Qty</label>
                        <input type="text" id="" name="" class="form-control" value="46">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Max Qty</label>
                        <input type="text" id="" name="" class="form-control" value="53">
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Threshold Qty</label>
                        <input type="text" id="" name="" class="form-control" value="64">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Present Qty</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Present Qty" value="24">
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Last Refilled Qty</label>
                        <input type="text" id="" name="" class="form-control" value="324" disabled="disabled" value="42">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Last Refilled Time</label>
                        <input type="text" id="" name="" class="form-control" value="2020-01-11 09:45:33 hrs" disabled="disabled">
                      </div>
                    </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-md-12">
                    <button type="button" class="btn btn-warning my-2" data-dismiss="modal">Update Bin</button>
                  </div>
                  </div>
               </form>
        </div>
      </div>
    </div>