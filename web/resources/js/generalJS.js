$(document).ready(function() {
    
        $(".message").addClass("messageHide");
    
        $("#lMenu li").hover(function(){
                $(this).css({"cursor": "pointer"});
		$(this).children("a").animate({"opacity":0.5,"margin-left":5},300);
                $(this).children(".message").addClass("messageShow").removeClass("messageHide");
	}, function(){
		$(this).children("a").animate({"opacity":1,"margin-left":0},300);
                $(this).children(".message").addClass("messageHide").removeClass("messageShow");
	});
});