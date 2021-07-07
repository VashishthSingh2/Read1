<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
 <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-dark">Update Recipe</h5>
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
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Recipe Name" value="Chicken Curry">
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="form-group">
                        <label class="form-control-label" for="">Description</label>
                        <textarea class="form-control" id="" rows="3" placeholder="Enter Recipe Description">If your definition of comfort food is chicken curry and rice then you will know the importance it holds among millions and millions of people. Whether it is butter chicken, kadhai chicken, chicken tikka masala, home-made chicken korma or chicken gravy recipe, each dish is unique and caters to different taste buds. </textarea>
                      </div>
                    </div>
                   </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Type of Usage </label>
                        <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Frequent" selected="selected">Frequent</option>
                            <option value="Rare">Rare </option>
                            <option value="Moderate">Moderate</option>                
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
                    <button type="button" class="btn btn-warning my-2" data-dismiss="modal">Update Recipe</button>
                  </div>
                  </div>
               </form>
        </div>
      </div>
    </div>