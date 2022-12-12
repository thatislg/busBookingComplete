let navbarDiv = document.querySelector('.navbar');
window.addEventListener('scroll', ()=>{
	if(document.body.scrollTop > 40 || document.documentElement.scrollTop > 40){
		navbarDiv.classList.add('navbar-cng');
	}else{
		navbarDiv.classList.remove('navbar-cng');
	}
});

// stop transition and animation during window resizing //
let resizeTimer;
window.addEventListener('resize', () => {
	document.body.classList.add("resize-animation-stopper");
	clearTimeout(resizeTimer);
	resizeTimer = setTimeout(() => {
		document.body.classList.remove("resize-animation-stopper");
	}, 400);
});

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
