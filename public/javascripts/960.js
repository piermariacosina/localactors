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
	
	function fitMap() {
		var slides_width =  $('#slides').css("width");
		$('#slides ul li').css("width",slides_width);
		var slides_height =  $('#slides ul li:first-child').css("height");
		$('#slides').css('height',slides_height);
	}

	fitMap();
	showFirst();

	for (var i=0;i<arSteps.length;i++){
		(function(slide,step) {
			step.click(function(){
				if (step == step1){
					hideRest(step,1);
					showSelected(step);
				}else if(step == step2){
					hideRest(step,1);
					showSelected(step);
					slide.delay(500).fadeIn("slow", showSelected(step));
				}else{
					slide.delay(500).fadeIn("slow", showSelected(step));
				}
			});
		})(arSlides[i],arSteps[i]);
	}

	function showFirst(){
		slide1.fadeIn("slow", showSelected(step1));
		hideRest(slide1,0);
	}

	function hideRest(selected,offset){
		for (var i=offset;i<arSlides.length;i++){
			(function(slide) {
				if (selected == slide){

				}else{
					slide.fadeOut("slow");
				}
			})(arSlides[i]);
		}
	}

	function showSelected(selected){
		for (var i=0;i<arSteps.length;i++){
			(function(step) {
				if (selected == step){
					step.addClass("selected");
				}else{
					step.removeClass("selected");
				}
			})(arSteps[i]);
		}	
	}

});