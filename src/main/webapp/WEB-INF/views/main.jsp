<%--
  Created by IntelliJ IDEA.
  User: jekim
  Date: 2022-09-15
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html>
<head>
    <title>Title</title>
</head>
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
    <script type="text/javascript">
        $(function (){
            var chkObj = document.getElementsByName("RowCheck");
            var rowCnt = chkObj.length;

            $("input[name='allCheck']").click(function (){
                var chk_listArr = $("input[name='RowCheck']");
                for(var i=0; i<chk_listArr.length; i++){
                    chk_listArr[i].checked = this.checked;
                }
            });
            $("input[name='RowCheck']").click(function (){
               if ($("input[name='RowCheck']:checked").length == rowCnt){
                   $("input[name='allCheck']")[0].checked =true;
               }
               else {
                   $("input[name='allCheck']")[0].checked =false;
               }
            });
        });
        function deleteValue(){
            var url ="delete";
            var valueArr = new Array();
            var list = $("input[name='RowCheck']");
            for (var i=0; i<list.length; i++){
                if(list[i].checked){
                    console.log(list[i].value)
                    valueArr.push(list[i].value);
                }
            }
            console.log(valueArr)
            if (valueArr.length==0){
                alert("선택된 사항이 없습니다.");
            }
            else{
                var chk =confirm("정말 삭제하시겠습니까?");
                $.ajax({
                    url : url,
                    type : 'POST',
                    traditional : true,
                    data : {
                        valueArr : valueArr
                    },
                    success: function (jdata){
                        if (jdata = 1){
                            alert("성공");
                            location.replace("123")
                        }
                        else {
                            alert("실패");
                        }
                    }
                });
            }
        }
    </script>
<body>
    <form action="/123" method="POST">
        제목: <input type="text" name="title"><br>
        내용: <input type="text" name="content"><br>
        작성자: <input type="text" name="user"><br>
        <button type="submit">보내기</button>
        <button type="submit" formtarget="_blank">새 창에서 열기</button>
    </form>
    <br>
    <table boarder="1" width="500" height="200" bgcolor="#00bfff" cellspacing="5" >
        <thead bgcolor="white">
        <tr>
            <th><input id="allCheck" type="checkbox" name="allCheck"></th>
            <th>ID</th>
            <th>제목</th>
            <th>내용</th>
            <th>작성자</th>
        </tr>
        </thead>
        <tbody bgcolor="white">
            <c:forEach items="${list}" var="list">
            <tr>
                <td><input name="RowCheck" type="checkbox" value="${list._id}"></td>
                <td>${list._id}</td>
                <td>${list.title}</td>
                <td>${list.content}</td>
                <td>${list.user}</td>
                <td><a href="${path}/board/detail?id=${list._id}"/>상세</td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
<input type="button" value="선택삭제" class="btn btn-outline-info" onclick="deleteValue();">
</body>
</html>
