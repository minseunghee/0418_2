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
    p {
        border-style: double;
        width: 700px;
        height: 300px;
        color : black;

        //border: 5px solid #404040;
        //border-left : none ;
        //border-right : none ;
        //border-bottom : none;
        //border-top : none;
        padding-left : 400px;
        //font : 28px "삼성고딕체"

    }
    s{
    color : yellow;
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

	<div class="container">
		<button class="btn btn-primary"
			onclick="location.href='/boards/register'">글쓰기</button>
		<%--<table class="table table-hover">--%>
		<tr>

	</div>

	
	<script type="text/javascript">


		// 페이지 로딩 후, 현재 페이지 번호 스타일 변경 - 밑줄 + Bold
		window.onload = function(){
		    //requestPostBodyJson();
			var pageNum = window.location.search.substr(9); // 현제 페이지 번호
			if(pageNum == '')
				pageNum = 1; // 특별히 지정된 페이지 번호가 없으면 그냥 페이지 1이라고 간주
			
			//document.getElementById('pageNum'+pageNum).style.textDecoration = 'underline'
			//document.getElementById('pageNum'+pageNum).style.fontWeight = 'bold'
		}

		function requestPostBodyJson(){
            alert("2");
            console.log("");
            console.log("[requestPostBodyJson] : [start]");
            console.log("");

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
                        result = data;
                        for (var i = 1; i < 10; i++) {
                                     document.write("번호 : " + result.board_id + "<br>");
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
        };


	</script>

</body>
</html>


