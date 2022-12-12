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