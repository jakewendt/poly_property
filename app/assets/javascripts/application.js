// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .




jQuery(function(){

//
// perhaps make this 'div.facet_toggle *' so as to include the span triangle icon?
//
	jQuery('div.facet_toggle a').click(function(){
//		jQuery(this).parent().next().toggle(500);
//  added 'blind' so doesn't resize stuff and just slides in.
//	be advised that this effect temporarily wraps the target in a div until done.
		jQuery(this).parent().next().toggle('blind',500);
		jQuery(this).prev().toggleClass('ui-icon-triangle-1-e');
		jQuery(this).prev().toggleClass('ui-icon-triangle-1-s');
//	jQuery(this).parent().toggleClass('open');
		return false;
	});

});
