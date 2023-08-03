/**
 * 
 */

document.addEventListener('DOMContentLoaded', function() {
	var elems = document.querySelectorAll('.title-action-btn');
	var instances = M.FloatingActionButton.init(elems, {
		direction : 'left'
	});
});

document.addEventListener('DOMContentLoaded', function() {
	var elems = document.querySelectorAll('.title-tooltip');
	var instances = M.Tooltip.init(elems, {
		position: 'bottom'
	});
});

document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.carousel');
    var instances = M.Carousel.init(elems, {
        fullWidth: true,
        indicators: true
    });
});