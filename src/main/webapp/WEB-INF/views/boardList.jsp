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

    .content{
        margin: 0 auto;
        height: 600px;
        width: 500px;
        margin-top : 100px;
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
        margin: 17px;
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

    .userContent{
        margin-left : 30px;
    }

    .comment2{
        width: 99%;
        margin: 20px;
        float: left;


    #commentin::-webkit-input-placeholder {
        font-size : 10px;
    }



</style>
<body>
	<jsp:include page="./partials/header.jsp" />

  <div class="content">
    <img id="userImg" src="hansohee.PNG">
    <p class ="user"> xeesoxee</p>
    <img id="userPhoto" src="travle.PNG">
    <img id="likeIcon" src="love.png">
    <img id="comment" src="comment.png">
    <p class ="like"> 좋아요 29개</p>
    <p class ="user2"> xeesoxee </p>
    <p class ="userContent">&nbsp 날이 너무 좋아요!</p>
    <p style="color:slategray">댓글 5개 모두보기</p>

    <div class ="comment2">
    <input id ="commentin" type="text" placeholder=" 댓글 달기...">
    </div>
  </div>




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

                        for (var i = 0; i < data.length; i++) {
                         //document.write("<h3>");
                         document.write("<p>");
                         document.write("번호 : " + data[i].BOARD_ID + "<br>");
                         document.write("타이틀 : " + data[i].BOARD_TITLE + "<br>");
                         document.write("작성자 : " + data[i].USER_ID + "<br>");
                         document.write("작성날짜 : " + data[i].DT_RGST + "<br>");
                         document.write("내용 : " + data[i].BOARD_CONTENT);
                         document.write("</p>");
                         document.write("<hr>");
                         //document.write("</h3>");
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

