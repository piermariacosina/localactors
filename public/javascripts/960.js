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

	
	$( "input#mail_submit" ).click(function(event){
			event.preventDefault();
			email = $("input#email").val();
			list = $("input#mail_list").val();
			$.ajax({
				data: {email: email, list: list, boolean: true},
				dataType: "html",
				url: "http://thedoersproject.com/mailinglist/subscribe",
				type: "post",
				success: function(response){
						switch (response){
							case "1":
								showFlashMessage("success","success");
							break;
							case "Some fields are missing.":
								showFlashMessage(response,"error");
							break;
							case "Invalid email address.":
								showFlashMessage(response,"error");
							break;
							case "Already subscribed.":
								showFlashMessage(response,"notice");
							break;
							
						}
					},
				error: function(jqXHR, textStatus, errorThrown){
					
						console.log(textStatus)
						
					}
						
				
			});
		});
	
	
	var subscribe = $("a.subscribe");
	var ask = $("a.ask");
	var submit = $("a.submit");
	
	subscribe.click(function(event) {
		var mailingDiv = $("#mailing-list");
		if(mailingDiv.length != 0){
			event.preventDefault();
			$(window).scrollTo( mailingDiv,600);
			$( "#sections_accordion" ).accordion('activate' , 0);
		}
	});
	
	ask.click(function(event) {
		var askDiv = $("#faq");
		if(askDIv.length != 0){
			event.preventDefault();
			$(window).scrollTo( askDiv,600);
			$( "#sections_accordion" ).accordion('activate' , 1);
		}
	});
	
	submit.click(function(event) {
		var submitDiv = $("#submit-project");
		if(submitDiv.length != 0){
			event.preventDefault();
			$(window).scrollTo( submitDiv,600);
			$( "#sections_accordion" ).accordion('activate' , 2);
		}
	});
	
	
	
	function showFlashMessage(msg, type){
		flushFlashMessages();
		var form = $('form#mail_form')
		if("notice"==type){
		 $('<div class="'+type+'"><div class="box"><span class="symbol"><i>V</i></span><span class="msg">'+msg+'</span></div></div>').hide().prependTo(form).fadeIn();
	 }else if("success"==type){
		 $('<div class="'+type+'"><div class="box"><span class="symbol"><i>V</i></span><span class="msg">'+msg+'</span></div></div>').hide().prependTo(form).fadeIn();
	 }else if("error"==type){
		 $('<div class="'+type+'"><div class="box"><span class="symbol"><i>V</i></span><span class="msg">'+msg+'</span></div></div>').hide().prependTo(form).fadeIn();
	 }	
	}
	
	function flushFlashMessages(){
		$('form#mail_form .notice').remove();
		$('form#mail_form .error').remove();
		$('form#mail_form .success').remove();
	}
	

	
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