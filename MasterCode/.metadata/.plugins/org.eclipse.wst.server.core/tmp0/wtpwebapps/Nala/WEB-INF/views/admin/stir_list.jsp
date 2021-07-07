<!DOCTYPE html>
<html lang="en">
<head>
<title>Stir List</title>
<meta name="keywords" content="#" />
<meta name="description" content="#" />
<%@include file="../includes/admin_links_n.jsp"%>
</head>
<!-- Head End -->
<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">
    <div id="content-wrapper" class="d-flex flex-column">
		<%@include file="../includes/adminHeader_n.jsp"%> 
      <div id="content">
      <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- Page Heading -->
          <div class="col-xl-12">
            <!-- Search Start -->
            <div class="card mb-4">
              <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="m-0 font-weight-bold text-dark">Stir List</h5>
                    </div>
                    <div class="col">
                        <a href="#" class="btn btn-warning btn-icon-split float-right" data-toggle="modal" data-target="#addModal" onclick="getStir();">
                          <span class="icon text-white-50"><i class="fas fa-plus" aria-hidden="true"></i></span>
                          <span class="text">Add Stir </span>
                        </a>
                      </div>
                  </div>
                <hr>
                <form method="post" class="" id="stirSearchForm" name="stirSearchForm" action="${pageContext.request.contextPath}/admin/searchStir" onsubmit="return false;">
                  <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <input type="text" id="stirSearchName" name="stirSearchName" class="form-control" placeholder="Enter Stir Name">
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <select name="stirSearchType" id="stirSearchType" class="custom-select mr-sm-2">
                            <option value="">Select Stir Type</option>
                            <c:forEach items="${stirTypeList}" var="stirType">
        					<option value="${stirType.name}">${stirType.name}</option>  
        					</c:forEach>                 
                        </select>
                    </div>
                     <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <select name="stirSearchStatus" id="stirSearchStatus" class="custom-select mr-sm-2">
                            <option value="">Status</option>
                            <option value="Active">Active</option>
                            <option value="In Active">In Active</option>                 
                        </select>
                    </div>
                     <div class="col-lg-1 col-md-4 col-sm-6 mb-2">
                        <button class="btn btn-primary" type="button" id="" name="" data-toggle="tooltip" data-placement="top" title="Search" onclick="callAjx('sStir',0,1)">
                          <i class="fas fa-search fa-sm"></i>
                         </button>
                    </div>
                  </div>
                </form>
              </div>
              </div> <!-- Search End -->
          <div class="card shadow mb-4">
              <div class="card-body" id="stirGrid">
                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead class="thead-dark">
                    <tr>
                      <th>Stir ID</th>
                      <th>Stir Name</th>
                      <th>Stir Type</th>
                      <th>Status</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                    <tbody>
                    <c:forEach items="${stirList}" var="stir">
                    <tr>
                      <td>${stir.id}</td>
                      <td>${stir.name} </td>
                      <td>${stir.stirType.name}</td>
                      <%-- <td>${toss.status}</td> --%>
                      <c:choose>
                      		<c:when test="${stir.status eq 'Active'}" > 
                      			<td><span class="badge badge-success">${stir.status}</span></td>
                      		</c:when>
                      		<c:otherwise>
                      			<td><span class="badge badge-danger">${stir.status}</span></td> 
                      		</c:otherwise>
                      </c:choose> 
                         
                      <td> 
                        <span data-toggle="tooltip" data-placement="top" title="View"><a href="#" class="btn btn-info btn-circle btn-sm" data-toggle="modal" data-target="#viewModal" onClick="viewStirInfo('${stir.id}')"><i class="fas fa-eye"></i></a></span>
                        <span data-toggle="tooltip" data-placement="top" title="Edit"><a href="#" class="btn btn-primary btn-circle btn-sm" data-toggle="modal" data-target="#editModal" onClick="openEditStirInfo('${stir.id}')"><i class="fas fa-edit"></i></a></span>  
                      	<%-- <c:choose>
                      		<c:when test="${stir.status eq 'Active'}" > 
                      			<span data-toggle="tooltip" data-placement="top" title="Make Inactive"><a href="#" class="btn btn-warning btn-circle btn-sm" data-toggle="modal" data-target="#inActiveModal"><i class="fas fa-times"></i></a></span>
                      		</c:when>
                      		<c:otherwise>
                      			<span data-toggle="tooltip" data-placement="top" title="Make Active"><a href="#" class="btn btn-success btn-circle btn-sm" data-toggle="modal" data-target="#activeModal"><i class="fas fa-check"></i></a></span>
                      		</c:otherwise>
                      	</c:choose> --%>
                      <span data-toggle="tooltip" data-placement="top" title="Delete"><a href="#" class="btn btn-danger btn-circle btn-sm" data-toggle="modal" data-target="#deleteModal" onClick="openDeleteStir('${stir.id}')"><i class="fas fa-trash"></i></a></span>
                      </td>
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
                   	<c:if test="${pno!=1}" ><li class="page-item"><a class="page-link" href="#" tabindex="-1"  onclick="callAjx('sStir',0,1);">Start</a></li></c:if>
                    <c:choose><c:when test="${pno==1}" ><li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" >Previous</a></li></c:when>
                    <c:otherwise><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sStir',0,${pno-1});" tabindex="-1" >Previous</a></li></c:otherwise></c:choose>
					<c:if test="${(pno>4) && ((pno-2)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sStir',0,${pno-4})">${pno-4}</a></li></c:if>
					<c:if test="${(pno>3) && ((pno-1)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sStir',0,${pno-3})">${pno-3}</a></li></c:if>
					<c:if test="${(pno>2) && ((pno-2)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sStir',0,${pno-2})">${pno-2}</a></li></c:if>
					<c:if test="${(pno>1) && ((pno-1)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sStir',0,${pno-1})">${pno-1}</a></li></c:if>
					<li class="page-item active"><a class="page-link" href="#">${pno}<span class="sr-only">(current)</span></a></li>
					<c:if test="${(pno+1)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sStir',0,${pno+1})">${pno+1}</a></li></c:if>
					<c:if test="${(pno+2)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sStir',0,${pno+2})">${pno+2}</a></li></c:if>
					<c:if test="${(pno+3)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sStir',0,${pno+3})">${pno+3}</a></li></c:if>
					<c:if test="${(pno+4)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sStir',0,${pno+4})">${pno+4}</a></li></c:if>
					<c:choose><c:when test="${noOfPages<=pno}" ><li class="page-item disabled"><a class="page-link" href="#">Next</a></li></c:when>
					<c:otherwise><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sStir',0,${pno+1})">Next</a></li></c:otherwise></c:choose>
					<c:if test="${noOfPages>pno}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sStir',0,${noOfPages});">End</a></li></c:if>
                  </ul>
                   
                </nav>
                </div>
              </div> <!-- pagination End -->
            </div>
          </div> <!-- Card End -->
        </div>
      </div><!-- /.container-fluid -->
      </div><!-- End of Main Content -->
      </div><!-- End of Content Wrapper -->
	</div><!-- End of Page Wrapper -->

 	  <!-- Scroll to Top Button-->
  	  <a class="scroll-to-top rounded" href="#page-top">
      	  <i class="fas fa-angle-up"></i>
  	  </a>
  
      <!-- Add Modal -->
      <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-hidden="true"></div>
      
      <!-- Edit Modal -->
      <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-hidden="true"></div>
      
      <!-- View Modal -->
  	  <div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-hidden="true"></div>
  	  
  	  <!-- Delete Modal-->
  	  <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-hidden="true"></div>
  	  
  	  <!-- Active Modal-->
      <div class="modal fade" id="activeModal" tabindex="-1" role="dialog" aria-hidden="true"></div>
      
       <!-- In Active Modal-->
  <div class="modal fade" id="inActiveModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-danger">Warning Message</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close" >
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Are You Sure Want To Inactive this Entry ?</div>
        <div class="modal-footer">
          <button class="btn btn-danger" type="button" data-dismiss="modal" >No</button>
          <button class="btn btn-success" type="button">Yes</button>
         </div>
      </div>
    </div>
  </div>
  
  <!-- End -->
 

<%@include file="../includes/adminFooter_n.jsp"%>
</body>
</html>
