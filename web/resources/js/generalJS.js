$(document).ready(function() {
    
        $("#lMenu li").hover(function(){
                $(this).css({"cursor": "pointer"});
		$(this).children("a").animate({"opacity":0.5,"margin-left":5},300);
                $("message").css({"display":"block"});
	}, function(){
		$(this).children("a").animate({"opacity":1,"margin-left":0},300);
	});
});