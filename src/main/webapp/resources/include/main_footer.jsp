<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${root }/resources/css/all.min.css" rel="stylesheet">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="root/resources/css/all.min.css" rel="stylesheet">  
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
	#footer {
    letter-spacing: -0.5px;
    text-align: center;
    font-family: 'notokr-demilight';
}
#footer {
    padding-top: 0;
    background: #0b0b0b;
    text-align: left !important;
}
.section-common {
    width: 1218px;
    margin: 0 auto;
    clear: right;
    position: relative;
}
article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
    display: block;
}
.blind {
    display: block;
    overflow: hidden;
    position: absolute;
    left: -9999px;
    width: 1px;
    height: 1px;
    font-size: 0;
    line-height: 0;
    text-indent: -9999px;
}
.section-common .app-mini {
    padding: 40px 0 37px;
    border-bottom: 1px solid #363636;
}
.section-common .app-mini a {
    float: left;
    margin-right: 38px;
}
a {
    text-decoration: none;
}
a {
    font-size: inherit;
    color: inherit;
}
a {
    text-decoration: none;
}
.section-common .app-mini p {
    line-height: 48px;
    font-size: 14px;
    color: #acacac;
    letter-spacing: -0.5px;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.section-common .app-mini p span {
    color: #acacac;
    font-size: 18px;
    font-family: 'notokr-regular';
    vertical-align: 0;
}
	
</style>
<title>Insert title here</title>
</head>
<body>
	 <footer class="footer" id="footer">
        <section class="section-common">
            <h2 class="blind">라디오 공통영역</h2>
            <div class="app-mini">
                <a href="${root }/">
                    <img src="http://img.imbc.com/broad/radio/channelm/2018radioguide/images/logo-mini.png"
                        alt="히든조원 건희">
                </a>
                <p>
                    <span>문자 참여 : #8001</span>
                  		  정보이용료 SMS : 50원 , MMS: 100원 | 서울시 마포구 신촌로 176 중앙빌딩5F (03925) <진수성찬> 당담자앞
                </p>
            </div>
        </section>
    </footer>
</body>
</html>