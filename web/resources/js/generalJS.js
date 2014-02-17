$(document).ready(function() {
    
        //left bar tooltips
        $(".message").addClass("messageHide");
        $("#lMenu li").hover(function(){
                $(this).css({"cursor": "pointer"});
		$(this).children("a").animate({"opacity":0.5,"margin-left":5},300);
                $(this).children(".message").addClass("messageShow").removeClass("messageHide");
	}, function(){
		$(this).children("a").animate({"opacity":1,"margin-left":0},300);
                $(this).children(".message").addClass("messageHide").removeClass("messageShow");
	});
        //end of left bar tooltips
        
        //table rows highlight and del button
        $(".del").addClass("delHide");
        
        var $prevTColor = $("#empTable table tr td").css("background-color");
        $("#empTable table tr:nth-child(1n+2)").hover( function(){
            $(this).children("td").css({"background-color":"#FFFFBD"});
            var $width = $(this).children("td:last").css("width");
            var $top = $(this).children("td:last").css("top");
            $(this).find("td .del").addClass("delShow").removeClass("delHide").css({"margin-left":$width,"top":($top+20)}).click(
                    function(){
                        var $id = $(this).closest("tr").children("#ID").html();
                        //alert("id:"+$id);
                        $.post(
                            "./ajaxDel.htm",
                            {
                              id: $id
                            } , function() { location.reload(); }
                          );
                    });
        }, function(){
            $(this).children("td").css({"background-color":$prevTColor});
            $(this).find("td .del").addClass("delHide").removeClass("delShow");
        });
        //end of table rows highlight
        
        //table cells edit
        $("#empTable table tr:nth-child(1n+2) td").dblclick(
              function(){  
                var $curVal = $(this).html(); 
                var $id = $(this).parent().children("#ID").html();
                var $column = $(this).closest('table').find('tr:nth-child(1) td').eq($(this).index()).html();
                
                $(this).html("<input type='text' class='edit' value='"+$curVal+"'></input>");
                $(this).focus();
                $(this).children(".edit").keypress(function(e) {
                    if(e.which == 13) {
                        $.post(
                            "./ajaxUpd.htm",
                            {
                              id: $id,
                              key: $column,
                              value: $(this).closest(".edit").val()
                            } , function() { location.reload(); }
                          );
                    }
                });
            }
        );
        //end of table cells edit
});