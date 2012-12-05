$(window).bind('resize', function(e)
{
    window.resizeEvt;
    $(window).resize(function()
    {
        clearTimeout(window.resizeEvt);
        window.resizeEvt = setTimeout(function()
        {
            fitMap();
			$( "#faq_accordion" ).accordion( "refresh" );
        }, 250);
    });
});

function fitMap() {
	var slides_width =  $('#slides').css("width");
	$('#slides ul li').css("width",slides_width);
}

$(document).ready(function() {
	$( "#sections_accordion" ).accordion({ header: "header", collapsible: true, heightStyle: "content", active: false  });
	$( "#faq_accordion" ).accordion({ header: "h3", collapsible: true, heightStyle: "content", active: false  });

	var step1 = $( "li.step1" );
	var step2 = $( "li.step2" );
	var step3 = $( "li.step3" );
	
	arSteps = [step1,step2,step3];
	
	var slide1 = $( "li.slide1" );
	var slide2 = $( "li.slide2" );
	var slide3 = $( "li.slide3" );
	
	arSlides = [slide1,slide2,slide3];
	
	var right_arrow = $( "#arrow_right" );
	var left_arrow = $( "#arrow_left" );
	
	var current = 0
	
	fitMap();
	showCurrentSlide(current);
	showCurrentStep(current);
	hideLeft();

	right_arrow.click(function(){
		current++;
		checkLimit(current);
		showCurrentSlide(current);
		left_arrow.css('visibility', 'visible');
	});
	
	left_arrow.click(function(){
		current--;
		checkLimit(current);
		showCurrentSlide(current);
		right_arrow.css('visibility', 'visible');
	});

	function checkLimit(reached){
		if (reached <= 0){
			current = 0
			hideLeft();
			hideRest(current,1)
		}
		
		if (reached == 1){
			hideRest(current,2)
		}
		
		if (reached == arSlides.length-1){
			current = arSlides.length-1;
			hideRight();		
		}
	}
	
	
	function hideRest(current,offset){
		for (var i=offset;i<arSlides.length;i++){
			(function(slide) {
				if (current != slide){
					slide.fadeOut("slow");
				}
			})(arSlides[i]);
		}
	}
	
	function hideLeft(){
		left_arrow.css('visibility', 'hidden');
		left_arrow.click(false);
	}
	
	function hideRight(){
		right_arrow.css('visibility', 'hidden');
		right_arrow.click(false);
	}
	
	
	function showCurrentSlide(current){
		arSlides[current].delay(500).fadeIn("slow");
	}
	
	function showCurrentStep(current){
		arSteps[current].delay(500).fadeIn("slow");
	}

});