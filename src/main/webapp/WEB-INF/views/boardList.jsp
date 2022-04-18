<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board List Page</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"> <!--CDN 링크 -->
</head>

<body>
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
                        console.log("민승희111");
                         console.log(data);

                         var tmp0= '<div class="instagram-logo">';
                         var tmp01= '<img src="instagram.PNG" id="logo">';
                         var tmp1 = '<div class="content">';
                         var tmp2 = '<img id="userImg" src="hansohee.PNG">';
                         var tmp3 = '<img id="userPhoto" src="travle.PNG">';
                         var tmp4 = '<p class ="user">';
                         var tmp5 = '<img id="likeIcon" src="love.png">';
                         var tmp6 = '<img id="comment" src="comment.png">';
                         var tmp7 = '<p class ="like"> 좋아요 29개</p>';
                         var tmp8 = '<p class ="user2">';
                         var tmp9 = '<p class ="userContent">';
                         var tmp10 = '<p class ="commentCount">';
                         var tmp11 = '<div class ="comment2">';
                         var tmp12 = '<input id ="commentin" type="text" placeholder=" 댓글 달기...">';
                         var tmp13 = '<div class ="user3">';
                         var tmp14 = '<p class ="userContent2">&nbsp';

                        var header = '<header class="appBarw">'
                        var div = '<div class="appBar">'
                        var instaLogo = '<div class="instagram-logo">'
                        var instaImg = '<img src="instagram.png" class="logo">'
                        var instaLogo2 = '</div>'
                        var menu = '<div class="appBarMenuDiv">'
                        var input = '<div class="inputText">'
                        var inputType = '<input type="text" class="search" placeholder="&#xf002 검색">'
                        var input2 = '</div>'
                        var menulist = '<ul class="appBarMenu">'
                        var li1= '<li class="menuIcon"><i class="fas fa-home"></i></li>'
                        var li2= '<li class="menuIcon"><i class="far fa-paper-plane"></i></li>'
                        var li3= '<li class="menuIcon"><i class="far fa-compass"></i></i></li>'
                        var li4= '<li class="menuIcon"><i class="far fa-heart"></i></li>'
                        var menulist2 = '</ul>'
                        var menu2 = '</div>'
                        var div2 = '</div>'
                        var header2 = '</header>'
                        document.write(header);
                        document.write(div);
                        document.write(instaLogo);
                        document.write(instaImg);
                        document.write(instaLogo2);
                        document.write(menu);
                        document.write(menulist);
                        document.write(li1);
                        document.write(li2);
                        document.write(li3);
                        document.write(li4);
                        document.write(menulist2);
                        document.write(menu2);
                        document.write(div2);
                        document.write(header2);


                        for (var i = 0; i < data.length; i++) {
                            var tt = data[i].REPLY.split('|');
                             document.write(tmp1);
                             document.write(tmp2);
                             document.write(tmp4 +  data[i].USER_ID+"</p>");
                             document.write(tmp3);
                             document.write(tmp5);
                             document.write(tmp6);
                             //document.write(tmp4 +  data[i].USER_ID);
                             document.write(tmp7);
                             document.write(tmp8 + "<strong>" +data[i].USER_ID +"</strong>" +  "&nbsp" + data[i].BOARD_CONTENT);
                             //document.write(tmp9 + data[i].BOARD_CONTENT + '<br>');
                             var replycnt;

                             if (data[i].REPLY == 0){
                               replycnt = 0
                             }
                             else{
                                replycnt = tt.length
                             }

                             document.write(tmp10 + "댓글"+replycnt+"개 모두보기</p>");
                             //
                             //alert(data[i].REPLY); //xxnly^어디예요|mydaily^팔로우 합니당
                             //alert(tt[0]);  //xxnly^어디예요
                             //alert(tt[1]);  // mydaily^팔로우 합니당

                             var ttt;
                             for(var j in tt) {
                                ttt = tt[j].toString().split('^'); //ttt[0] 작성자 , ttt[1] 댓글내용  ttt[0] = xxnly ttt[1] = 어디예요
                                //document.write(tmp13);
                                if (ttt[0] != "") { //작성자가 존재 = 댓글이 있다
                                    document.write(tmp14+ '<b>' + ttt[0] + '</b>' + '&nbsp' + ttt[1] + '</p>');
                                }
                             }

                             document.write(tmp12);
                             document.write("</div>");


                        }


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

