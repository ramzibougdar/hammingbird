$(document).ready(function() {
	$('#cookies_settings_form .all-modules .form-switch input[type="checkbox"]').on('change', function() {
		$("#cookies_settings_form .module-blocked-categories input:checkbox").prop('checked', $(this).prop("checked"));
	});
	
});