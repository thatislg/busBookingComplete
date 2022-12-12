//route search result data table //
$(document).ready(function () {
		 $.extend( $.fn.dataTable.defaults, {
	            language: { url: "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Japanese.json" }
	        });		
		 $('#routeSearchResult').DataTable({
		        autoWidth: false,
		        columnDefs: [
		            {
		                targets: ['_all'],
		                className: 'mdc-data-table__cell',
		            },
		        ],
		 });
});
//reservation list data table //
$(document).ready(function () {
		 $.extend( $.fn.dataTable.defaults, {
	            language: { url: "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Japanese.json" }
	        });		
		 $('#reservationList').DataTable({
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
