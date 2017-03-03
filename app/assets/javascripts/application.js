// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
$(function() {
  $(window).scroll(function() {
    if ($(this).scrollTop() > 200) {
      $('#navbar').fadeIn(500);
    }
    else {
      $('#navbar').fadeOut(500);
    }
  });
	// Cache the Window object
	var $window = $(window);
	// Parallax Backgrounds
	// Tutorial: http://code.tutsplus.com/tutorials/a-simple-parallax-scrolling-technique--net-27641

	$('div[data-type="background"]').each(function(){
		var $bgobj = $(this); // assigning the object

		$(window).scroll(function() {

			// Scroll the background at var speed
			// the yPos is a negative value because we're scrolling it UP!
			var yPos = -($window.scrollTop() / $bgobj.data('speed'));

			// Put together our final background position
			var coords = '50% '+ yPos + 'px';

			// Move the background
			$bgobj.css({ backgroundPosition: coords });

      //Darkens the background on scroll down
      $('.background').css('filter', "brightness(" + (50 - (($window.scrollTop()/$window.height())*30)) + '%)');
      var contentScroll = ($window.scrollTop()/$window.height())*($window.height()/3);
      if( contentScroll < 300)
      $('.content').css('margin-top', contentScroll + 'px')
		}); // end window scroll
	});

  //Show nav on scroll
});
