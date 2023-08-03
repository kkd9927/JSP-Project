/**
 * 
 */

document.addEventListener('DOMContentLoaded', function() {
	var elems = document.querySelectorAll('.navbar-action-btn');
	var instances = M.FloatingActionButton.init(elems, {
		direction: 'bottom',
		hoverEnabled: false
	});
});

document.addEventListener('DOMContentLoaded', function() {
	var elems = document.querySelectorAll('.nav-tooltip');
	var instances = M.Tooltip.init(elems, {
		position: 'left'
	});
});