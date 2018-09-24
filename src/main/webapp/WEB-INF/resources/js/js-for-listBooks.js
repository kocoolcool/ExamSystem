function addExam() {
	$('#examDialog').dialog("option", "title", 'Add Exam');
	$('#examDialog').dialog('open');
}

function editExam(id) {

	$.get("get/" + id, function(result) {

		$("#examDialog").html(result);

		$('#examDialog').dialog("option", "title", 'Edit Exam');

		$("#examDialog").dialog('open');

		initializeDatePicker();
	});
}

function initializeDatePicker() {
	$(".datepicker").datepicker({
		dateFormat : "yy-mm-dd",
		changeMonth : true,
		changeYear : true,
		showButtonPanel : true
	});
}

function resetDialog(form) {

	form.find("input").val("");
}

$(document).ready(function() {

	$('#examDialog').dialog({

		autoOpen : false,
		position : 'center',
		modal : true,
		resizable : false,
		width : 440,
		buttons : {
			"Save" : function() {
				$('#examForm').submit();
			},
			"Cancel" : function() {
				$(this).dialog('close');
			}
		},
		close : function() {

			resetDialog($('#examForm'));

			$(this).dialog('close');
		}
	});

	initializeDatePicker();
});
