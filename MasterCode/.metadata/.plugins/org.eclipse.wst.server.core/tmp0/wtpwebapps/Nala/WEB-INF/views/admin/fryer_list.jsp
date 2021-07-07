<!DOCTYPE html>
<html lang="en">
<head>
<title>Fryer List</title>
<meta name="keywords" content="#" />
<meta name="description" content="#" />
<%@include file="../includes/admin_links_n.jsp"%>
</head>
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
                      <h5 class="m-0 font-weight-bold text-dark">Fryer List</h5>
                    </div>
                    <div class="col">
                        <a href="#" class="btn btn-warning btn-icon-split float-right" data-toggle="modal" data-target="#addModal" onclick="getFryer()">
                          <span class="icon text-white-50"><i class="fas fa-plus" aria-hidden="true"></i></span>
                          <span class="text">Add Fryer </span>
                        </a>
                      </div>
                  </div>
                <hr>
                 <form method="post" id="fryerSearchForm" name="fryerSearchForm" action="${pageContext.request.contextPath}/admin/searchFryer" onsubmit="return false;">
                  <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <input type="text" id="fryerSearchName" name="fryerSearchName" class="form-control" placeholder="Enter Fryer Name">
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <select name="mapToStation" id="mapToStation" class="custom-select mr-sm-2">
                            <option value="">Mapped Station</option>
                            <option value="Station 1">Station 1</option>
                            <option value="Station 2">Station 2</option>                 
                        </select>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <select name="mapToRobot" id="mapToRobot" class="custom-select mr-sm-2">
                            <option value="">Mapped Robot</option>
                            <option value="Robot1">Robot1</option>
                            <option value="Robot2">Robot2</option>                 
                        </select>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6 mb-2">
                      <select name="status" id="status" class="custom-select mr-sm-2">
                            <option value="">Status</option>
                            <option value="Active">Active</option>
                            <option value="In Active">In Active</option>                 
                        </select>
                    </div>
                     <div class="col-lg-1 col-md-4 col-sm-6 mb-2">
                     <button class="btn btn-primary" type="button" id="" name="" data-toggle="tooltip" data-placement="top" title="Search" onclick="callAjx('sFryer',0,1)">
                          <i class="fas fa-search fa-sm"></i>
                         </button>
                    </div>
                  </div>
                </form>
              </div>
              </div> <!-- Search End -->
          <div class="card shadow mb-4">
              <div class="card-body">
                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead class="thead-dark">
                    <tr>
                      <th>Fryer ID</th>
                      <th>Fryer Name</th>
                      <th>Mapped Station</th>
                      <th>Mapped Robot</th>
                      <th>Status</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                    <tbody>
                    <c:forEach items="${fryerList}" var="fryer">
                    <tr>	
                      <td>${fryer.id}</td>
                      <td>${fryer.name}</td>
                      <td>${fryer.mapToStation}</td>
                      <td>${fryer.mapToRobot}</td>
                      
   						<c:set var="fryerStatus" value="${fryer.status}" />
                       <c:choose>
                       	<c:when test = "${fryerStatus == 'Active'}">
                       	 <td><span class="badge badge-success">${fryer.status}</span></td>
                       	</c:when>
                       	<c:otherwise>
            				<td><span class="badge badge-danger">${fryer.status}</span></td>
         				</c:otherwise>
                       </c:choose>


                      <td> 
                        <span data-toggle="tooltip" data-placement="top" title="View"><a href="#" class="btn btn-info btn-circle btn-sm" data-toggle="modal" data-target="#viewModal" onClick="viewFryerInfo('${fryer.id}')"><i class="fas fa-eye"></i></a></span>
                        <span data-toggle="tooltip" data-placement="top" title="Edit"><a href="#" class="btn btn-primary btn-circle btn-sm" data-toggle="modal" data-target="#editModal" onClick="openEditFryerInfo('${fryer.id}')"><i class="fas fa-edit"></i></a></span>
                        <span data-toggle="tooltip" data-placement="top" title="Delete"><a href="#" class="btn btn-danger btn-circle btn-sm" data-toggle="modal" data-target="#deleteModal" onClick="openDeleteFryer('${fryer.id}')"><i class="fas fa-trash"></i></a></span>
                      </td>
                    </tr>
                     </c:forEach>
                   </tbody>
                </table>
              </div> <!--tablle End -->
              <div class="row listing-table">
                <div class="col-sm-12 col-md-5"><div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div></div>
                <div class="col-sm-12 col-md-7">
                <nav aria-label="...">
                   <ul class="pagination">
                    <li class="page-item disabled">
                      <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active">
                      <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                      <a class="page-link" href="#">Next</a>
                    </li>
                  </ul>
                </nav>
                </div>
              </div> <!-- pagination End -->
            </div>
          </div> <!-- Card End -->
        </div>
      </div><!-- /.container-fluid -->
      </div><!-- End of Main Content -->
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
  	  <div class="modal fade" id="inActiveModal" tabindex="-1" role="dialog" aria-hidden="true"></div>
<%@include file="../includes/adminFooter_n.jsp"%>
</body>
</html>

