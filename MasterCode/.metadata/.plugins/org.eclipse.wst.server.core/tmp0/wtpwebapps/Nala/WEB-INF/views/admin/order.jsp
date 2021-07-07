<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ page session="false" %> 
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Order Details</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- CSS CDN-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <%@include file="../includes/admin_links_n.jsp"%>
</head>
<body>
<div id="wrapper">
  <div id="content-wrapper" class="d-flex flex-column">
  <%@include file="../includes/adminHeader_n.jsp"%> 
      <div id="content">
       <div class="container-fluid">
          <div class="col-xl-12">
           <div class="card mb-4">
              <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="m-0 font-weight-bold text-dark">Recipe Order Process</h5>
                    </div>
                   </div>
                <hr>
            <form method="post" id="orderSearchForm" name="orderSearchForm" action="${pageContext.request.contextPath}/admin/searchOrder" onsubmit="return false;">
                  <div class="row">
                     <div class="col">
                      <input type="text" id="recipeSearchName" name="recipeSearchName"  class="form-control" placeholder="Enter Recipe Name"/>
                    </div>
                     <div class="col">
                      <select name="orderSearchStatus" id="orderSearchStatus" class="custom-select mr-sm-2">
                            <option value="">Status</option>
                            <option value="Order Booked">Order Booked</option>
                            <option value="In Kitchen">In Kitchen</option>
                            <option value="Packed">Packed</option>
                            <option value="Dispatched">Dispatched</option>                 
                        </select>
                    </div>
                     <div class="col">
                      <select name="sortBy" id="sortBy" class="custom-select mr-sm-2">
                      		<option value="">-Sort By-</option>
                            <option value="Recipe Name">Recipe Name</option>
                            <option value="Order Status">Order Status</option>      
                        </select>
                    </div>
                     <div class="col">
                      <select name="sortOrder" id="sortOrder" class="custom-select mr-sm-2">
                            <option value="">-Sort Order-</option>
                            <option value="Asc">Asc</option>
                            <option value="Desc">Desc</option>
                        </select>
                    </div>
                     <div class="col-lg-1 col-md-4 col-sm-6 mb-2">
                        <button class="btn btn-primary" type="button" id="" name="" data-toggle="tooltip" data-placement="top" title="Search" onclick="callAjx('sOrder',0,1)">
                          <i class="fas fa-search fa-sm"></i>
                         </button>
                    </div>
                  </div>
                 </form>
              <div class="input-group mb-3">
				  <select class="custom-select" id="recipe" name="recipe">
				  <c:forEach items="${recipesList}" var="demoRecipes">
                          <option value="${demoRecipes.id}">${demoRecipes.recipeName}</option>
                   </c:forEach>
                    </select>
				  <div class="input-group-append">
				    <button class="btn btn-outline-primary" type="button" onclick="newOrder();">Order</button>
				  </div>
                  </div>
      
                  <div class="table-responsive" id="orderListGrid">
                  <div class="table-responsive">
					<table class="table table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>Order Id</th>
								<th>Recipe Name</th>
								<th>Status</th>
								<th>Wait Time</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orderList}" var="demoOrders">
							<tr>
							    <td>${demoOrders.id}</td>
								<td>${demoOrders.recipeName}</td>
								<td>${demoOrders.status}</td>
								<td>${demoOrders.waitingTime} minutes</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
			    </div> <!--tablle End -->
				<div class="row listing-table">
                <div class="col-sm-12 col-md-5"><div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing ${startNo} to <c:choose><c:when test="${totalSize ge endNo}">${endNo}</c:when><c:otherwise>${totalSize}</c:otherwise></c:choose> of ${totalSize} entries</div></div>
                <div class="col-sm-12 col-md-7">
                <nav aria-label="...">
                   <ul class="pagination">
                   	<c:if test="${pno!=1}" ><li class="page-item"><a class="page-link" href="#" tabindex="-1"  onclick="callAjx('sOrder',0,1);">Start</a></li></c:if>
                    <c:choose><c:when test="${pno==1}" ><li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" >Previous</a></li></c:when>
                    <c:otherwise><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sSpatula',0,${pno-1});" tabindex="-1" >Previous</a></li></c:otherwise></c:choose>
					<c:if test="${(pno>4) && ((pno-2)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sSpatula',0,${pno-4})">${pno-4}</a></li></c:if>
					<c:if test="${(pno>3) && ((pno-1)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sOrder',0,${pno-3})">${pno-3}</a></li></c:if>
					<c:if test="${(pno>2) && ((pno-2)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sOrder',0,${pno-2})">${pno-2}</a></li></c:if>
					<c:if test="${(pno>1) && ((pno-1)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sOrder',0,${pno-1})">${pno-1}</a></li></c:if>
					<li class="page-item active"><a class="page-link" href="#">${pno}<span class="sr-only">(current)</span></a></li>
					<c:if test="${(pno+1)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sOrder',0,${pno+1})">${pno+1}</a></li></c:if>
					<c:if test="${(pno+2)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sOrder',0,${pno+2})">${pno+2}</a></li></c:if>
					<c:if test="${(pno+3)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sOrder',0,${pno+3})">${pno+3}</a></li></c:if>
					<c:if test="${(pno+4)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sOrder',0,${pno+4})">${pno+4}</a></li></c:if>
					<c:choose><c:when test="${noOfPages<=pno}" ><li class="page-item disabled"><a class="page-link" href="#">Next</a></li></c:when>
					<c:otherwise><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sOrder',0,${pno+1})">Next</a></li></c:otherwise></c:choose>
					<c:if test="${noOfPages>pno}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sOrder',0,${noOfPages});">End</a></li></c:if>
                  </ul>
                </nav>
                </div>
             	</div>
				</div>
				
			  </div>
			   </div>
        </div>
      </div><!-- /.container-fluid -->
      </div><!-- End of Main Content -->
    </div><!-- End of Content Wrapper -->
