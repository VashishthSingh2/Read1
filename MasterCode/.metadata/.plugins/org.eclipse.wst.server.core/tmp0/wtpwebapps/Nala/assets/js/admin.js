$ = jQuery.noConflict();
var http = getHTTPObject();
var calDiv = '';

// Ajax Functionality
function getHTTPObject() {
	var xmlhttp;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		if (!xmlhttp) {
			xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
		}
	}
	return xmlhttp;
}

$(function() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
});

var testresults;
function checkemail(emailCheck) {
	var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	if (filter.test(emailCheck)) {
		testresults = true;
	} else {
		testresults = false;
	}
	return (testresults);
}

// Trim Function
function trim(text) {
	return (text || "").replace(/^\s+|\s+$/g, "");
}

function keyRestrict(e, choice) {
	validchars = '';
	var key = '', keychar = '';
	if (choice == 'int') {
		validchars = '1234567890';
	} else if (choice == 'dotint') {
		validchars = '1234567890.$,';
	} else if (choice == 'latlong') {
		validchars = '1234567890.-';
	} else if (choice == 'phone') {
		validchars = '1234567890. -_()+,';
	} else if (choice == 'char') {
		validchars = 'abcdefghijklmnopqrstuvwxyz, ';
	} else if (choice == 'charspe') {
		validchars = 'abcdefghijklmnopqrstuvwxyz_.';
	} else if (choice == 'emailchar') {
		validchars = 'abcdefghijklmnopqrstuvwxyz_-.1234567890@';
	} else if (choice == 'charnum') {
		validchars = 'abcdefghijklmnopqrstuvwxyz1234567890';
	} else if (choice == 'passchar') {
		validchars = 'abcdefghijklmnopqrstuvwxyz_1234567890.';
	} else if (choice == 'charspace') {
		validchars = 'abcdefghijklmnopqrstuvwxyz1234567890 ';
	} else if (choice == 'vchar') {
		validchars = 'abcdefghijklmnopqrstuvwxyz1234567890 ._-@,#|:;';
	} else if (choice == 'url') {
		validchars = 'abcdefghijklmnopqrstuvwxyz1234567890-_';
	}
	key = getKeyCode(e);
	if (key == null) {
		return true;
	}
	keychar = String.fromCharCode(key);
	keychar = keychar.toLowerCase();
	validchars = validchars.toLowerCase();
	if (validchars.indexOf(keychar) != -1) {
		return true;
	}
	if (key == null || key == 0 || key == 8 || key == 9 || key == 13
			|| key == 27) {
		return true;
	}
	return false;
}

function getKeyCode(e) {
	if (window.event) {
		return window.event.keyCode;
	} else if (e) {
		return e.which;
	} else {
		return null;
	}
}

$(document).ready(function() {

});

