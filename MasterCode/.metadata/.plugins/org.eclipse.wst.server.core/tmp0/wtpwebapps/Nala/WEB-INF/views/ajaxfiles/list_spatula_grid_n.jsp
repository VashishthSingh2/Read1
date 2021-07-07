<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="card-body">
            <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead class="thead-dark">
                <tr>
                  <th>Spatula ID</th>
                  <th>Spatula Name</th>
                  <th>Type</th>
                  <th>Actions</th>
                </tr>
              </thead>
                <tbody>
                <c:forEach items="${spatulaList}" var="spatula">
                    <tr>
                      <td>${spatula.id}</td>
                      <td>${spatula.name}</td>
                      <td>${spatula.spatulaType}</td>
                      <td> 
                        <span data-toggle="tooltip" data-placement="top" title="View"><a href="#" class="btn btn-info btn-circle btn-sm" data-toggle="modal" data-target="#viewModal" onclick="viewSpatulaInfo('${spatula.id}');"><i class="fas fa-eye"></i></a></span>
                        <span data-toggle="tooltip" data-placement="top" title="Edit"><a href="#" class="btn btn-primary btn-circle btn-sm" data-toggle="modal" data-target="#editModal" onclick="openEditSpatulaInfo('${spatula.id}')"><i class="fas fa-edit"></i></a></span>
                        <span data-toggle="tooltip" data-placement="top" title="Delete"><a href="#" class="btn btn-danger btn-circle btn-sm" data-toggle="modal" data-target="#deleteModal" onclick="openDeleteSpatula('${spatula.id}')"><i class="fas fa-trash"></i></a></span>
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
                   	<c:if test="${pno!=1}" ><li class="page-item"><a class="page-link" href="#" tabindex="-1"  onclick="callAjx('sSpatula',0,1);">Start</a></li></c:if>
                    <c:choose><c:when test="${pno==1}" ><li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" >Previous</a></li></c:when>
                    <c:otherwise><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sSpatula',0,${pno-1});" tabindex="-1" >Previous</a></li></c:otherwise></c:choose>
					<c:if test="${(pno>4) && ((pno-2)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sSpatula',0,${pno-4})">${pno-4}</a></li></c:if>
					<c:if test="${(pno>3) && ((pno-1)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sSpatula',0,${pno-3})">${pno-3}</a></li></c:if>
					<c:if test="${(pno>2) && ((pno-2)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sSpatula',0,${pno-2})">${pno-2}</a></li></c:if>
					<c:if test="${(pno>1) && ((pno-1)>0)}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sSpatula',0,${pno-1})">${pno-1}</a></li></c:if>
					<li class="page-item active"><a class="page-link" href="#">${pno}<span class="sr-only">(current)</span></a></li>
					<c:if test="${(pno+1)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sSpatula',0,${pno+1})">${pno+1}</a></li></c:if>
					<c:if test="${(pno+2)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sSpatula',0,${pno+2})">${pno+2}</a></li></c:if>
					<c:if test="${(pno+3)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sSpatula',0,${pno+3})">${pno+3}</a></li></c:if>
					<c:if test="${(pno+4)<=noOfPages}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sSpatula',0,${pno+4})">${pno+4}</a></li></c:if>
					<c:choose><c:when test="${noOfPages<=pno}" ><li class="page-item disabled"><a class="page-link" href="#">Next</a></li></c:when>
					<c:otherwise><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sSpatula',0,${pno+1})">Next</a></li></c:otherwise></c:choose>
					<c:if test="${noOfPages>pno}" ><li class="page-item"><a class="page-link" href="#" onclick="callAjx('sSpatula',0,${noOfPages});">End</a></li></c:if>
                  </ul>
                </nav>
                </div>
             	</div> <!-- pagination End -->
 </div>