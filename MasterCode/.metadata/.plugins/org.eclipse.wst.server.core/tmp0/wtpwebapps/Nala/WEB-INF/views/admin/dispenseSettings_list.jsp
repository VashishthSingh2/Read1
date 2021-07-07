<!DOCTYPE html>
<html lang="en">
<head>
  <title>Dispense Settings</title>
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
                      <h5 class="m-0 font-weight-bold text-dark">Dispense Settings of : ${ingredient.name}</h5>
                    </div>
                    <div class="col">
                        <a href="#" class="btn btn-warning btn-icon-split float-right" data-toggle="modal" data-target="#addModal" onclick="getDispenseSettings('${ingredient.id}');">
                          <span class="icon text-white-50"><i class="fas fa-plus" aria-hidden="true"></i></span>
                          <span class="text">Add Dispense Settings</span>
                        </a>
                      </div>
                  </div>
               </div>
              </div> <!-- Search End -->
                <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                  <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/listIngredients">Ingredient </a></li>
                  <li class="breadcrumb-item active" aria-current="page">Dispense Settings</li>
                </ol>
              </nav>
            <div class="card shadow mb-4">
              <div class="card-body">
                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead class="thead-dark">
                    <tr>
                      <th>ID</th>
                      <th>Start</th>
                      <th>End</th>
                      <th>Bulk Feed %</th>
                      <th>Gap Timer</th>
                      <th>Inch On Timer</th>
                      <th>Inch Off Timer</th>
                      <th>Cut Of %</th>
                      <th>RPM</th>
                      <th>Status</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                    <tbody>
                    <c:forEach items="${dispenseSettingsList}" var="dispenseSettings">
                    <tr>
                      <td>${dispenseSettings.id}</td>
                      <td>${dispenseSettings.start}</td>
                      <td>${dispenseSettings.end}</td>
                      <td>${dispenseSettings.bulkFeedPercentage}</td>
                      <td>${dispenseSettings.gapTimerSeconds}</td>
                      <td>${dispenseSettings.inchOnTimer}</td>
                      <td>${dispenseSettings.inchOffTimer}</td>
                      <td>${dispenseSettings.cutOfPercentage}</td>
                      <td>${dispenseSettings.RPM}</td>
                     
                       <c:set var="dispenseSettingsStatus" value="${dispenseSettings.status}" />
                       <c:choose>
                       	<c:when test = "${dispenseSettingsStatus == 'Active'}">
                       	 <td><span class="badge badge-success">${dispenseSettings.status}</span></td>
                       	</c:when>
                       	<c:otherwise>
            				<td><span class="badge badge-danger">${dispenseSettings.status}</span></td>
         				</c:otherwise>
                       </c:choose>
                      
                      
                      <td> 
                        <span data-toggle="tooltip" data-placement="top" title="View"><a href="#" class="btn btn-info btn-circle btn-sm" data-toggle="modal" data-target="#viewModal" onClick="viewDispenseSettingsInfo('${dispenseSettings.id}','${ingredient.id}')"><i class="fas fa-eye"></i></a></span>
                        <span data-toggle="tooltip" data-placement="top" title="Edit"><a href="#" class="btn btn-primary btn-circle btn-sm" data-toggle="modal" data-target="#editModal" onClick="openEditDispenseSettingsInfo('${dispenseSettings.id}','${ingredient.id}')"><i class="fas fa-edit"></i></a></span> 
                        <span data-toggle="tooltip" data-placement="top" title="Delete"><a href="#" class="btn btn-danger btn-circle btn-sm" data-toggle="modal" data-target="#deleteModal" onClick="openDeleteDispenseSettings('${dispenseSettings.id}','${ingredient.id}')"><i class="fas fa-trash"></i></a></span>
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
                   	<c:if test="${pno!=1}" ><li class="page-item"><a class="page-link" href="#" tabindex="-1"  onclick="callAjx('sDispenseSettings',0,1);">Start</a></li></c:if>
                    <c:choose><c:when test="${pno==1}" ><li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" >Previous</a></li></c:when>
                    <c:otherwise><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sDispenseSettings',0,${pno-1});" tabindex="-1" >Previous</a></li></c:otherwise></c:choose>
					<c:if test="${(pno>4) && ((pno-2)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sDispenseSettings',0,${pno-4})">${pno-4}</a></li></c:if>
					<c:if test="${(pno>3) && ((pno-1)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sDispenseSettings',0,${pno-3})">${pno-3}</a></li></c:if>
					<c:if test="${(pno>2) && ((pno-2)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sDispenseSettings',0,${pno-2})">${pno-2}</a></li></c:if>
					<c:if test="${(pno>1) && ((pno-1)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sDispenseSettings',0,${pno-1})">${pno-1}</a></li></c:if>
					<li class="page-item active"><a class="page-link" href="#">${pno}<span class="sr-only">(current)</span></a></li>
					<c:if test="${(pno+1)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sDispenseSettings',0,${pno+1})">${pno+1}</a></li></c:if>
					<c:if test="${(pno+2)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sDispenseSettings',0,${pno+2})">${pno+2}</a></li></c:if>
					<c:if test="${(pno+3)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sDispenseSettings',0,${pno+3})">${pno+3}</a></li></c:if>
					<c:if test="${(pno+4)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sDispenseSettings',0,${pno+4})">${pno+4}</a></li></c:if>
					<c:choose><c:when test="${noOfPages<=pno}" ><li class="page-item disabled"><a class="page-link" href="#">Next</a></li></c:when>
					<c:otherwise><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sDispenseSettings',0,${pno+1})">Next</a></li></c:otherwise></c:choose>
					<c:if test="${noOfPages>pno}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sDispenseSettings',0,${noOfPages});">End</a></li></c:if>
                  </ul>
                   
                </nav>
                </div>
              </div> <!-- pagination End -->
            </div>
          </div> <!-- Card End -->
        </div>
      </div><!-- /.container-fluid -->
      </div><!-- End of Main Content -->
      <!-- Footer 
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy;  Nala  2020</span>
          </div>
        </div>
      </footer>-->
    </div><!-- End of Content Wrapper -->
</div><!-- End of Page Wrapper -->
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  <!-- Add Modal Start-->
  <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">

  </div>
  <!-- Add model End -->
  <!-- Edit Modal Start-->
  <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-hidden="true">
    
  </div>
  <!-- Edit Modal End-->
  <!-- View Modal Start-->
  <div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-hidden="true">
    
  </div>
  <!-- View Modal End -->
  <!-- Delete Modal-->
  <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-hidden="true">

  </div>
   <!-- In Active Modal-->
  <div class="modal fade" id="inActiveModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-danger">Warning Message</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Are You Sure Want To Inactive this Entry ?</div>
        <div class="modal-footer">
          <button class="btn btn-danger" type="button" data-dismiss="modal">No</button>
          <button class="btn btn-success" type="button">Yes</button>
         </div>
      </div>
    </div>
  </div>
  <!-- End -->
   <!-- Active Modal-->
  <div class="modal fade" id="activeModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-danger">Warning Message</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Are You Sure Want To Active this Entry ?</div>
        <div class="modal-footer">
          <button class="btn btn-danger" type="button" data-dismiss="modal">No</button>
          <button class="btn btn-success" type="button">Yes</button>
         </div>
      </div>
    </div>
  </div>
  <!-- End -->

<%@include file="../includes/adminFooter_n.jsp"%>
</body>
</html>
