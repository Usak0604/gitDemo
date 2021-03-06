<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome to My Web!</title>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>

<%//세션에 저장된 유저 정보 로드
    Map<String, Object> userInfo = (Map<String, Object>) session.getAttribute("userInfo");
    String name = (String)userInfo.get("name");
    String nickName = (String)userInfo.get("nickName");
%>

<p id="name"></p>
<p id="nickName"></p>

<script>
    <%--var name = "${userInfo.name}";--%>
    var nickName = "${userInfo.nickName}";
    var name = '<%=name%>';
    var nickName = '<%=nickName%>';

    $(document).ready(function () {
       $("#name").append("당신의 이름은 " + name +"입니다.");
       $("#nickName").append("당신 계정의 별칭은 " + nickName + "입니다.");
    });
</script>