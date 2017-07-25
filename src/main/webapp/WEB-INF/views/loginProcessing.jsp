<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome to my web, Login please</title>
<script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>

<div class="container" >

    <form id="loginProcess" method="post">
        <input type="hidden" name="name" value="${userInfo.name}">
        <input type="hidden" name="user_number" value="${userInfo.user_number}">
        <input type="hidden" name="id" value="${userInfo.id}">
        <input type="hidden" name="nickName" value="${userInfo.nickName}">
    </form>

</div>

<script>
    $(document).ready(function () {
        var uri = '/main/page';//controller 주소
        $('#loginProcess').attr('action', uri);
        $('#loginProcess')[0].submit();
    });
</script>