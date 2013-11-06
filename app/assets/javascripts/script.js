$(document).ready(function(){
	$('ul li a').hover(function() {
		$(this).css('outline-color', '#FF0000');
	});
	
	$(' ul li a').mouseenter(function() {
		$(this).fadeTo('fast', 1);
	});
	
	$('ul li a').mouseleave(function() {
		$(this).fadeTo('fast', .75);
	});
	

});