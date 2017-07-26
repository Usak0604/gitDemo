<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>

<script>
    $(document).ready(function () {
        <%//세션에 로그인한 유저 정보를 저장해놓는다.
            Map<String, Object> userInfo = (Map<String, Object>) request.getAttribute("userInfo");
            session.setAttribute("userInfo", userInfo);
        %>

        //세션에 저장만 하고 바로 메인페이지를 부른다.
        location.replace('/main/page');
    });
</script>

