<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ page session="false" %> 
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Recipe Details</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- CSS CDN-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div id="wrapper">
  <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
       <div class="container-fluid">
          <div class="col-xl-12">
           <div class="card mb-4">
              <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="m-0 font-weight-bold text-dark">Recipe Preparation Process</h5>
                    </div>
                   </div>
                <hr>
                <form class="">
                <div class="row">
                     <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Burner Type</label>
                         <select class="custom-select mr-sm-2" id="burnerList" name="burnerList">
                          <option value="">Select</option>
                          <c:forEach items="${burnersList}" var="burner">
        						<option value="${burner.id}">${burner.name}</option>
    					</c:forEach>
                    </select>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Recipe Type</label>
                        <select class="custom-select mr-sm-2" id="recipetype1" name="recipetype1">
                          <option value="">Select</option>
                          <c:forEach items="${recipeList}" var="recipe">
        						<option value="${recipe.id}">${recipe.name}</option>
    					</c:forEach>
                    </select>
                      </div>
                    </div>
                    </div>
                    </form>
                  <div id="recipe-load">  
                  <div id="recipe-details1">
                  <div class="row">
                    <div class="col-lg-12">
                      <div class="form-group">
                        <label class="form-control-label" for="">Recipe Description</label>
                        <textarea class="form-control" id="" name="" rows="3" disabled="disabled">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</textarea>
                      </div>
                    </div>
                  </div>
                 <div class="row">
                    <div class="col-lg-12">
                      <div class="form-group">
                        <label class="form-control-label" for="">No.of Steps</label>
                        <input type="text" id="" name="" class="form-control" value="20" disabled="disabled">
                      </div>
                    </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-md-12">
                    <button type="button" class="btn btn-outline-success my-2">Start</button>
                    <button type="button" class="btn btn-outline-danger my-2">Stop</button>
                    <button type="button" class="btn btn-outline-info my-2">Prev</button>
                    <button type="button" class="btn btn-outline-warning my-2">Next</button>
                  </div>
                  </div>
                <!-- Address -->
              
             
			  <!-- Search End -->
			  <div id="onRecipeSelection">
				  <div class="card shadow mb-4" id="nextStep">
					  <div class="card-body">
						<div class="row">
						<div class="col">
							  <h5 class="m-0 font-weight-bold text-dark">Current Action</h5>
							</div>
						  </div><hr>
						  <div id="currentStepDetails">
						  <div class="row">
							<div class="col-lg-4">
							  <div class="form-group">
								<label class="form-control-label" for="">Current Step</label>
								<input type="text" id="" name="" class="form-control" placeholder="Enter Current Step" value="0">
							  </div>
							</div>
							 <div class="col-lg-4">
							  <div class="form-group">
								<label class="form-control-label" for="">Row Increment</label> <input
									type="text" id="" name="" class="form-control" value="0">
							  </div>
							</div>
							</div>
						<div class="table-responsive">
						
				  </div> <!--table End -->
				  </div>
				 </div>
			  </div> <!-- Card End -->
			  </div>
			  </div><!-- End of recipe-load -->
			  </div>
			   </div>
        </div>
      </div><!-- /.container-fluid -->
      </div><!-- End of Main Content -->
    </div><!-- End of Content Wrapper -->
</div><!-- End of Page Wrapper -->
<!-- Scripts-->
<script type="text/javascript">
$(document).ready(function(){
  $('#recipe-load').hide();
  $('#recipetype1').on('change',function(){
    if($(this).val()==''){
        $('#recipe-load').hide();
    }else if($("#burnerList").val()==''){
    	alert("Please Select Burner");
    	$('#recipetype1').val("");
    	return false;
    }else {
    	var recipeId = $(this).val();
    	alert(recipeId);
        $('#recipe-load').show();
        $.ajax({
  	        type: 'GET',
  	        url: "${pageContext.request.contextPath}/admin/getCookingProcessDetails/"+recipeId+"/0",
  	        success: function(data){
  	        	$('#recipe-load').html(data);
  	        },
  	        error:function(jqXHR, textStatus, errorThrown){
  	        	alert('error '+errorThrown);
  	        }

  	    });
    }
});
});
  </script>
</body>
</html>
