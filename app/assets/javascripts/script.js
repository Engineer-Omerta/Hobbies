$("document").ready(function(){
	$(".theTarget").skippr({
	transition: 'fade',
	speed: 500,
	easing: 'easeOutQuart',
	navType: 'bubble',
	childrenElementType: 'div',
	arrows: true,
	autoPlay: true,
	autoPlayDuration: 5000,
	keyboardOnAlways: true,
	hidePrevious: false
	});
});