function getSpatula() {
	try {
		$.ajax({
			type : 'GET',
			url : "addSpatula",
			success : function(data) {
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		return false;
	}
}

function saveSpatula() {
	try {
		var errMsg = '';
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		var spatulaType = trim($('#spatulaType').val());
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (spatulaType == undefined || spatulaType == 'undefined'
				|| spatulaType == '') {
			errMsg += '<li>Please Select Spatula Type !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#spatulaForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function viewSpatulaInfo(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "viewSpatulaInfo?id=" + id,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		return false;
	}
}

function openEditSpatulaInfo(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "openEditSpatula?id=" + id,
			success : function(data) {
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		return false;
	}
}

function updateSpatula() {
	try {
		var errMsg = '';
		var id = trim($('#id').val());
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		var spatulaType = trim($('#spatulaType').val());
		if (id == undefined || id == 'undefined' || id == '') {
			errMsg += '<li>Please Provide Id !!\n</li>';
		}
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (spatulaType == undefined || spatulaType == 'undefined'
				|| spatulaType == '') {
			errMsg += '<li>Please Select Spatula Type !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#spatulaForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function openDeleteSpatula(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "openDeleteSpatula?id=" + id,
			success : function(data) {
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		alert(e);
		return false;
	}
}

function deleteSpatula() {
	try {
		$("#deleteSpatulaForm").submit();
	} catch (e) {
		alert(e)
		return false;
	}
}

function searchSpatula() {
	try {
		var errMsg = '';
		var name = trim($('#spatulaSearchName').val());
		var status = trim($('#spatulaSearchStatus').val());
		var spatulaType = trim($('#spatulaSearchType').val());
		$('#loading').show();
		$.ajax({
			type : 'POST',
			url : $('#spatulaSearchForm').attr('action'),
			data : $("#spatulaSearchForm").serialize()
		}).done(function(data) {
			$('#loading').hide();
			$('#spatulaGrid').html(data);
		}).fail(function(data) {
			showError(data);
		});
	} catch (e) {
		return false;
	}
}

function getSpatulaType() {
	try {
		$.ajax({
			type : 'GET',
			url : "addSpatulaType",
			success : function(data) {
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		return false;
	}
}
function saveSpatulaType() {
	try {
		var errMsg = '';
		var name = trim($('#name').val());
		var spatulaTypeUniqueId = trim($('#spatulaTypeUniqueId').val());
		var status = trim($('#status').val());
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (spatulaTypeUniqueId == undefined || spatulaTypeUniqueId == 'undefined'
				|| spatulaTypeUniqueId == '') {
			errMsg += '<li>Please Provide Spatula Unique Id !!\n</li>';
		}
		if (status == undefined || status == 'undefined'
				|| status == '') {
			errMsg += '<li>Please Select Spatula Type Status !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#spatulaTypeForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function openEditSpatulaTypeInfo(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "openEditSpatulaType?id=" + id,
			success : function(data) {
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		return false;
	}
}

function updateSpatulaType() {
	try {
		var errMsg = '';
		var id = trim($('#id').val());
		var name = trim($('#name').val());
		var spatulaId = trim($('#spatulaTypeUniqueId').val());
		var status = trim($('#status').val());
		if (id == undefined || id == 'undefined' || id == '') {
			errMsg += '<li>Please Provide Id !!\n</li>';
		}
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (spatulaId == undefined || spatulaId == 'undefined'
				|| spatulaId == '') {
			errMsg += '<li>Please Provide Spatula Id !!\n</li>';
		}
		if (status == undefined || status == 'undefined'
				|| status == '') {
			errMsg += '<li>Please Select Status !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#spatulaTypeForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function openDeleteSpatulaType(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "openDeleteSpatulaType?id=" + id,
			success : function(data) {
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		alert(e);
		return false;
	}
}

function deleteSpatulaType() {
	try {
		$("#deleteSpatulaTypeForm").submit();
	} catch (e) {
		alert(e)
		return false;
	}
}

function getSection() {
	try {
		$.ajax({
			type : 'GET',
			url : "addSection",
			success : function(data) {
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		return false;
	}
}
function saveSection() {
	try {
		var errMsg = '';
		var name = trim($('#name').val());
		var status = trim($('#status').val());
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (status == undefined || status == 'undefined'
				|| status == '') {
			errMsg += '<li>Please Select Section Status !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#spatulaTypeForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function callAjx(urlNam, id, pno) {
	if(urlNam=='sSpatula' || urlNam=='vSpatula' || urlNam=='dSpatula' || urlNam=='aSpatula' || urlNam=='eSpatula'){
		var surl = '&ajax=true',
		spatulaSearchName = trim($('#spatulaSearchName').val()), spatulaSearchStatus = trim($('#spatulaSearchStatus').val()), 
		spatulaSearchType = trim($('#spatulaSearchType').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(spatulaSearchName!=undefined && spatulaSearchName!='undefined' && spatulaSearchName!=''){ surl += '&spatulaSearchName='+spatulaSearchName; }
		if(spatulaSearchType!=undefined && spatulaSearchType!='undefined' && spatulaSearchType!='' && spatulaSearchType!='0'){ surl += '&spatulaSearchType='+spatulaSearchType; }
		if(spatulaSearchStatus!=undefined && spatulaSearchStatus!='undefined' && spatulaSearchStatus!=''){ surl += '&spatulaSearchStatus='+spatulaSearchStatus; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sSpatula'){ $('#loading').show();
			$.ajax({ url: 'list-spatulas?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#spatulaGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vQuestion'){$('#loading').show();
			$.ajax({ url : 'view-question-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show();MathJax.Hub.Queue([ "Typeset", MathJax.Hub, 'view' ]); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dQuestion'){$('#loading').show();
			$.ajax({ url: 'delete-question-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} else if(urlNam=='sSpatulaType' || urlNam=='vSpatulaType' || urlNam=='dSpatulaType' || urlNam=='aSpatulaType' || urlNam=='eSpatulaType'){
		var surl = '&ajax=true',
		spatulaTypeSearchName = trim($('#spatulaTypeSearchName').val()), spatulaTypeSearchStatus = trim($('#spatulaTypeSearchStatus').val()), 
		spatulaTypeSearchTypeId = trim($('#spatulaTypeSearchTypeId').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(spatulaTypeSearchName!=undefined && spatulaTypeSearchName!='undefined' && spatulaTypeSearchName!=''){ surl += '&spatulaTypeSearchName='+spatulaTypeSearchName; }
		if(spatulaTypeSearchTypeId!=undefined && spatulaTypeSearchTypeId!='undefined' && spatulaTypeSearchTypeId!='' && spatulaTypeSearchTypeId!='0'){ surl += '&spatulaTypeSearchTypeId='+spatulaTypeSearchTypeId; }
		if(spatulaTypeSearchStatus!=undefined && spatulaTypeSearchStatus!='undefined' && spatulaTypeSearchStatus!=''){ surl += '&spatulaTypeSearchStatus='+spatulaTypeSearchStatus; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sSpatulaType'){ $('#loading').show();
			$.ajax({ url: 'list-spatulaTypes?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#spatulaTypeGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} else if(urlNam=='sSection' || urlNam=='vSection' || urlNam=='dSection' || urlNam=='aSection' || urlNam=='eSection'){
		var surl = '&ajax=true',
		sectionSearchName = trim($('#sectionSearchName').val()), sectionSearchStatus = trim($('#sectionSearchStatus').val()), 
		fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(sectionSearchName!=undefined && sectionSearchName!='undefined' && sectionSearchName!=''){ surl += '&sectionSearchName='+sectionSearchName; }
		if(sectionSearchStatus!=undefined && sectionSearchStatus!='undefined' && sectionSearchStatus!=''){ surl += '&sectionSearchStatus='+sectionSearchStatus; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sSection'){ $('#loading').show();
			$.ajax({ url: 'list-sections?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#sectionGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} else if(urlNam=='sOrder' || urlNam=='vOrder' || urlNam=='dOrder' || urlNam=='aOrder' || urlNam=='eOrder'){
		var surl = '&ajax=true',
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
		if(urlNam=='sOrder'){ $('#loading').show();
			$.ajax({ url: 'list-orders?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#orderListGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}  else if(urlNam=='sBin' || urlNam=='vBin' || urlNam=='dBin' || urlNam=='aBin' || urlNam=='eBin'){
		var surl = '&ajax=true',
		binSearchName = trim($('#binSearchName').val()), binRack = trim($('#binRack').val()), 
		binSection = trim($('#binSection').val()), seqRack = trim($('#seqRack').val()),fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(binSearchName!=undefined && binSearchName!='undefined' && binSearchName!=''){ surl += '&binSearchName='+binSearchName; }
		if(binRack!=undefined && binRack!='undefined' && binRack!='' && binRack!='0'){ surl += '&binRack='+binRack; }
		if(binSection!=undefined && binSection!='undefined' && binSection!=''){ surl += '&binSection='+binSection; }
		if(seqRack!=undefined && seqRack!='undefined' && seqRack!=''){ surl += '&seqRack='+seqRack; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sBin'){ $('#loading').show();
			$.ajax({ url: 'rack-list-bins?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#binListGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} else if(urlNam=='sRack' || urlNam=='vRack' || urlNam=='dRack' || urlNam=='aRack' || urlNam=='eRack'){
		var surl = '&ajax=true',
		rackSearchName = trim($('#rackSearchName').val()), rackSearchtype = trim($('#rackSearchtype').val()), 
		rackSearchmaptoRobot = trim($('#rackSearchmaptoRobot').val()), rackSearchstatus = trim($('#rackSearchstatus').val()),fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(rackSearchName!=undefined && rackSearchName!='undefined' && rackSearchName!=''){ surl += '&rackSearchName='+rackSearchName; }
		if(rackSearchtype!=undefined && rackSearchtype!='undefined' && rackSearchtype!='' && rackSearchtype!='0'){ surl += '&rackSearchtype='+rackSearchtype; }
		if(rackSearchmaptoRobot!=undefined && rackSearchmaptoRobot!='undefined' && rackSearchmaptoRobot!=''){ surl += '&rackSearchmaptoRobot='+rackSearchmaptoRobot; }
		if(rackSearchstatus!=undefined && rackSearchstatus!='undefined' && rackSearchstatus!=''){ surl += '&rackSearchstatus='+rackSearchstatus; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sRack'){ $('#loading').show();
			$.ajax({ url: 'list-racks?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#rackListGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} else if(urlNam=='sUtensil' || urlNam=='vUtensil' || urlNam=='dUtensil' || urlNam=='aUtensil' || urlNam=='eUtensil'){
		var surl = '&ajax=true',
		utensilSearchName = trim($('#utensilSearchName').val()), utensilSearchStatus = trim($('#utensilSearchStatus').val()), 
		utensilSearchType = trim($('#utensilSearchType').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(utensilSearchName!=undefined && utensilSearchName!='undefined' && utensilSearchName!=''){ surl += '&utensilSearchName='+utensilSearchName; }
		if(utensilSearchType!=undefined && utensilSearchType!='undefined' && utensilSearchType!='' && utensilSearchType!='0'){ surl += '&utensilSearchType='+utensilSearchType; }
		if(utensilSearchStatus!=undefined && utensilSearchStatus!='undefined' && utensilSearchStatus!=''){ surl += '&utensilSearchStatus='+utensilSearchStatus; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sUtensil'){ $('#loading').show();
			$.ajax({ url: 'list-utensils?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#utensilGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vQuestion'){$('#loading').show();
			$.ajax({ url : 'view-question-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show();MathJax.Hub.Queue([ "Typeset", MathJax.Hub, 'view' ]); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dQuestion'){$('#loading').show();
			$.ajax({ url: 'delete-question-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} 
	else if(urlNam=='sIngredient' || urlNam=='vIngredient' || urlNam=='dIngredient' || urlNam=='aIngredient' || urlNam=='eIngredient'){
		var surl = '&ajax=true',
		ingredientSearchName = trim($('#ingredientSearchName').val()), ingredientSearchStatus = trim($('#ingredientSearchStatus').val()), 
		ingredientSearchType = trim($('#ingredientSearchType').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(ingredientSearchName!=undefined && ingredientSearchName!='undefined' && ingredientSearchName!=''){ surl += '&ingredientSearchName='+ingredientSearchName; }
		if(ingredientSearchType!=undefined && ingredientSearchType!='undefined' && ingredientSearchType!='' && ingredientSearchType!='0'){ surl += '&ingredientSearchType='+ingredientSearchType; }
		if(ingredientSearchStatus!=undefined && ingredientSearchStatus!='undefined' && ingredientSearchStatus!=''){ surl += '&ingredientSearchStatus='+ingredientSearchStatus; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sIngredient'){ $('#loading').show();
			$.ajax({ url: 'listIngredients?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#ingredientGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vQuestion'){$('#loading').show();
			$.ajax({ url : 'view-question-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show();MathJax.Hub.Queue([ "Typeset", MathJax.Hub, 'view' ]); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dQuestion'){$('#loading').show();
			$.ajax({ url: 'delete-question-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}	
	else if(urlNam=='sUtensilType' || urlNam=='vUtensilType' || urlNam=='dUtensilType' || urlNam=='aUtensilType' || urlNam=='eUtensilType'){
		var surl = '&ajax=true',
		utensilTypeSearchName = trim($('#utensilTypeSearchName').val()), utensilTypeSearchStatus = trim($('#utensilTypeSearchStatus').val()),
		utensilTypeSearchTypeId = trim($('#utensilTypeSearchTypeId').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(utensilTypeSearchName!=undefined && utensilTypeSearchName!='undefined' && utensilTypeSearchName!=''){ surl += '&utensilTypeSearchName='+utensilTypeSearchName; }
		if(utensilTypeSearchTypeId!=undefined && utensilTypeSearchTypeId!='undefined' && utensilTypeSearchTypeId!='' && utensilTypeSearchTypeId!='0'){ surl += '&utensilTypeSearchTypeId='+utensilTypeSearchTypeId; }
		if(utensilTypeSearchStatus!=undefined && utensilTypeSearchStatus!='undefined' && utensilTypeSearchStatus!=''){ surl += '&utensilTypeSearchStatus='+utensilTypeSearchStatus; }		
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sUtensilType'){ $('#loading').show();
			$.ajax({ url: 'list-utensilTypes?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#utensilTypeGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vQuestion'){$('#loading').show();
			$.ajax({ url : 'view-question-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show();MathJax.Hub.Queue([ "Typeset", MathJax.Hub, 'view' ]); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dQuestion'){$('#loading').show();
			$.ajax({ url: 'delete-question-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}
		
	else if(urlNam=='sDispenseSettings' || urlNam=='vDispenseSettings' || urlNam=='dDispenseSettings' || urlNam=='aDispenseSettings' || urlNam=='eDispenseSettings'){
		var surl = '&ajax=true';
		//dispenseSettingsSearchStart = trim($('#dispenseSettingsSearchStart').val()), dispenseSettingsSearchStatus = trim($('#dispenseSettingsSearchStatus').val()), 
		//dispenseSettingsSearchEnd = trim($('#dispenseSettingsSearchEnd').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());	
			
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		
		//if(dispenseSettingsSearchStart!=undefined && dispenseSettingsSearchStart!='undefined' && dispenseSettingsSearchStart!=''){ surl += '&dispenseSettingsSearchStart='+dispenseSettingsSearchStart; }
		//if(dispenseSettingsSearchEnd!=undefined && dispenseSettingsSearchEnd!='undefined' && dispenseSettingsSearchEnd!='' && dispenseSettingsSearchEnd!='0'){ surl += '&dispenseSettingsSearchEnd='+dispenseSettingsSearchEnd; }
		//if(dispenseSettingsSearchStatus!=undefined && dispenseSettingsSearchStatus!='undefined' && dispenseSettingsSearchStatus!=''){ surl += '&dispenseSettingsSearchStatus='+dispenseSettingsSearchStatus; }
		
		
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sDispenseSettings'){ $('#loading').show();
			$.ajax({ url: 'listDispenseSettings?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#dispenseSettingsGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vQuestion'){$('#loading').show();
			$.ajax({ url : 'view-question-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show();MathJax.Hub.Queue([ "Typeset", MathJax.Hub, 'view' ]); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dQuestion'){$('#loading').show();
			$.ajax({ url: 'delete-question-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}
	else if(urlNam=='sTossType' || urlNam=='vTossType' || urlNam=='dTossType' || urlNam=='aTossType' || urlNam=='eTossType'){
		var surl = '&ajax=true',
		tossTypeSearchName = trim($('#tossTypeSearchName').val()), 
		tossTypeSearchTypeId = trim($('#tossTypeSearchTypeId').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(tossTypeSearchName!=undefined && tossTypeSearchName!='undefined' && tossTypeSearchName!=''){ surl += '&tossTypeSearchName='+tossTypeSearchName; }
		if(tossTypeSearchTypeId!=undefined && tossTypeSearchTypeId!='undefined' && tossTypeSearchTypeId!='' && tossTypeSearchTypeId!='0'){ surl += '&tossTypeSearchTypeId='+tossTypeSearchTypeId; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sTossType'){ $('#loading').show();
			$.ajax({ url: 'list-tossTypes?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#tossTypeGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vQuestion'){$('#loading').show();
			$.ajax({ url : 'view-question-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show();MathJax.Hub.Queue([ "Typeset", MathJax.Hub, 'view' ]); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dQuestion'){$('#loading').show();
			$.ajax({ url: 'delete-question-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}
	else if(urlNam=='sToss' || urlNam=='vToss' || urlNam=='dToss' || urlNam=='aToss' || urlNam=='eToss'){
		var surl = '&ajax=true',
		tossSearchName = trim($('#tossSearchName').val()), tossSearchStatus = trim($('#tossSearchStatus').val()), 
		tossSearchType = trim($('#tossSearchType').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(tossSearchName!=undefined && tossSearchName!='undefined' && tossSearchName!=''){ surl += '&tossSearchName='+tossSearchName; }
		if(tossSearchType!=undefined && tossSearchType!='undefined' && tossSearchType!='' && tossSearchType!='0'){ surl += '&tossSearchType='+tossSearchType; }
		if(tossSearchStatus!=undefined && tossSearchStatus!='undefined' && tossSearchStatus!=''){ surl += '&tossSearchStatus='+tossSearchStatus; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sToss'){ $('#loading').show();
			$.ajax({ url: 'list-tosses?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#tossGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vQuestion'){$('#loading').show();
			$.ajax({ url : 'view-question-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show();MathJax.Hub.Queue([ "Typeset", MathJax.Hub, 'view' ]); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dQuestion'){$('#loading').show();
			$.ajax({ url: 'delete-question-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} 
	else if(urlNam=='sStirType' || urlNam=='vStirType' || urlNam=='dStirType' || urlNam=='aStirType' || urlNam=='eStirType'){
		var surl = '&ajax=true',
		stirTypeSearchName = trim($('#stirTypeSearchName').val()), 
		stirTypeSearchTypeId = trim($('#stirTypeSearchTypeId').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(stirTypeSearchName!=undefined && stirTypeSearchName!='undefined' && stirTypeSearchName!=''){ surl += '&stirTypeSearchName='+stirTypeSearchName; }
		if(stirTypeSearchTypeId!=undefined && stirTypeSearchTypeId!='undefined' && stirTypeSearchTypeId!='' && stirTypeSearchTypeId!='0'){ surl += '&stirTypeSearchTypeId='+stirTypeSearchTypeId; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sStirType'){ $('#loading').show();
			$.ajax({ url: 'list-stirTypes?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#stirTypeGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vQuestion'){$('#loading').show();
			$.ajax({ url : 'view-question-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show();MathJax.Hub.Queue([ "Typeset", MathJax.Hub, 'view' ]); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dQuestion'){$('#loading').show();
			$.ajax({ url: 'delete-question-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}
	else if(urlNam=='sStir' || urlNam=='vStir' || urlNam=='dStir' || urlNam=='aStir' || urlNam=='eStir'){
		var surl = '&ajax=true',
		stirSearchName = trim($('#stirSearchName').val()), stirSearchStatus = trim($('#stirSearchStatus').val()), 
		stirSearchType = trim($('#stirSearchType').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(stirSearchName!=undefined && stirSearchName!='undefined' && stirSearchName!=''){ surl += '&stirSearchName='+stirSearchName; }
		if(stirSearchType!=undefined && stirSearchType!='undefined' && stirSearchType!='' && stirSearchType!='0'){ surl += '&stirSearchType='+stirSearchType; }
		if(stirSearchStatus!=undefined && stirSearchStatus!='undefined' && stirSearchStatus!=''){ surl += '&stirSearchStatus='+stirSearchStatus; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sStir'){ $('#loading').show();
			$.ajax({ url: 'list-stirs?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#stirGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vQuestion'){$('#loading').show();
			$.ajax({ url : 'view-question-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show();MathJax.Hub.Queue([ "Typeset", MathJax.Hub, 'view' ]); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dQuestion'){$('#loading').show();
			$.ajax({ url: 'delete-question-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} 
	else if(urlNam=='sBowlType' || urlNam=='vBowlType' || urlNam=='dBowlType' || urlNam=='aBowlType' || urlNam=='eBowlType'){
		var surl = '&ajax=true',
		bowlTypeSearchName = trim($('#bowlTypeSearchName').val()), bowlTypeSearchStatus = trim($('#bowlTypeSearchStatus').val()), 
		bowlTypeSearchDescription = trim($('#bowlTypeSearchDescription').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(bowlTypeSearchName!=undefined && bowlTypeSearchName!='undefined' && bowlTypeSearchName!=''){ surl += '&bowlTypeSearchName='+bowlTypeSearchName; }
		if(bowlTypeSearchDescription!=undefined && bowlTypeSearchDescription!='undefined' && bowlTypeSearchDescription!=''){ surl += '&bowlTypeSearchDescription='+bowlTypeSearchDescription; }
		if(bowlTypeSearchStatus!=undefined && bowlTypeSearchStatus!='undefined' && bowlTypeSearchStatus!=''){ surl += '&bowlTypeSearchStatus='+bowlTypeSearchStatus; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sBowlType'){ $('#loading').show();
			$.ajax({ url: 'list-bowlTypes?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#bowlTypeGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vQuestion'){$('#loading').show();
			$.ajax({ url : 'view-question-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show();MathJax.Hub.Queue([ "Typeset", MathJax.Hub, 'view' ]); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dQuestion'){$('#loading').show();
			$.ajax({ url: 'delete-question-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}
	else if(urlNam=='sBowl' || urlNam=='vBowl' || urlNam=='dBowl' || urlNam=='aBowl' || urlNam=='eBowl'){
		var surl = '&ajax=true',
		bowlSearchName = trim($('#bowlSearchName').val()), bowlSearchStatus = trim($('#bowlSearchStatus').val()), 
		bowlSearchType = trim($('#bowlSearchType').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());		
		if(id!=undefined && id!='undefined' && id!=''){ surl += '&id='+id; }
		if(bowlSearchName!=undefined && bowlSearchName!='undefined' && bowlSearchName!=''){ surl += '&bowlSearchName='+bowlSearchName; }
		if(bowlSearchType!=undefined && bowlSearchType!='undefined' && bowlSearchType!=''){ surl += '&bowlSearchType='+bowlSearchType; }
		if(bowlSearchStatus!=undefined && bowlSearchStatus!='undefined' && bowlSearchStatus!=''){ surl += '&bowlSearchStatus='+bowlSearchStatus; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sBowl'){ $('#loading').show();
			$.ajax({ url: 'list-bowls?pageNo='+pno+surl, context: document.body }).done(function(data){ $('#bowlGrid').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vQuestion'){$('#loading').show();
			$.ajax({ url : 'view-question-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show();MathJax.Hub.Queue([ "Typeset", MathJax.Hub, 'view' ]); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dQuestion'){$('#loading').show();
			$.ajax({ url: 'delete-question-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} 
	else if(urlNam=='sCountry' || urlNam=='vCountry' || urlNam=='dCountry'){
		var surl = '&ajax=true', countryName = trim($('#countryName').val()), countryUrl = trim($('#countryUrl').val()), isActive = trim($('#isActive').val()), 
		sortBy = trim($('#sortBy').val()), sortOrder = trim($('#sortOrder').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		if(countryName!=undefined && countryName!='undefined' && countryName!=''){ surl += '&countryName='+countryName; }
		if(countryUrl!=undefined && countryUrl!='undefined' && countryUrl!=''){ surl += '&countryUrl='+countryUrl; }
		if(isActive!=undefined && isActive!='undefined' && isActive!=''){ surl += '&isActive='+isActive; }
		if(sortBy!=undefined && sortBy!='undefined' && sortBy!=''){ surl += '&sortBy='+sortBy; }
		if(sortOrder!=undefined && sortOrder!='undefined' && sortOrder!=''){ surl += '&sortOrder='+sortOrder; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sCountry'){$('#loading').show();
			$.ajax({ url: 'list-countries', type: "POST", data: 'pno='+pno+surl, context: document.body }).done(function(data){ $('#countrys-list').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vCountry'){$('#loading').show();
			$.ajax({ url : 'view-country-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dCountry'){$('#loading').show();
			$.ajax({ url: 'delete-country-'+id, type: "POST", data: 'pno='+pno+surl, context: document.body }).done(function(data){ $('#countrys-list').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} else if(urlNam=='sSubTopic' || urlNam=='vSubTopic' || urlNam=='dSubTopic'){
		var surl = '&ajax=true', topicId = trim($('#topicId').val()), name = trim($('#name').val()), 
		 fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		if(topicId!=undefined && topicId!='undefined' && topicId!=''){ surl += '&topicId='+topicId; }
		if(name!=undefined && name!='undefined' && name!=''){ surl += '&name='+name; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sSubTopic'){$('#loading').show();
			$.ajax({ url: 'subTopic?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vSubTopic'){$('#loading').show();
			$.ajax({ url : 'view-subTopic-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dSubTopic'){$('#loading').show();
			$.ajax({ url: 'delete-subTopic-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}else if(urlNam=='sExam' || urlNam=='vExam' || urlNam=='dExam'){
		var surl = '&ajax=true', userId = trim($('#userId').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		
		if(userId!=undefined && userId!='undefined' && userId!=''){ surl += '&userId='+userId; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sExam'){$('#loading').show();
			$.ajax({ url: 'exam?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vExam'){$('#loading').show();
			$.ajax({ url : 'view-exam-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dExam'){$('#loading').show();
			$.ajax({ url: 'delete-exam-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}else if(urlNam=='sExamSubTopic' || urlNam=='vExamSubTopic' || urlNam=='dExamSubTopic'){
		var surl = '&ajax=true', topicId = trim($('#topicId').val()), subTopicId = trim($('#subTopicId').val()), 
		userId = trim($('#userId').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		
		if(userId!=undefined && userId!='undefined' && userId!=''){ surl += '&userId='+userId; }
		if(topicId!=undefined && topicId!='undefined' && topicId!=''){ surl += '&topicId='+topicId; }
		if(subTopicId!=undefined && subTopicId!='undefined' && subTopicId!=''){ surl += '&subTopicId='+subTopicId; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		
		if(urlNam=='sExamSubTopic'){$('#loading').show();
			$.ajax({ url: 'examSubTopic?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vExamSubTopic'){$('#loading').show();
			$.ajax({ url : 'view-examSubTopic-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dExamSubTopic'){$('#loading').show();
			$.ajax({ url: 'delete-examSubTopic-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}else if(urlNam=='sExamQuestion' || urlNam=='vExamQuestion' || urlNam=='dExamQuestion'){
		var surl = '&ajax=true', topicId = trim($('#topicId').val()), subTopicId = trim($('#subTopicId').val()), 
		difficultyLevel = trim($('#difficultyLevel').val()), userId = trim($('#userId').val()), 
		fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		
		if(userId!=undefined && userId!='undefined' && userId!=''){ surl += '&userId='+userId; }
		if(topicId!=undefined && topicId!='undefined' && topicId!=''){ surl += '&topicId='+topicId; }
		if(subTopicId!=undefined && subTopicId!='undefined' && subTopicId!=''){ surl += '&subTopicId='+subTopicId; }
		if(difficultyLevel!=undefined && difficultyLevel!='undefined' && difficultyLevel!=''){ surl += '&difficultyLevel='+difficultyLevel; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		
		if(urlNam=='sExamQuestion'){$('#loading').show();
			$.ajax({ url: 'examQuestion?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vExamQuestion'){$('#loading').show();
			$.ajax({ url : 'view-examQuestion-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); MathJax.Hub.Queue([ "Typeset", MathJax.Hub, 'view' ]); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dExamQuestion'){$('#loading').show();
			$.ajax({ url: 'delete-examQuestion-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}else if(urlNam=='sBlog' || urlNam=='vBlog' || urlNam=='dBlog'){
		var surl = '&ajax=true', title = trim($('#title').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		if(title!=undefined && title!='undefined' && title!=''){ surl += '&title='+title; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sBlog'){$('#loading').show();
			$.ajax({ url: 'blog?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vBlog'){$('#loading').show();
			$.ajax({ url: 'view-blog-'+id+'?pno='+pno+surl, context: document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dBlog'){$('#loading').show();
			$.ajax({ url: 'delete-blog-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}else if(urlNam=='sSubscribe' || urlNam=='dSubscribe'){
		var surl = '&ajax=true',  email = trim($('#email').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		if(email!=undefined && email!='undefined' && email!=''){ surl += '&email='+email; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sSubscribe'){$('#loading').show();
			$.ajax({ url: 'subscribe?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='dSubscribe'){$('#loading').show();
			$.ajax({ url: 'delete-subscribe-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}else if(urlNam=='sCategory' || urlNam=='dCategory'){
		var surl = '&ajax=true',  name = trim($('#name').val());
		if(name!=undefined && name!='undefined' && name!=''){ surl += '&name='+name; }
		if(urlNam=='sCategory'){$('#loading').show();
			$.ajax({ url: 'category?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='dCategory'){$('#loading').show();
			$.ajax({ url: 'delete-category-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}else if(urlNam=='sAdmin' || urlNam=='sUser' || urlNam=='vUser' || urlNam=='dUser' || urlNam=='dAdmin'){
		var surl = '&ajax=true', centerId = trim($('#centerId').val()), name = trim($('#name').val()), email = trim($('#email').val()),
		phone = trim($('#phone').val()), ssoId = trim($('#ssoId').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		if(centerId!=undefined && centerId!='undefined' && centerId!=''){ surl += '&centerId='+centerId; }
		if(name!=undefined && name!='undefined' && name!=''){ surl += '&name='+name; }
		if(email!=undefined && email!='undefined' && email!=''){ surl += '&email='+email; }
		if(phone!=undefined && phone!='undefined' && phone!=''){ surl += '&phone='+phone; }
		if(ssoId!=undefined && ssoId!='undefined' && ssoId!=''){ surl += '&ssoId='+ssoId; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }		
		if(urlNam=='sAdmin'){$('#loading').show();
			$.ajax({ url: 'adminUser?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='sUser'){$('#loading').show();
			$.ajax({ url: 'user?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vUser'){$('#loading').show();
			$.ajax({ url : 'view-user-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dUser'){$('#loading').show();
			$.ajax({ url: 'delete-user-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='dAdmin'){$('#loading').show();
			$.ajax({ url: 'delete-adminUser-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}else if(urlNam=='sAuthor' || urlNam=='vAuthor' || urlNam=='dAuthor'){
		var surl = '&ajax=true';
		if(urlNam=='sAuthor'){$('#loading').show();
			$.ajax({ url: 'author?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vAuthor'){$('#loading').show();
			$.ajax({ url : 'view-author-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dAuthor'){$('#loading').show();
			$.ajax({ url: 'delete-author-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}else if(urlNam=='sFaq' || urlNam=='vFaq' || urlNam=='dFaq'){
		var surl = '&ajax=true', title = trim($('#title').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		if(title!=undefined && title!='undefined' && title!=''){ surl += '&title='+title; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sFaq'){$('#loading').show();
			$.ajax({ url: 'adminFaq?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vFaq'){$('#loading').show();
			$.ajax({ url : 'view-faq-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dFaq'){$('#loading').show();
			$.ajax({ url: 'delete-faq-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}else if(urlNam=='sContactus' || urlNam=='vContactus' || urlNam=='dContactus'){
		var surl = '&ajax=true', name = trim($('#name').val()), phone = trim($('#phone').val()), 
		emailId = trim($('#emailId').val());
		if(name!=undefined && name!='undefined' && name!=''){ surl += '&name='+name; }
		if(phone!=undefined && phone!='undefined' && phone!=''){ surl += '&phone='+phone; }
		if(emailId!=undefined && emailId!='undefined' && emailId!=''){ surl += '&emailId='+emailId; }
		if(urlNam=='sContactus'){$('#loading').show();
			$.ajax({ url: 'adminContact?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vContactus'){$('#loading').show();
			$.ajax({ url : 'view-contactUs-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dContactus'){$('#loading').show();
			$.ajax({ url: 'delete-contactUs-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}else if(urlNam=='sIssueReport' || urlNam=='vIssueReport' || urlNam=='iIssueReport'){
		var surl = '&ajax=true', userId = trim($('#userId').val()), questionId = trim($('#questionId').val()), 
		emailId = trim($('#emailId').val()), description = trim($('#description').val()), 
		active = trim($('#active').val()), fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		
		if(userId!=undefined && userId!='undefined' && userId!=''){ surl += '&userId='+userId; }
		if(questionId!=undefined && questionId!='undefined' && questionId!=''){ surl += '&questionId='+questionId; }
		if(emailId!=undefined && emailId!='undefined' && emailId!=''){ surl += '&emailId='+emailId; }
		if(description!=undefined && description!='undefined' && description!=''){ surl += '&description='+description; }
		if(active!=undefined && active!='undefined' && active!=''){ surl += '&active='+active; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		if(urlNam=='sIssueReport'){$('#loading').show();
			$.ajax({ url: 'issueReport?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vIssueReport'){$('#loading').show();
			$.ajax({ url : 'view-issueReport-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); MathJax.Hub.Queue([ "Typeset", MathJax.Hub, 'view' ]); }).fail(function(data) { showError(data); });
		}else if(urlNam=='iIssueReport'){$('#loading').show();
			$.ajax({ url: 'inActivate-issueReport-'+id+'?pno='+pno+surl, context: document.body }).done(function(data){ $('#table').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} else if(urlNam=='sRegion' || urlNam=='vRegion' || urlNam=='dRegion'){
		var surl = '&ajax=true', countryId = trim($('#scountryId').val()), regionName = trim($('#regionName').val()),
		regionUrl = trim($('#regionUrl').val()), isActive = trim($('#isActive').val()),
		sortBy = trim($('#sortBy').val()), sortOrder = trim($('#sortOrder').val()),
		fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		
		if(countryId!=undefined && countryId!='undefined' && countryId!=''){ surl += '&countryId='+countryId; }
		if(regionName!=undefined && regionName!='undefined' && regionName!=''){ surl += '&regionName='+regionName; }
		if(regionUrl!=undefined && regionUrl!='undefined' && regionUrl!=''){ surl += '&regionUrl='+regionUrl; }
		if(isActive!=undefined && isActive!='undefined' && isActive!=''){ surl += '&isActive='+isActive; }
		if(sortBy!=undefined && sortBy!='undefined' && sortBy!=''){ surl += '&sortBy='+sortBy; }
		if(sortOrder!=undefined && sortOrder!='undefined' && sortOrder!=''){ surl += '&sortOrder='+sortOrder; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		
		if(urlNam=='sRegion'){$('#loading').show();
			$.ajax({ url: 'list-regions', type: "POST", data: 'pno='+pno+surl, context: document.body }).done(function(data){ $('#regions-list').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vRegion'){$('#loading').show();
			$.ajax({ url : 'view-region-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dRegion'){$('#loading').show();
			$.ajax({ url: 'delete-region-'+id, type: "POST", data: 'pno='+pno+surl, context: document.body }).done(function(data){ $('#regions-list').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} else if(urlNam=='sState' || urlNam=='vState' || urlNam=='dState'){
		var surl = '&ajax=true', countryId = trim($('#countryId').val()), regionId = trim($('#regionId').val()),
		stateName = trim($('#stateName').val()), stateUrl = trim($('#stateUrl').val()),
		isActive = trim($('#isActive').val()), isActive = trim($('#isActive').val()),
		sortBy = trim($('#sortBy').val()), sortOrder = trim($('#sortOrder').val()),
		fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		
		if(countryId!=undefined && countryId!='undefined' && countryId!=''){ surl += '&countryId='+countryId; }
		if(regionId!=undefined && regionId!='undefined' && regionId!=''){ surl += '&regionId='+regionId; }
		if(stateName!=undefined && stateName!='undefined' && stateName!=''){ surl += '&stateName='+stateName; }
		if(stateUrl!=undefined && stateUrl!='undefined' && stateUrl!=''){ surl += '&stateUrl='+stateUrl; }
		if(isActive!=undefined && isActive!='undefined' && isActive!=''){ surl += '&isActive='+isActive; }
		if(sortBy!=undefined && sortBy!='undefined' && sortBy!=''){ surl += '&sortBy='+sortBy; }
		if(sortOrder!=undefined && sortOrder!='undefined' && sortOrder!=''){ surl += '&sortOrder='+sortOrder; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		
		if(urlNam=='sState'){$('#loading').show();
			$.ajax({ url: 'list-states', type: "POST", data: 'pno='+pno+surl, context: document.body }).done(function(data){ $('#states-list').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vState'){$('#loading').show();
			$.ajax({ url : 'view-state-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dState'){$('#loading').show();
			$.ajax({ url: 'delete-state-'+id, type: "POST", data: 'pno='+pno+surl, context: document.body }).done(function(data){ $('#states-list').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} else if(urlNam=='sCity' || urlNam=='vCity' || urlNam=='dCity'){
		var surl = '&ajax=true', countryId = trim($('#countryId').val()), regionId = trim($('#regionId').val()),
		stateId = trim($('#stateId').val()), cityName = trim($('#cityName').val()),
		cityUrl = trim($('#cityUrl').val()), isActive = trim($('#isActive').val()),
		sortBy = trim($('#sortBy').val()), sortOrder = trim($('#sortOrder').val()),
		fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		
		if(countryId!=undefined && countryId!='undefined' && countryId!=''){ surl += '&countryId='+countryId; }
		if(regionId!=undefined && regionId!='undefined' && regionId!=''){ surl += '&regionId='+regionId; }
		if(stateId!=undefined && stateId!='undefined' && stateId!=''){ surl += '&stateId='+stateId; }
		if(cityName!=undefined && cityName!='undefined' && cityName!=''){ surl += '&cityName='+cityName; }
		if(cityUrl!=undefined && cityUrl!='undefined' && cityUrl!=''){ surl += '&cityUrl='+cityUrl; }
		if(isActive!=undefined && isActive!='undefined' && isActive!=''){ surl += '&isActive='+isActive; }
		if(sortBy!=undefined && sortBy!='undefined' && sortBy!=''){ surl += '&sortBy='+sortBy; }
		if(sortOrder!=undefined && sortOrder!='undefined' && sortOrder!=''){ surl += '&sortOrder='+sortOrder; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		
		if(urlNam=='sCity'){$('#loading').show();
			$.ajax({ url: 'list-cities', type: "POST", data: 'pno='+pno+surl, context: document.body }).done(function(data){ $('#cities-list').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vCity'){$('#loading').show();
			$.ajax({ url : 'view-city-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dCity'){$('#loading').show();
			$.ajax({ url: 'delete-city-'+id, type: "POST", data: 'pno='+pno+surl, context: document.body }).done(function(data){ $('#cities-list').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	} else if(urlNam=='sCenters' || urlNam=='vCenter' || urlNam=='dCenter'){
		var surl = '&ajax=true', centerDisplayName = trim($('#centerDisplayName').val()),
		addressLine = trim($('#addressLine').val()), email = trim($('#email').val()),
		phoneno = trim($('#phoneno').val()), zipcode = trim($('#zipcode').val()),
		fromDate = trim($('#fromDate').val()), toDate = trim($('#toDate').val());
		
		if(centerDisplayName!=undefined && centerDisplayName!='undefined' && centerDisplayName!=''){ surl += '&centerDisplayName='+centerDisplayName; }
		if(addressLine!=undefined && addressLine!='undefined' && addressLine!=''){ surl += '&addressLine='+addressLine; }
		if(email!=undefined && email!='undefined' && email!=''){ surl += '&email='+email; }
		if(phoneno!=undefined && phoneno!='undefined' && phoneno!=''){ surl += '&phoneno='+phoneno; }
		if(zipcode!=undefined && zipcode!='undefined' && zipcode!=''){ surl += '&zipcode='+zipcode; }
		if(fromDate!=undefined && fromDate!='undefined' && fromDate!=''){ surl += '&fromDate='+fromDate; }
		if(toDate!=undefined && toDate!='undefined' && toDate!=''){ surl += '&toDate='+toDate; }
		
		if(urlNam=='sCenters'){$('#loading').show();
			$.ajax({ url: 'center', type: "POST", data: 'pno='+pno+surl, context: document.body }).done(function(data){ $('#centers-list').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}else if(urlNam=='vCenter'){$('#loading').show();
			$.ajax({ url : 'view-center-'+id+'?pno='+pno+surl, context : document.body }).done(function(data) { $('#view').html(data); $('#loading').hide(); $('#view').show(); }).fail(function(data) { showError(data); });
		}else if(urlNam=='dCenter'){$('#loading').show();
			$.ajax({ url: 'delete-center-'+id, type: "POST", data: 'pno='+pno+surl, context: document.body }).done(function(data){ $('#centers-list').html(data);$('#loading').hide(); }).fail(function(data){ showError(data);$('#loading').hide(); });
		}
	}
}

//Toss Type
function getTossType() {
	try {
		$.ajax({
			type : 'GET',
			url : "addTossType",
			success : function(data) {
				// alert('data:=>'+data);
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}

		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function saveTossType() {
	try {
		var errMsg = '';

		var typeid = trim($('#typeid').val());

		var name = trim($('#name').val());
		
		var description = trim($('#description').val());
		
		if (typeid == undefined || typeid == 'undefined' || typeid == '') {
			errMsg += '<li>Please Provide Toss Type ID !!\n</li>';
		}
		if (name == undefined || name == 'undefined'
				|| name == '') {
			errMsg += '<li>Please Provide Toss Type Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Toss Type Description !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#tossTypeForm").submit();
			
		}
	} catch (e) {
		return false;
	}
}

function openEditTossTypeInfo(id) {
	
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openEditTossType?id=" + id,
			success : function(data) {
				// alert(data);
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function updateTossTypeSubmit(){
	
try{
		
		var errMsg = '';
		
		var name = trim($('#name').val());
		var typeid = trim($('#typeid').val());
		var description = trim($('#description').val());
		
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (typeid == undefined || typeid == 'undefined'
				|| typeid == '') {
			errMsg += '<li>Please Provide typeid !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			
		$("#tossTypeForm").submit();
 
		}
		
	} catch (e) {
		alert(e);
		return false;
	}

}

function openDeleteTossType(id){
	
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openDeleteTossType?id=" + id,
			success : function(data) {
				// alert(data);
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}

function deleteTossType() {
	try {
			
		$("#deleteTossTypeForm").submit();
			
	} catch (e) {
		alert(e);
		return false;
	}
}

function viewTossTypeInfo(id) {
	try {
		//alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "viewTossTypeInfo?id=" + id,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

// Toss
function getToss() {
	try {
		$.ajax({
			type : 'GET',
			url : "addToss",
			success : function(data) {
				//alert('data:=>'+data);
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}

		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function saveToss() {
	try {
		var errMsg = '';

		var name = trim($('#name').val());

		var description = trim($('#description').val());

		var tossType = trim($('#tossType').val());

		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (tossType == undefined || tossType == 'undefined'
				|| tossType == '') {
			errMsg += '<li>Please Select Toss Type !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#tossForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function viewTossInfo(id) {
	try {
		//alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "viewTossInfo?id=" + id,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function openEditTossInfo(id) {
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openEditToss?id=" + id,
			success : function(data) {
				// alert(data);
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function updateTossSubmit() {
	//alert("Inside updateTossTest function");
	try{
		var errMsg = '';
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		var tossType = trim($('#tossType').val());
		//alert(name+" \n"+description+"\n"+tossType);
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (tossType == undefined || tossType == 'undefined'
				|| tossType == '') {
			errMsg += '<li>Please Select Toss Type !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {	
			$("#tossForm").submit();
		}
	} catch (e) {
		alert(e);
		return false;
	}
}
function openDeleteToss(id) {
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openDeleteToss?id=" + id,
			success : function(data) {
				// alert(data);
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}
function deleteToss() {
	try {	
		$("#deleteTossForm").submit();	
	} catch (e) {
		alert(e);
		return false;
	}
}
// Utensil

function searchUtensil() {
	try {
		var errMsg = '';
		var name = trim($('#utensilSearchName').val());
		var status = trim($('#utensilSearchStatus').val());
		var utensilType = trim($('#utensilSearchType').val());
		$('#loading').show();
		$.ajax({
			type : 'POST',
			url : $('#utensilSearchForm').attr('action'),
			data : $("#utensilSearchForm").serialize()
		}).done(function(data) {
			$('#loading').hide();
			$('#utensilGrid').html(data);
		}).fail(function(data) {
			showError(data);
		});
	} catch (e) {
		return false;
	}
}

function getUtensil() {
	try {
		$.ajax({
			type : 'GET',
			url : "addUtensil",
			success : function(data) {
				// alert('date:=>'+data);
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}

		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function saveUtensil() {
	try {
		var errMsg = '';

		var name = trim($('#name').val());

		var description = trim($('#description').val());

		var utensilType = trim($('#utensilType').val());

		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (utensilType == undefined || utensilType == 'undefined'
				|| utensilType == '') {
			errMsg += '<li>Please Select Utensil Type !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#utensilForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function viewUtensilInfo(id) {
	try {
		//alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "viewUtensilInfo?id=" + id,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function updateUtensilSubmit() {
	
	//alert("Inside updateUtensilTest function");
	
	try{
		
		var errMsg = '';
		
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		var utensilType = trim($('#utensilType').val());
		
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (utensilType == undefined || utensilType == 'undefined'
				|| utensilType == '') {
			errMsg += '<li>Please Select Utensil Type !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			
		$("#utensilForm").submit();
 
		}
		
	} catch (e) {
		alert(e);
		return false;
	}
	
	
}


function openEditUtensilInfo(id) {
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openEditUtensil?id=" + id,
			success : function(data) {
				// alert(data);
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function updateUtensil() {
	try {
		var errMsg = '';
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		var utensilType = trim($('#utensilType').val());
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (utensilType == undefined || utensilType == 'undefined'
				|| utensilType == '') {
			errMsg += '<li>Please Select Utensil Type !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#utensilForm").submit();
		} 
		
	} catch (e) {
		return false;
	}
}

function openDeleteUtensil(id) {
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openDeleteUtensil?id=" + id,
			success : function(data) {
				// alert(data);
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function deleteUtensil() {
	try {
			
		$("#deleteUtensilForm").submit();
			
	} catch (e) {
		alert(e);
		return false;
	}
}

function openUtensilStatus(id, status) {
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openUtensilStatus?id=" + id + "&status=" + status,
			success : function(data) {
				$('#activeModal').html(data);
				$('#activeModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function updateUtensilStatus(id) {
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "updateUtensilStatus?id=" + id,
			success : function(data) {
				$('#utensilGrid').html(data);
				$('#utensilGrid').show();
				$('#activeModal').html('').css({
					display : 'none'
				});
				$('.modal-backdrop').remove();
				$('#activeModal').addClass('bg-blur');
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

//Utensil Type
function getUtensilType() {
	try {
		$.ajax({
			type : 'GET',
			url : "addUtensilType",
			success : function(data) {
				// alert('date:=>'+data);
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}

		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function saveUtensilType() {
	try {
		var errMsg = '';

		var typeid = trim($('#typeid').val());

		var name = trim($('#name').val());

		if (typeid == undefined || typeid == 'undefined' || typeid == '') {
			errMsg += '<li>Please Provide Utensil Type ID !!\n</li>';
		}
		if (name == undefined || name == 'undefined'
				|| name == '') {
			errMsg += '<li>Please Provide Utensil Type Name !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#utensilTypeForm").submit();
			
		}
	} catch (e) {
		return false;
	}
}

function openEditUtensilTypeInfo(id) {
	
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openEditUtensilType?id=" + id,
			success : function(data) {
				// alert(data);
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}


function updateUtensilTypeSubmit(){
	
try{
		
		var errMsg = '';
		
		var name = trim($('#name').val());
		var typeid = trim($('#typeid').val());
		
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (typeid == undefined || typeid == 'undefined'
				|| typeid == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			
		$("#utensilTypeForm").submit();
 
		}
		
	} catch (e) {
		alert(e);
		return false;
	}

}

function openDeleteUtensilType(id){
	
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openDeleteUtensilType?id=" + id,
			success : function(data) {
				// alert(data);
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}

function deleteUtensilType() {
	try {
			
		$("#deleteUtensilTypeForm").submit();
			
	} catch (e) {
		alert(e);
		return false;
	}
}


//Stir
function getStir() {
	try {
		$.ajax({
			type : 'GET',
			url : "addStir",
			success : function(data) {
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		return false;
	}
}

function saveStir() {
	//alert("Inside Save Stir");
	try {
		var errMsg = '';

		var name = trim($('#name').val());
		//alert(name+" Testing");
		var description = trim($('#description').val());

		var stirType = trim($('#stirType').val());

		var videoLink = trim($('#videoLink').val());
		
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (stirType == undefined || stirType == 'undefined'
				|| stirType == '') {
			errMsg += '<li>Please Select Stir Type !!\n</li>';
		}
		if (videoLink == undefined || videoLink == 'undefined'
				|| videoLink == '') {
			errMsg += '<li>Please Enter Video Link !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#stirForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function viewStirInfo(id) {
	try {
		//alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "viewStirInfo?id=" + id,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function openEditStirInfo(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "openEditStir?id=" + id,
			success : function(data) {
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function updateStirSubmit() {
	try{
		var errMsg = '';
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		var stirType = trim($('#stirType').val());
		var videoLink = trim($('#videoLink').val());
		var status = trim($('#status').val());
		
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (stirType == undefined || stirType == 'undefined'
				|| stirType == '') {
			errMsg += '<li>Please Select Stir Type !!\n</li>';
		}
		if (videoLink == undefined || videoLink == 'undefined'
				|| videoLink == '') {
			errMsg += '<li>Please Select Video Link !!\n</li>';
		}
		if (status == undefined || status == 'undefined'
				|| status == '') {
			errMsg += '<li>Please Select Status !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {	
			$("#stirForm").submit();
		}
	} catch (e) {
		alert(e);
		return false;
	}
}

function openDeleteStir(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "openDeleteStir?id=" + id,
			success : function(data) {
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function deleteStir() {
	try {
			
		$("#deleteStirForm").submit();
			
	} catch (e) {
		alert(e);
		return false;
	}
}

//Bowl
function getBowl() {
	try {
		$.ajax({
			type : 'GET',
			url : "addBowl",
			success : function(data) {
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		return false;
	}
}

function saveBowl() {
	//alert("Inside Save Bowl");
	try {
		var errMsg = '';

		var name = trim($('#name').val());
		var description = trim($('#description').val());
		var bowlType = trim($('#bowlType').val());
		var maxvolume = trim($('#maxvolume').val());
		var status = trim($('#status').val());

		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (bowlType == undefined || bowlType == 'undefined'
				|| bowlType == '') {
			errMsg += '<li>Please Select Bowl Type !!\n</li>';
		}
		if (maxvolume == undefined || maxvolume == 'undefined'
				|| maxvolume == '') {
			errMsg += '<li>Please Enter Max Volume !!\n</li>';
		}
		if (status == undefined || status == 'undefined'
				|| status == '') {
			errMsg += '<li>Please Select Status !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#bowlForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function viewBowlInfo(id) {
	try {
		//alert("Inside viewBowlInfo Ajax function");
		$.ajax({
			type : 'GET',
			url : "viewBowlInfo?id=" + id,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function openDeleteBowl(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "openDeleteBowl?id=" + id,
			success : function(data) {
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function deleteBowl() {
	try {	
		$("#deleteBowlForm").submit();	
	} catch (e) {
		alert(e);
		return false;
	}
}

function openEditBowlInfo(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "openEditBowl?id=" + id,
			success : function(data) {
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}
function updateBowlSubmit() {
	try{
		var errMsg = '';

		var name = trim($('#name').val());
		var description = trim($('#description').val());
		var bowlType = trim($('#bowlType').val());
		var maxvolume = trim($('#maxvolume').val());
		var status = trim($('#status').val());

		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (bowlType == undefined || bowlType == 'undefined'
				|| bowlType == '') {
			errMsg += '<li>Please Select Bowl Type !!\n</li>';
		}
		if (maxvolume == undefined || maxvolume == 'undefined'
				|| maxvolume == '') {
			errMsg += '<li>Please Enter Max Volume !!\n</li>';
		}
		if (status == undefined || status == 'undefined'
				|| status == '') {
			errMsg += '<li>Please Select Status !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {	
			$("#bowlForm").submit();
		}
	} catch (e) {
		alert(e);
		return false;
	}
}

//Bowl Type
function getBowlType(){
		try {
		$.ajax({
			type : 'GET',
			url : "addBowlType",
			success : function(data) {
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		alert(e);
		return false;
	}
}

function saveBowlType(){
	try {
		var errMsg = '';
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		var status = trim($('#status').val());
		
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Stir Type Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined' || description == '') {
			errMsg += '<li>Please Provide Stir Type Description !!\n</li>';
		}
		if (status == undefined || status == 'undefined' || status == '') {
			errMsg += '<li>Please Provide Stir Type Status !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#bowlTypeForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function viewBowlTypeInfo(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "viewBowlTypeInfo?id=" + id,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function openEditBowlTypeInfo(id) {
	
	try {
		$.ajax({
			type : 'GET',
			url : "openEditBowlType?id=" + id,
			success : function(data) {
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function updateBowlTypeSubmit(){
			
	try{
		var errMsg = '';
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		var status = trim($('#status').val());
		
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (status == undefined || status == 'undefined'
				|| status == '') {
			errMsg += '<li>Please Select status !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			
		$("#bowlTypeForm").submit();
 
		}
		
	} catch (e) {
		alert(e);
		return false;
	}	
}

function openDeleteBowlType(id){
	
	try {
		// alert("Inside Ajax OpenDleteBowlType");
		$.ajax({
			type : 'GET',
			url : "openDeleteBowlType?id=" + id,
			success : function(data) {
				// alert(data);
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}

function deleteBowlType() {
	try {
			
		$("#deleteBowlTypeForm").submit();
			
	} catch (e) {
		alert(e);
		return false;
	}
}

//Stir type
function getStirType(){
	
		try {
		$.ajax({
			type : 'GET',
			url : "addStirType",
			success : function(data) {
				// alert('date:=>'+data);
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}

		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}

function saveStirType(){
	
	try {
		var errMsg = '';

		var stirTypeId = trim($('#stirTypeId').val());

		var name = trim($('#name').val());

		if (stirTypeId == undefined || stirTypeId == 'undefined' || stirTypeId == '') {
			errMsg += '<li>Please Provide Stir Type ID !!\n</li>';
		}
		if (name == undefined || name == 'undefined'
				|| name == '') {
			errMsg += '<li>Please Provide Stir Type Name !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#stirTypeForm").submit();
			
		}
	} catch (e) {
		return false;
	}
	
}


function openEditStirTypeInfo(id) {
	
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openEditStirType?id=" + id,
			success : function(data) {
				// alert(data);
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function updateStirTypeSubmit(){
		
try{
	
	//alert('updateStirTypeSubmit..');
		
		var errMsg = '';
		
		var name = trim($('#name').val());
		var stirTypeId = trim($('#stirTypeId').val());
		
		//alert('stirTypeId..'+stirTypeId);
		
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (stirTypeId == undefined || stirTypeId == 'undefined'
				|| stirTypeId == '') {
			errMsg += '<li>Please Provide stirTypeId !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			
		$("#stirTypeForm").submit();
 
		}
		
	} catch (e) {
		alert(e);
		return false;
	}
	
	
}


function openDeleteStirType(id){
	
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openDeleteStirType?id=" + id,
			success : function(data) {
				// alert(data);
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}

function deleteStirType() {
	try {
			
		$("#deleteStirTypeForm").submit();
			
	} catch (e) {
		alert(e);
		return false;
	}
}

function viewStirTypeInfo(id) {
	try {
		//alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "viewStirTypeInfo?id=" + id,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

//Ingredient
function getIngredient(){
	try {
		$.ajax({
			type : 'GET',
			url : "addIngredient",
			success : function(data) {
				// alert('date:=>'+data);
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}

		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}

function saveIngredient() {
	try {
		var errMsg = '';

		var name = trim($('#name').val());

		var description = trim($('#description').val());

		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}

		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#ingredientForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function openDispenseSettings(id){
	
	//alert('listDispenseSettings..'+id);
	
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "listDispenseSettings?id=" + id,
			success : function(data) {
				// alert(data);
				//$('#editModal').html(data);
				//$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ds' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}



function getDispenseSettings(id){
	
	try {
		$.ajax({
			type : 'GET',
			url : "addDispenseSettings?id=" + id,
			success : function(data) {
				// alert('date:=>'+data);
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}

		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}


function saveDispenseSettings(){
	
	//alert('saveDispenseSettings');
	
	try {
		var errMsg = '';

		var start = trim($('#start').val());

		var end = trim($('#end').val());

		if (start == undefined || start == 'undefined' || start == '') {
			errMsg += '<li>Please Provide Start !!\n</li>';
		}
		if (end == undefined || end == 'undefined'
				|| end == '') {
			errMsg += '<li>Please Provide End !!\n</li>';
		}

		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#dispenseSettingsForm").submit();
		}
	} catch (e) {
		return false;
	}
	
}

//openDeleteDispenseSettings

function openDeleteDispenseSettings(id, igid) {
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openDeleteDispenseSettings?id=" + id +"&igid="+igid,
			success : function(data) {
				// alert(data);
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}



function deleteDispenseSettings() {
	try {
			
		$("#deleteDispenseSettingsForm").submit();
			
	} catch (e) {
		alert(e);
		return false;
	}
}

function viewDispenseSettingsInfo(id, igid){
	try {
		//alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "viewDispenseSettingsInfo?id=" + id +"&igid="+igid ,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}


function openEditDispenseSettingsInfo(id, igid){
	
		try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openEditDispenseSettings?id=" + id +"&igid="+igid ,
			success : function(data) {
				// alert(data);
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error 1' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}




function updateDispenseSettingsSubmit() {
	
	try{
		
		var errMsg = '';
		
		var start = trim($('#start').val());
		var end = trim($('#end').val());
		//var IngredientType = trim($('#IngredientType').val());
		
		if (start == undefined || start == 'undefined' || start == '') {
			errMsg += '<li>Please Provide Start !!\n</li>';
		}
		if (end == undefined || end == 'undefined'
				|| end == '') {
			errMsg += '<li>Please Provide End !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			
		$("#dispenseSettingsForm").submit();
 
		}
		
	} catch (e) {
		alert(e);
		return false;
	}
	
	
}


function viewIngredientInfo(id){
	try {
		//alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "viewIngredientInfo?id=" + id,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}

function openEditIngredientInfo(id){
	
		try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openEditIngredient?id=" + id,
			success : function(data) {
				// alert(data);
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}


function updateIngredientSubmit() {
	
	//alert("Inside updateIngredientTest function");
	
	try{
		
		var errMsg = '';
		
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		//var IngredientType = trim($('#IngredientType').val());
		
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			
		$("#ingredientForm").submit();
 
		}
		
	} catch (e) {
		alert(e);
		return false;
	}
	
	
}

function openDeleteIngredient(id) {
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openDeleteIngredient?id=" + id,
			success : function(data) {
				// alert(data);
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}


function deleteIngredient() {
	try {
			
		$("#deleteIngredientForm").submit();
			
	} catch (e) {
		alert(e);
		return false;
	}
}

//listIngredients


//rack
function addRack() {
	try {
		$.ajax({
			type : 'GET',
			url : "addRack",
			success : function(data) {
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		return false;
	}
}

function saveRack() {
	try {
		var errMsg = '';
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		var rackId = trim($('#rackId').val());
		/*var maptoRobot = trim($('#maptoRobot').val());
		alert(maptoRobot);*/
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (maptoRobot == undefined || maptoRobot == 'undefined'
				|| maptoRobot == '') {
			errMsg += '<li>Please Provide Robo !!\n</li>';
		}
		if (rackId == undefined || rackId == 'undefined'
				|| rackId == '') {
			errMsg += '<li>Please Provide Rack Type!!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			alert("before form submission");
			$("#rackForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function viewRackInfo(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "viewRackInfo?id=" + id,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		return false;
	}
}

function updateRack() {
	try {
		var errMsg = '';
		var id = trim($('#id').val());
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		var rackId = trim($('#rackId').val());
		if (id == undefined || id == 'undefined' || id == '') {
			errMsg += '<li>Please Provide Id !!\n</li>';
		}
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (rackId == undefined || rackId == 'undefined'
				|| rackId == '') {
			errMsg += '<li>Please Select Rack Type !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#rackForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function openEditRackInfo(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "openEditRack?id=" + id,
			success : function(data) {
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		return false;
	}
}

function openDeleteRack(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "openDeleteRack?id=" + id,
			success : function(data) {
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		alert(e);
		return false;
	}
}

function deleteRack() {
	try {
		$("#deleteRackForm").submit();
	} catch (e) {
		alert(e)
		return false;
	}
}

//rack
function addBin() {
	try {
		$.ajax({
			type : 'GET',
			url : "addBin",
			success : function(data) {
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		return false;
	}
}

function saveBin() {
	try {
		var errMsg = '';
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		var rackId = trim($('#rack.id').val())
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#binForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function viewBinInfo(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "viewBinInfo?id=" + id,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		return false;
	}
}

function openDeleteBin(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "openDeleteBin?id=" + id,
			success : function(data) {
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		alert(e);
		return false;
	}
}

function updateBin() {
	try {
		var errMsg = '';
		var id = trim($('#id').val());
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		if (id == undefined || id == 'undefined' || id == '') {
			errMsg += '<li>Please Provide Id !!\n</li>';
		}
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#binForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function openEditBinInfo(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "openEditBin?id=" + id,
			success : function(data) {
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		return false;
	}
}

function deleteBin() {
	try {
		$("#deleteBinForm").submit();
	} catch (e) {
		alert(e)
		return false;
	}
}

function cookRecipe() {
	try {

		var errMsg = '';
		var recipeId = trim($('#recipeId').val());
		var burnerId = trim($('#burnerId').val());
		if (recipeId == undefined || recipeId == 'undefined' || recipeId == '') {
			errMsg += '<li>Please Select Recipe to Cook !!\n</li>';
		}
		if (burnerId == undefined || burnerId == 'undefined' || burnerId == '') {
			errMsg += '<li>Please Select Burner to Cook !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$.ajax({
				type : 'GET',
				url : "cooking/"+recipeId+"/"+burnerId,
				success : function(data) {
					$('#addModal').html(data);
					$('#addModal').show();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('error ' + errorThrown);
				}
			});
		}

	} catch (e) {
		return false;
	}
}


//fryer
function getFryer() {
	try {
		$.ajax({
			type : 'GET',
			url : "addFryer",
			success : function(data) {
				// alert('date:=>'+data);
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}

		});

	} catch (e) {
		alert(e);
		return false;
	}
}



function saveFryer() {
	try {
		var errMsg = '';

		var name = trim($('#name').val());

		var description = trim($('#description').val());

		

		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#fryerForm").submit();
		}
	} catch (e) {
		return false;
	}
}


function viewFryerInfo(id){
	try {
		//alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "viewFryerInfo?id=" + id,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}

function openEditFryerInfo(id){
	
		try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openEditFryer?id=" + id,
			success : function(data) {
				// alert(data);
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}



function updateFryerSubmit() {
	
	//alert("Inside updateUtensilTest function");
	
	try{
		
		var errMsg = '';
		
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		//var utensilType = trim($('#utensilType').val());
		
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		
		if (errMsg != '') {
			showError(errMsg);
		} else {
			
		$("#fryerForm").submit();
 
		}
		
	} catch (e) {
		alert(e);
		return false;
	}
	
	
}


function openDeleteFryer(id) {
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openDeleteFryer?id=" + id,
			success : function(data) {
				// alert(data);
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function deleteFryer(){
	try {
			
		$("#deleteFryerForm").submit();
			
	} catch (e) {
		alert(e);
		return false;
	}
}

function getSection() {
	try {
		$.ajax({
			type : 'GET',
			url : "addSection",
			success : function(data) {
				$('#addModal').html(data);
				$('#addModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		return false;
	}
}

function saveSection() {
	try {
		var errMsg = '';
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#sectionForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function openEditSectionInfo(id) {
	try {
		$.ajax({
			type : 'GET',
			url : "openEditSection?id=" + id,
			success : function(data) {
				$('#editModal').html(data);
				$('#editModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});
	} catch (e) {
		return false;
	}
}

function updateSection() {
	try {
		var errMsg = '';
		var id = trim($('#id').val());
		var name = trim($('#name').val());
		var description = trim($('#description').val());
		
		if (id == undefined || id == 'undefined' || id == '') {
			errMsg += '<li>Please Provide Id !!\n</li>';
		}
		if (name == undefined || name == 'undefined' || name == '') {
			errMsg += '<li>Please Provide Name !!\n</li>';
		}
		if (description == undefined || description == 'undefined'
				|| description == '') {
			errMsg += '<li>Please Provide Description !!\n</li>';
		}
		if (errMsg != '') {
			showError(errMsg);
		} else {
			$("#sectionForm").submit();
		}
	} catch (e) {
		return false;
	}
}

function viewSectionInfo(id){
	try {
		$.ajax({
			type : 'GET',
			url : "viewSectionInfo?id=" + id,
			success : function(data) {
				$('#viewModal').html(data);
				$('#viewModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
	
}

function openDeleteSection(id) {
	try {
		// alert("Inside Ajax function");
		$.ajax({
			type : 'GET',
			url : "openDeleteSection?id=" + id,
			success : function(data) {
				// alert(data);
				$('#deleteModal').html(data);
				$('#deleteModal').show();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('error ' + errorThrown);
			}
		});

	} catch (e) {
		alert(e);
		return false;
	}
}

function deleteSection(){
	try {
		$("#deleteSectionForm").submit();
			
	} catch (e) {
		alert(e);
		return false;
	}
}



function showError(message) {
	try {
		$('#eMsg').html(message);
		$('#failure').addClass('in').show();
	} catch (e) {
		alert(e);
	}
}

function showSucess(message) {
	$('#sMsg').html(message);
	$('#success').addClass('in').show();
}
