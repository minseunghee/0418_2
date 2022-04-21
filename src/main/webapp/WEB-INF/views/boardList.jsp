<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"> <!--CDN 링크 -->
</head>

<body>
<div id ="Topbar" style="width:100%, height: 100%">
    <header class="appBarw">
      <div class="appBar">
        <div class="instagram-logo">
            <img src="instagram.png" class="logo">
        </div>
        <div class="appBarMenuDiv">
            <!--<div class="inputText">
                <input type="text" class="search" placeholder="&#xf002 검색">
            </div>-->
            <ul class="appBarMenu">
                <li class="menuIcon"><i class="fas fa-home"></i></li>
                <li class="menuIcon"><i class="far fa-paper-plane"></i></li>
                <li class="menuIcon"><i class="far fa-compass"></i></i></li>
                <li class="menuIcon"><i class="far fa-heart"></i></li>
            </ul>
        </div>
      </div>
    </header>
</div>

    <div id="MSH"></div>

	<jsp:include page="./partials/header.jsp" />
	<script type="text/javascript">

            // [요청 url 선언]
            var reqURL = "http://localhost:8080/test"; // 요청 주소
            reqURL = encodeURI(reqURL);

            // [요청 json 데이터 선언]
            var jsonData = { // Body에 첨부할 json 데이터
                    pageNum : 1
            };

            $.ajax({
                // [요청 시작 부분]
                url: reqURL, //주소
                data: jsonData, //전송 데이터
                type: "GET", //전송 타입
                async: false, //비동기 여부
                timeout: 5000, //타임 아웃 설정
                dataType: "JSON", //응답받을 데이터 타입 (XML,JSON,TEXT,HTML,JSONP)
                contentType: "application/json; charset=utf-8", //헤더의 Content-Type을 설정

                // [응답 확인 부분 - json 데이터를 받습니다]
                success: function(data) {
                    console.log(data);

                   //첫 번째 매개변수: 객체(data)
                   //두 번째 매개변수 : 배열의 인덱스(i)와 값(item)
                   $.each(data, function(i, item){
                      var usrReply = data[i].REPLY.split('|');   //한 줄에 담은 댓글들을 | 구분자로 분리하여 생성
                      var replycnt;                              //게시글 댓글 개수
                      var replyGB;                               //댓글 아이디, 내용을 ^ 구분자로 분리하여 생성

                      if (data[i].REPLY == 0){
                          replycnt = 0
                       } else {
                          replycnt = usrReply.length
                      }

                      var reply = "" ;                          // 댓글
                      for(var j in usrReply) {
                          replyGB = usrReply[j].toString().split('^');
                          if (replyGB[0] != "") {
                             reply = reply + '<p class ="userContent2">&nbsp' + '<b>' + replyGB[0] + '</b>' + '&nbsp' + replyGB[1] + '</p>';
                          }
                       }
                      // 04.19 JQuery
                      var insContent = '<div class="content">' +
                                      '<img id="userImg" src="hansohee.PNG">' +
                                      '<p class ="user">' + data[i].USER_ID + "</p>" +
                                      '<img id="userPhoto" src="travle.PNG">' +
                                      '<img id="likeIcon" src="love.png">' +
                                      '<img id="comment" src="comment.png">' +
                                      '<p class ="like"> 좋아요 29개 </p>' +
                                      '<p class ="user2">' +
                                      "<strong>" +data[i].USER_ID +"</strong>" + "&nbsp" +
                                       data[i].BOARD_CONTENT +
                                       '<p class ="commentCount">' +
                                       "댓글" + replycnt + "개 모두보기</p>" +
                                       reply +
                                       '<input id ="commentin" type="text" placeholder=" 댓글 달기...">'

                           $('#MSH').append(insContent);

                           //var mainContent = $('#MSH').append('<div class="content">');
                           //$('#mainContent').after('<img id="userImg" src="hansohee.PNG">');
                           //$('#MSH').append('<img id="userImg" src="hansohee.PNG">');

                      });
                },

                // [에러 확인 부분]
                error: function(xhr) {
                console.log("민승희2111");
                },

                // [완료 확인 부분]
                complete:function(data,textStatus) {
                console.log(data.user_id);
                }
            });


    </script>

</body>
</html>

