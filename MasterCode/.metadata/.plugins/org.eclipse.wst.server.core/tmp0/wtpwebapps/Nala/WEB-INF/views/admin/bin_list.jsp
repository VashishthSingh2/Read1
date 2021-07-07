<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Nala">
  <title>Bins List</title>
  <!-- Custom fonts -->
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
                      <h5 class="m-0 font-weight-bold text-dark">Bins List</h5>
                    </div>
                    <div class="col">
                        <a href="add-user.html" class="btn btn-warning btn-icon-split float-right" data-toggle="modal" data-target="#addModal"  onclick="addBin();">
                          <span class="icon text-white-50"><i class="fas fa-plus" aria-hidden="true"></i></span>
                          <span class="text">Add Bin </span>
                        </a>
                      </div>
                  </div>
                <hr>
                 <form method="post" id="binSearchForm" name="binSearchForm" action="" onsubmit="return false;">
                  <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <input type="text" id="binSearchName" name="binSearchName" class="form-control" placeholder="Bin Name">
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <select name="binRack" id="binRack" class="custom-select mr-sm-2">
                            <option value="">Select Rack</option>
                            <option value="1.1">1.1</option>
                            <option value="1.2">1.2</option>                 
                        </select>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <select name="binSection" id="binSection" class="custom-select mr-sm-2">
                            <option value="">Select Section</option>
                            <option value="Veg">Veg</option>
                            <option value="Meat">Meat</option>                 
                        </select>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6 mb-2">
                      <input type="text" id="seqRack" name="seqRack" class="form-control" placeholder="Seq in Rack">
                    </div>
                     <div class="col-lg-1 col-md-4 col-sm-6 mb-2">
                        <button class="btn btn-primary" type="button" id="" name="" data-toggle="tooltip" data-placement="top" title="Search" onclick="callAjx('sBin',0,1)">
                          <i class="fas fa-search fa-sm"></i>
                         </button>
                    </div>
                  </div>
                </form>
              </div>
              </div> <!-- Search End -->
          <div class="card shadow mb-4">
              <div class="card-body" id="binListGrid">
                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead class="thead-dark">
                    <tr>
                      <th>Bin ID</th>
                      <th>Bin Name</th>
                      <th>Rack</th>
                      <th>Section</th>
                      <th>Seq in Rack</th>
                      <th>Ingredient</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                    <tbody>.
                     <c:forEach items="${binList}" var="bin">
                    <tr>
                      <td>${bin.id}</td>
                      <td>${bin.name}</td>
                      <td>${bin.rack.rackId}</td>
                      <td>${bin.section}</td>
                      <td>${bin.seqRack}</td>
                      <td>${bin.ingredient.name}</td>
                      <td> 
                        <span data-toggle="tooltip" data-placement="top" title="View"><a href="#" class="btn btn-info btn-circle btn-sm" data-toggle="modal" data-target="#viewModal" onclick="viewBinInfo('${bin.id}');"><i class="fas fa-eye"></i></a></span>
                        <span data-toggle="tooltip" data-placement="top" title="Edit"><a href="#" class="btn btn-primary btn-circle btn-sm" data-toggle="modal" data-target="#editModal"><i class="fas fa-edit" onclick="openEditBinInfo('${bin.id}');"></i></a></span>
                        <span data-toggle="tooltip" data-placement="top" title="Delete"><a href="#" class="btn btn-danger btn-circle btn-sm" data-toggle="modal" data-target="#deleteModal" onclick="openDeleteBin('${bin.id}');"><i class="fas fa-trash"></i></a></span>
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
                   	<c:if test="${pno!=1}" ><li class="page-item"><a class="page-link" href="#" tabindex="-1"  onclick="callAjx('sBin',0,1);">Start</a></li></c:if>
                    <c:choose><c:when test="${pno==1}" ><li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" >Previous</a></li></c:when>
                    <c:otherwise><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sBin',0,${pno-1});" tabindex="-1" >Previous</a></li></c:otherwise></c:choose>
					<c:if test="${(pno>4) && ((pno-2)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sBin',0,${pno-4})">${pno-4}</a></li></c:if>
					<c:if test="${(pno>3) && ((pno-1)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sBin',0,${pno-3})">${pno-3}</a></li></c:if>
					<c:if test="${(pno>2) && ((pno-2)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sBin',0,${pno-2})">${pno-2}</a></li></c:if>
					<c:if test="${(pno>1) && ((pno-1)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callsBinAjx('sBin',0,${pno-1})">${pno-1}</a></li></c:if>
					<li class="page-item active"><a class="page-link" href="#">${pno}<span class="sr-only">(current)</span></a></li>
					<c:if test="${(pno+1)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sBin',0,${pno+1})">${pno+1}</a></li></c:if>
					<c:if test="${(pno+2)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sBin',0,${pno+2})">${pno+2}</a></li></c:if>
					<c:if test="${(pno+3)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sBin',0,${pno+3})">${pno+3}</a></li></c:if>
					<c:if test="${(pno+4)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sBin,0,${pno+4})">${pno+4}</a></li></c:if>
					<c:choose><c:when test="${noOfPages<=pno}" ><li class="page-item disabled"><a class="page-link" href="#">Next</a></li></c:when>
					<c:otherwise><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sBin',0,${pno+1})">Next</a></li></c:otherwise></c:choose>
					<c:if test="${noOfPages>pno}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('',0,${noOfPages});">End</a></li></c:if>
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
        <div class="modal-header">
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
