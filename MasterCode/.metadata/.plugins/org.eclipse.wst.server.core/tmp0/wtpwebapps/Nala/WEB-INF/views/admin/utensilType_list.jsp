<!DOCTYPE html>
<html lang="en">
<head>
<title>Utensil Types List</title>
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
                      <h5 class="m-0 font-weight-bold text-dark">Utensil Types List</h5>
                    </div>
                    <div class="col">
                        <a href="#" class="btn btn-warning btn-icon-split float-right" data-toggle="modal" data-target="#addModal" onclick="getUtensilType()">
                          <span class="icon text-white-50"><i class="fas fa-plus" aria-hidden="true"></i></span>
                          <span class="text">Add Utensil Type </span>
                        </a>
                      </div>
                  </div>
                <hr>
                 <form method="post" id="utensilTypeSearchForm" name="utensilTypeSearchForm" action="${pageContext.request.contextPath}/admin/searchUtensilType" onsubmit="return false;">
                  <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                    <input type="text" id="utensilTypeSearchTypeId" name="utensilTypeSearchTypeId"  class="form-control" placeholder="Enter Utensil Type ID"/>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <input type="text" id="utensilTypeSearchName" name="utensilTypeSearchName"  class="form-control" placeholder="Enter Utensil Name"/>
                    </div>
                     <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <select name="utensilTypeSearchStatus" id="utensilTypeSearchStatus" class="custom-select">
                            <option value="">Status</option>
                            <option value="true">Active</option>
                            <option value="false">In Active </option>                
                        </select>
                    </div>
                     <div class="col-lg-1 col-md-4 col-sm-6 mb-2">
                        <button class="btn btn-primary" type="button" id="" name="" data-toggle="tooltip" data-placement="top" title="Search" onclick="callAjx('sUtensilType',0,1)">
                          <i class="fas fa-search fa-sm"></i>
                         </button>
                    </div>
                  </div>
                </form>
              </div>
              </div> <!-- Search End -->
          <div class="card shadow mb-4">
              <div class="card-body" id="utensilTypeGrid">
                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead class="thead-dark">
                    <tr>
                      <th>ID</th>
                      <th>Utensil Type ID</th>
                      <th>Utensil Type Name</th>
                      <th>Status</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                    <tbody>
                    
                    
                    <c:forEach items="${utensilTypeList}" var="utensilType">
                    <tr>
                      <td>${utensilType.id}</td>
                      <td>${utensilType.typeid}</td>
                      <td>${utensilType.name}</td>
                      
                      <c:set var="utensilTypeStatus" value="${utensilType.status}" />
                       <c:choose>
                       	<c:when test = "${utensilTypeStatus == 'Active'}">
                       	 <td><span class="badge badge-success">${utensilType.status}</span></td>
                       	</c:when>
                       	<c:otherwise>
            				<td><span class="badge badge-danger">${utensilType.status}</span></td>
         				</c:otherwise>
                       </c:choose>   
                      
                      
                      <td> 
                        
                        <span data-toggle="tooltip" data-placement="top" title="Edit"><a href="#" class="btn btn-primary btn-circle btn-sm" data-toggle="modal" data-target="#editModal" onClick="openEditUtensilTypeInfo('${utensilType.id}')"><i class="fas fa-edit"></i></a></span>
                        <span data-toggle="tooltip" data-placement="top" title="Delete"><a href="#" class="btn btn-danger btn-circle btn-sm" data-toggle="modal" data-target="#deleteModal" onClick="openDeleteUtensilType('${utensilType.id}')"><i class="fas fa-trash"></i></a></span>
                      </td>
                    </tr>
					</c:forEach>
                   </tbody>
                </table>
              </div> <!--table End -->
              <div class="row listing-table">
             <div class="col-sm-12 col-md-5"><div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing ${startNo} to <c:choose><c:when test="${totalSize ge endNo}">${endNo}</c:when><c:otherwise>${totalSize}</c:otherwise></c:choose> of ${totalSize} entries</div></div>
                <div class="col-sm-12 col-md-7">
                <nav aria-label="...">
                   <ul class="pagination">
                   	<c:if test="${pno!=1}" ><li class="page-item"><a class="page-link" href="#" tabindex="-1"  onclick="callAjx('sUtensilType',0,1);">Start</a></li></c:if>
                    <c:choose><c:when test="${pno==1}" ><li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" >Previous</a></li></c:when>
                    <c:otherwise><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sUtensilType',0,${pno-1});" tabindex="-1" >Previous</a></li></c:otherwise></c:choose>
					<c:if test="${(pno>4) && ((pno-2)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sUtensilType',0,${pno-4})">${pno-4}</a></li></c:if>
					<c:if test="${(pno>3) && ((pno-1)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sUtensilType',0,${pno-3})">${pno-3}</a></li></c:if>
					<c:if test="${(pno>2) && ((pno-2)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sUtensilType',0,${pno-2})">${pno-2}</a></li></c:if>
					<c:if test="${(pno>1) && ((pno-1)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sUtensilType',0,${pno-1})">${pno-1}</a></li></c:if>
					<li class="page-item active"><a class="page-link" href="#">${pno}<span class="sr-only">(current)</span></a></li>
					<c:if test="${(pno+1)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sUtensilType',0,${pno+1})">${pno+1}</a></li></c:if>
					<c:if test="${(pno+2)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sUtensilType',0,${pno+2})">${pno+2}</a></li></c:if>
					<c:if test="${(pno+3)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sUtensilType',0,${pno+3})">${pno+3}</a></li></c:if>
					<c:if test="${(pno+4)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sUtensilType',0,${pno+4})">${pno+4}</a></li></c:if>
					<c:choose><c:when test="${noOfPages<=pno}" ><li class="page-item disabled"><a class="page-link" href="#">Next</a></li></c:when>
					<c:otherwise><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sUtensilType',0,${pno+1})">Next</a></li></c:otherwise></c:choose>
					<c:if test="${noOfPages>pno}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sUtensilType',0,${noOfPages});">End</a></li></c:if>
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
