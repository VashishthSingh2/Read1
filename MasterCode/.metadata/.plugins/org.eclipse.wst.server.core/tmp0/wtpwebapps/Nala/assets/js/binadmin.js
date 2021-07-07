
$ = jQuery.noConflict();
var http = getHTTPObject();
var calDiv = '';

/* Ajax Functionality */
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

$(function () {
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


//bin

function getBin() {
	try {
		//alert("Inside Ajax function");
		$.ajax({
  	        type: 'GET',
  	        url: "addBin",
  	        success: function(data){
  	        	//alert(data);
  	        	$('#addModal').html(data);
  	        	$('#addModal').show();
  	        },
  	        error:function(jqXHR, textStatus, errorThrown){
  	        	alert('error '+errorThrown);
  	        }

  	    });

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




