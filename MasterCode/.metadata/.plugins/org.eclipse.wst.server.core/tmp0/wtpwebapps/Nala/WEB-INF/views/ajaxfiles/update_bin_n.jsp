<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-dark">Update Bin</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="$('#editModal').html('').css({display:'none'});$('.modal-backdrop').remove();$('#editModal').addClass('bg-blur');"> <span aria-hidden="true">&times;</span> </button>
        </div>
        <div class="modal-body">
          <form:form method="post" id="binForm" name="binForm" action="${pageContext.request.contextPath}/admin/updateBin" enctype="multipart/form-data">
            <div class="row">
                    <div class="col-lg-12">
                      <div class="form-group">
                        <label class="form-control-label" for="">Bin ID</label>
                        <form:input type="text" path="id" class="form-control" value="${bin.id}" disabled="disabled"/>
                      </div>
                    </div>
                   </div>
                <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Bin Name</label>
                       <form:input type="text" path="name" class="form-control" placeholder="Enter Bin Name" value="${bin.name}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Description</label>
                        <form:input type="text" path="description" class="form-control" placeholder="Enter Description" value="${bin.description}"/>
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Rack</label>
                        <select name="rack.id" id="rack.id" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <c:forEach items="${rackList}" var="rack">
                            <option value="${rack.id}">${rack.rackId}</option>
                            </c:forEach>                 
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Section </label>
                        <select name="section" id="section" class="custom-select mr-sm-2">
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
                        <form:input type="text" path="seqRack" class="form-control" placeholder="Enter Sequence" value="${bin.seqRack}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Min Volume (${volume})</label>
                        <form:input type="text" path="minVolume" class="form-control" placeholder="Enter Min Volume" value="${bin.minVolume}"/>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Max Volume (${volume})</label>
                        <form:input type="text" path="maxVolume" class="form-control" placeholder="Enter Max Volume" value="${bin.maxVolume}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Threshold Volume (${volume})</label>
                        <form:input type="text" path="thresholdVolume" class="form-control" placeholder="Enter Threshold Volume" value="${bin.thresholdVolume}"/>
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
                        <select name="ingredient.id" id="ingredient.id" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <c:forEach items="${ingredientList}" var="ingredient">
                            <option value="${ingredient.id}">${ingredient.name}</option>
                            </c:forEach>                     
                        </select>
                      </div>
                    </div>
                  </div>
                  <div id="ingredient-info">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Min Qty (${weight})</label>
                        <form:input type="text" path="minQty" class="form-control" value="${bin.minQty}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Max Qty (${weight})</label>
                        <form:input type="text" path="maxQty" class="form-control" value="${bin.maxQty}"/>
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Threshold Qty (${weight})</label>
                        <form:input type="text" path="thresholdQty" class="form-control" value="${bin.thresholdQty}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Present Qty (${weight})</label>
                        <form:input type="text" path="presentQty" class="form-control" placeholder="Enter Present Qty" value="${bin.presentQty}"/>
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Last Refilled Qty (${weight})</label>
                        <form:input type="text" path="lastRefilledQty" class="form-control" disabled="disabled" value="${bin.lastRefilledQty}"/>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Last Refilled Time</label>
                        <form:input type="text" path="lastRefilledDateTime" class="form-control" value="2020-01-11 09:45:33 hrs" disabled="disabled"/>
                      </div>
                    </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-md-12">
                    <button type="button" class="btn btn-warning my-2" data-dismiss="modal" onclick="updateBin();">Update Bin</button>
                  </div>
                  </div>
               </form:form>
        </div>
      </div>
    </div>
<script>
	var formObj = document.getElementById('rack.id');
    // Setting option as selected
    let len;
    for (let i = 0, len = formObj.length; i < len; i++){
        if (formObj[i].value =='${bin.rack.id}') 
         formObj.options[i].selected = true;
    }
    
 	var formObj = document.getElementById('ingredient.id');
    for (let i = 0, len = formObj.length; i < len; i++){
        if (formObj[i].value =='${bin.ingredient.id}') 
         formObj.options[i].selected = true;
    }
</script>