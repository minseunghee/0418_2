<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board List Page</title>
</head>
<style>
    s{
    color : yellow;
    }

    b{
        font-weight: bold;
    }

    .content{
        margin: 0 auto;
        height: 600px;
        width: 500px;
        margin-top : 50px;
        border-left : 1px solid black;
        border-right: 1px solid black;
        border-top : 1px solid black;
        border-bottom: 1px solid black;
        border-radius: 4px;
        font-family: 'Hind Madurai', sans-serif;
        }

    #userImg{
        border-radius: 100px;
        width: 50px;
        height: 50px;
        border : 2px solid red;
        margin: 10px;
        float: left;
    }

    .user{
        font-size : 20px;
        margin: 15px;
        float: left;
    }

    #userPhoto{
        width:100%;
    }

    #likeIcon{
        margin: 10px;
        width:5%;
    }

    .like{
        margin-left : 10px;
    }

    #comment{
         margin: 10px;
         width:4.5%;
    }

    .user2{
        font-size : 15px;
        margin-left: 10px;
        float: left;
        font-weight: bold;
    }
    .user3{
            float: left;
            font-weight: bold;
        }

    .userContent{
        margin-left : 30px;
    }
    .userContent2{
            margin-left : 70px;
        }

    .comment2{
        width: 99%;
        margin: 20px;
        float: left;


    #commentin::-webkit-input-placeholder {
        font-size : 10px;
        float:
    }



</style>
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

                         var tmp1 = '<div class="content">';
                         var tmp2 = '<img id="userImg" src="hansohee.PNG">';
                         var tmp3 = '<img id="userPhoto" src="travle.PNG">';
                         var tmp4 = '<p class ="user">';
                         var tmp5 = '<img id="likeIcon" src="love.png">';
                         var tmp6 = '<img id="comment" src="comment.png">';
                         var tmp7 = '<p class ="like"> 좋아요 29개</p>';
                         var tmp8 = '<p class ="user2">';
                         var tmp9 = '<p class ="userContent">&nbsp';
                         var tmp10 = '<p style="color:slategray">';
                         var tmp11 = '<div class ="comment2">';
                         var tmp12 = '<input id ="commentin" type="text" placeholder=" 댓글 달기...">';
                         var tmp13 = '<div class ="user3">';
                         var tmp14 = '<p class ="userContent2">&nbsp';



                        for (var i = 0; i < data.length; i++) {
                             //document.write("<h3>");
                             var tt = data[i].REPLY.split('|');
                             document.write(tmp1);
                             document.write(tmp2);
                             document.write(tmp4 +  data[i].USER_ID+"</p>");
                             document.write(tmp3);

                             document.write(tmp5);
                             document.write(tmp6);
                             //document.write(tmp4 +  data[i].USER_ID);
                             document.write(tmp7);
                             document.write(tmp8 + data[i].USER_ID);
                             document.write(tmp9 + data[i].BOARD_CONTENT);

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

