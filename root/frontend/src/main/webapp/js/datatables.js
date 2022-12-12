// data table //
$(document).ready(function () {
		 $.extend( $.fn.dataTable.defaults, {
	            language: { url: "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Japanese.json" }
	        });		
		 $('#dataTable').DataTable({
				"order": [[5, "desc"]],
		        autoWidth: false,
		        columnDefs: [
		            {
		                targets: ['_all'],
		                className: 'mdc-data-table__cell',
		            },
		        ],
		 });
});
