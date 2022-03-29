
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 26256
  Date: 2021/12/8
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="page_nav">

    <c:if test="${requestScope.page.pageNo>1}">
        <a href="${requestScope.page.url}?action=${requestScope.action}&pageNo=1&low=${requestScope.page.low}&high=${requestScope.page.high}">首页</a>
        <a href="${requestScope.page.url}?action=${requestScope.action}&pageNo=${requestScope.page.pageNo-1}&low=${requestScope.page.low}&high=${requestScope.page.high}">上一页</a>
    </c:if>

    <%--1.不需要移动页码的情况--%>
    <C:if test="${requestScope.page.pageTotal<=5}">
        <c:forEach begin="1" end="${requestScope.page.pageTotal}" var="i">
            <c:if test="${i!=requestScope.page.pageNo}">
                <a href="${requestScope.page.url}?action=${requestScope.action}&pageNo=${i}&low=${requestScope.page.low}&high=${requestScope.page.high}">${i}</a>
            </c:if>
            <c:if test="${i==requestScope.page.pageNo}">
                【${i}】
            </c:if>
        </c:forEach>
    </C:if>

    <%--2.需要移动页码的情况--%>
    <C:if test="${requestScope.page.pageTotal>5}">
        <%--访问最前面的3个页码，页码不需要移动--%>
        <C:if test="${requestScope.page.pageNo<=3}">
            <C:forEach begin="1" end="5" var="i">
                <c:if test="${i!=requestScope.page.pageNo}">
                    <a href="${requestScope.page.url}?action=${requestScope.action}&pageNo=${i}&low=${requestScope.page.low}&high=${requestScope.page.high}">${i}</a>
                </c:if>
                <c:if test="${i==requestScope.page.pageNo}">
                    【${i}】
                </c:if>
            </C:forEach>
        </C:if>

        <%--访问中间页码，页码需要移动--%>
        <C:if test="${requestScope.page.pageNo>3&&requestScope.page.pageNo<=requestScope.page.pageTotal-2}">
            <C:forEach begin="${requestScope.page.pageNo-2}" end="${requestScope.page.pageNo+2}" var="i">
                <c:if test="${i!=requestScope.page.pageNo}">
                    <a href="${requestScope.page.url}?action=${requestScope.action}&pageNo=${i}&low=${requestScope.page.low}&high=${requestScope.page.high}">${i}</a>
                </c:if>
                <c:if test="${i==requestScope.page.pageNo}">
                    【${i}】
                </c:if>
            </C:forEach>
        </C:if>
        <%--访问最后的3个页码，页码不需要移动--%>
        <C:if test="${requestScope.page.pageNo>requestScope.page.pageTotal-2}">
            <C:forEach begin="${requestScope.page.pageTotal-4}" end="${requestScope.page.pageTotal}" var="i">
                <c:if test="${i!=requestScope.page.pageNo}">
                    <a href="${requestScope.page.url}?action=${requestScope.action}&pageNo=${i}&low=${requestScope.page.low}&high=${requestScope.page.high}">${i}</a>
                </c:if>
                <c:if test="${i==requestScope.page.pageNo}">
                    【${i}】
                </c:if>
            </C:forEach>
        </C:if>

    </C:if>



    <c:if test="${requestScope.page.pageNo<requestScope.page.pageTotal}">
        <a href="${requestScope.page.url}?action=${requestScope.action}&pageNo=${requestScope.page.pageNo+1}&low=${requestScope.low}&high=${requestScope.high}">下一页</a>
        <a href="${requestScope.page.url}?action=${requestScope.action}&pageNo=${requestScope.page.pageTotal}">末页</a>
    </c:if>
    共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录 到第<input value="${requestScope.page.pageNo}" name="pn" id="pn_input"/>页
    <input id="reachPageBtn" type="button" value="确定">

    <script type="text/javascript">
        $("#reachPageBtn").click(function () {
            var pageNo=$("#pn_input").val();
            if(pageNo>=1&&pageNo<=${requestScope.page.pageTotal}){
                location.href = "client/clientFirst?action=${requestScope.action}&low=${requestScope.low}&high=${requestScope.high}&pageNo="+pageNo;
            }
        })
    </script>
</div>