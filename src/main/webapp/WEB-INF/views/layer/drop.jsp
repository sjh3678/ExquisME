<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:import url="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
#img1 {
    width:150px;
    height: 150px;
    border: dotted 1px black;
    text-align: center;
}
</style>
 <script type="text/javascript">
	$(function(){  
		//Make every clone image unique.  
	 	var counts = [0];
		var resizeOpts = {
			handles: "all" ,autoHide:true
		};    
		
	 	$(".perf_pic").draggable({
	 		helper: "clone",
	 		//Create counter
		
	 		start: function() { counts[0]++; }
	 	});

		$("#img1").droppable({
			drop: function(e, ui){
				console.log("#img1 dropped")
				var length = counts.length
				console.log($("#img1").children().length)
				if(ui.draggable.hasClass("perf_pic")) {
					if ($("#img1").children().length > 0) {
						$("#img1").children().remove()
					}
					$(this).append($(ui.helper).clone());
		   
					//Pointing to the dragImg class in dropHere and add new class.
					$("#img1 .perf_pic").addClass("item-"+counts[0]);
					$("#img1 .perf_img").addClass("perf_imgSize-"+counts[0]);
					
					//Remove the current class (ui-draggable and dragImg)
					$("#img1 .item-"+counts[0]).removeClass("perf_pic ui-draggable ui-draggable-dragging");
					
					$(".item-"+counts[0]).dblclick(function() {
						$(this).remove();
					});     
					make_draggable($(".item-"+counts[0])); 
					
					$(".perf_imgSize-"+counts[0]).resizable(resizeOpts);     
					
				}
			}
		});
		var zIndex = 0;
		function make_draggable(elements)
		{	
			elements.draggable({
				containment:'parent',
				start:function(e,ui){ ui.helper.css('z-index',++zIndex); },
				stop:function(e,ui){
				}
			});
		}    
		    
	});
/* $(function() {
	$( ".perf_img" ).draggable({
		helper:"clone"
	});
	$( "#img1" ).droppable({
		drop: function( event, ui ) {
			$(this).attr();
		}
	});
});  */  
</script>
</head>
<body>
<div class="flex">
<div class="perf_pic">
	<img class="perf_img" src="/resources/img/brand/BURBERRY.png" style="width:150px; height:150px; dispay:block; margin:auto;">
</div>
<div class="perf_pic">
	<img class="perf_img" src="http://www.thumbshots.com/Portals/0/Images/Feature%20TS%201.jpg">
</div>
<div class="perf_pic">
	<img class="perf_img" src="http://www.thumbshots.com/Portals/0/Images/Feature%20TS%201.jpg">
</div>
</div>
<div id="img1"></div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