</div><!-- End of Page Wrapper -->
<!-- Scripts-->
<script>
function newOrder() {
	try {
		var id =$('#recipe').val();
		if (id == undefined || id == 'undefined' || id == '') {
			alert("Please select Recipe");
		} else {
			$.ajax({
	  	        type: 'GET',
	  	        url: "${pageContext.request.contextPath}/admin/newOrder/"+id,
	  	        success: function(data){
	  	        	$('#orderListGrid').html(data);
	  	        },
	  	        error:function(jqXHR, textStatus, errorThrown){
	  	        	alert('error '+errorThrown);
	  	        }

	  	    });
		}
	} catch (e) {
		return false;
	}
}

var timeout = setInterval(reloadOrders, 10000);    
function reloadOrders () {
	var surl = '&ajax=true';
	var id=0;
	var pno=1;
	recipeSearchName = trim($('#recipeSearchName').val()), orderSearchStatus = trim($('#orderSearchStatus').val()),
	sortBy = trim($('#sortBy').val()), sortOrder = trim($('#sortOrder').val()),
	fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
	if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
	if(recipeSearchName!=undefined && recipeSearchName!='undefined' && recipeSearchName!=''){ surl += '&recipeSearchName='+recipeSearchName; }
	if(orderSearchStatus!=undefined && orderSearchStatus!='undefined' && orderSearchStatus!=''){ surl += '&orderSearchStatus='+orderSearchStatus; }
	if(sortBy!=undefined && sortBy!='undefined' && sortBy!=''){ surl += '&sortBy='+sortBy; }
	if(sortOrder!=undefined && sortOrder!='undefined' && sortOrder!=''){ surl += '&sortOrder='+sortOrder; }
	if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
	if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
	$.ajax({ url: 'list-orders?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#orderListGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
}
</script>
<%@include file="../includes/adminFooter_n.jsp"%>
</body>
</html>
