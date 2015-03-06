// JavaScript Document
	$(document).ready(function(){
		// hide #back-top first
		$("#back-top").hide();
		// fade in #back-top
		$(function () {
			$(window).scroll(function () {
				if ($(this).scrollTop() > 100) {
					$('#back-top').fadeIn();
				} else {
					$('#back-top').fadeOut();
				}
			});
			// scroll body to 0px on click
			$('#back-top a').click(function () {
				$('body,html').animate({
					scrollTop: 0
				}, 800);
				return false;
			});
		});
		$(".scroll").click(function(event) {
			$('html,body').animate({ scrollTop: $(this.hash).offset().top }, 500);
		});
	});	
		
var height =  $(document).height();
jQuery("#left-column").css({"height":height + 'px'});
jQuery('#left-column').css({"height":height-58});

var height =  $(document).height();
jQuery("#boxLogin").css({"height":height + 'px'});
jQuery('#boxLogin').css({"height":height-0});