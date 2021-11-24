<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"/> -->

<style>
.chat_wrap{padding:200px; padding-top: 0px; padding-bottom: 0px; font-size:13px; color:#333;}
.chat_wrap .inner{/*background-color:#acc2d2;*/ background-color:#ECE6CC; border-radius:5px; padding:10px; overflow-y:scroll; height:600px;}
.chat_wrap .item{margin-top:15px}
.chat_wrap .item:first-child{margin-top:0px}
.chat_wrap .item .box{display:inline-block; max-width:180px; position:relative}
.chat_wrap .item .box::before{content:""; position:absolute; left:-8px; top:9px; border-top:0px solid transparent; border-bottom:8px solid transparent; border-right:8px solid #fff;}
.chat_wrap .item .box .msg {background:#fff; border-radius:10px; padding:8px; text-align:left}
.chat_wrap .item .box .time {font-size:11px; color:#999; position:absolute; right: -75px; bottom:5px; width:70px}
.chat_wrap .item.mymsg{text-align:right}
.chat_wrap .item.mymsg .box::before{left:auto; right:-8px; border-left:8px solid #fee600; border-right:0;}
.chat_wrap .item.mymsg .box .msg{background:#fee600}
.chat_wrap .item.mymsg .box .time{right:auto; left:-75px}
.chat_wrap .item .box{transition:all .3s ease-out; margin:0 0 0 20px;opacity:0}
.chat_wrap .item.mymsg .box{transition:all .3s ease-out; margin:0 20px 0 0;}
.chat_wrap .item.on .box{margin:0; opacity: 1;}

input[type="text"]{border:0; width:100%;background:#ddd; border-radius:5px; height:30px; padding-left:5px; box-sizing:border-box; margin-top:5px}
input[type="text"]::placeholder{color:#999}
.container{
	min-height: 650px;
}
</style>

<div class="container">

<div class="fadeOutArea">
<br>
안녕하세요, ${chatNick }님! 현재 페이지로부터 이동할 경우 채팅이 종료됩니다. <button type="button" onclick="openSocket()" id="btnFadeOut" class="btn">확인</button>
</div>
<input type="text" id="sender" value="${chatNick }" style="display: none;">
<div class="chat_wrap fadeInArea" style="display: none;">
    <div id="messages" class="inner">
        
        <%--<div class="item">
            <div class="box">
                <p class="msg">안녕하세요</p>
                <span class="time">오전 10:05</span>
            </div>
        </div>

        <div class="item mymsg">
            <div class="box">
                <p class="msg">안녕하세요</p>
                <span class="time">오전 10:05</span>
            </div>
        </div> --%>
       
    </div>
    <input type="text" class="mymsg" placeholder="내용 입력" id="messageinput">
</div>

<%-- websocket javascript --%>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnFadeOut").click(function(){
		$(".fadeOutArea").fadeOut(500);
		$(".fadeInArea").delay(600).fadeIn(500);
	})
})
var ws;
var messages = document.getElementById("messages");

//웹소켓 객체 생성
function openSocket(){
    if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
        writeResponse("WebSocket is already opened.");
        return;
    }
    
    ws = new WebSocket("ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chat/server");
    
    ws.onopen = function(event){
        if(event.data === undefined){
      		return;
        }
        writeResponse(event.data);
    };
    
    ws.onmessage = function(event){
        console.log('writeResponse');
        console.log(event.data)
        writeResponse(event.data);
    };
    
    ws.onclose = function(event){
        writeResponse("대화 종료");
    }
}

function closeSocket(){
    ws.close();
}

function writeResponse(text){
    messages.innerHTML += "<br>"+text;
    
    var lastItem = $(".chat_wrap .inner").find(".item:last");
    var position = lastItem.position().top + $(".chat_wrap .inner").scrollTop();
    console.log(position);
    $(".chat_wrap .inner").stop().animate({scrollTop:position},500);
}

// function clearText(){
//     console.log(messages.parentNode);
//     messages.parentNode.removeChild(messages)
// }

//https://blog.naver.com/PostView.naver?blogId=jdjhaha&logNo=222093462619&parentCategoryNo=22&categoryNo=&viewDate=&isShowPopularPosts=true&from=search
function send(){
    var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value;
    ws.send(text);
}

$(function(){
    $("input[type='text']").keypress(function(e){
        if(e.keyCode == 13 && $(this).val().length){
        	send();
        	
//         	//input에 입력한 메세지
//             var _val = $(this).val();

//         	//mymsg or yourmsg
//             var _class = $(this).attr("class");

            $(this).val('');
//             $(".chat_wrap .inner").append('<div class="item '+_class+'"><div class="box"><p class="msg">'+_val+'</p><span class="time">'+currentTime()+'</span></div></div>');
            var lastItem = $(".chat_wrap .inner").find(".item:last");
            var position = lastItem.position().top + $(".chat_wrap .inner").scrollTop();
            console.log(position);

            $(".chat_wrap .inner").stop().animate({scrollTop:position},500);
        }
    });
});

// var currentTime = function(){
//     var date = new Date();
//     var hh = date.getHours();
//     var mm = date.getMinutes();
//     var apm = hh >12 ? "오후":"오전";
//     var ct = apm + " "+hh+":"+mm+"";
//     return ct;
// }
</script>

</div><%-- .container --%>
<c:import url="/WEB-INF/views/layout/footer.jsp" />