<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html><head>
    <%@ include file="head.jsp" %>
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE">

    <script>

        function getCSV(csv_data,typeD){

            var hiddenElement = document.createElement('a');
            hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv_data);
            hiddenElement.target = '_blank';
            hiddenElement.download = typeD+'_mymusicqoe.csv';
            hiddenElement.click();

        }

    </script>

</head>
<body class="mainframe bgcolor1">

<h1>
    <img src="<spring:theme code="statusImage"/>" alt="">
    <span style="vertical-align: middle"><fmt:message key="qoeEntries.title"/></span>
</h1>

<table width="100%" class="ruleTable indent">
    <tr>
        <th class="ruleTableHeader"><fmt:message key="qoeEntries.user_id"/></th>
        <th class="ruleTableHeader"><fmt:message key="qoeEntries.user_gender"/></th>
        <th class="ruleTableHeader"><fmt:message key="qoeEntries.user_age"/></th>
        <th class="ruleTableHeader"><fmt:message key="qoeEntries.user_genres"/></th>
    </tr>
    <c:set var="users_csv" value="id,gender,age,genres"/>
    <c:forEach items="${model.musicqoeUsers}" var="qoeUser">

        <c:choose>
            <c:when test="${empty qoeUser.id}">
                <fmt:message key="common.unknown" var="userId"/>
            </c:when>
            <c:otherwise>
                <c:set var="userId" value="(${qoeUser.id})"/>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${empty qoeUser.gender}">
                <fmt:message key="common.unknown" var="userGender"/>
            </c:when>
            <c:otherwise>
                <c:set var="userGender" value="${qoeUser.gender}"/>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${empty qoeUser.age}">
                <fmt:message key="common.unknown" var="userAge"/>
            </c:when>
            <c:otherwise>
                <c:set var="userAge" value="${qoeUser.age}"/>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${empty qoeUser.genres}">
                <fmt:message key="common.unknown" var="userGenres"/>
            </c:when>
            <c:otherwise>
                <c:set var="userGenres" value="${qoeUser.genres}"/>
            </c:otherwise>
        </c:choose>

        <tr>
            <td class="ruleTableCell">${userId}</td>
            <td class="ruleTableCell">${userGender}</td>
            <td class="ruleTableCell">${userAge}</td>
            <td class="ruleTableCell">${userGenres}</td>
        </tr>
        <c:set var="users_csv" value="${users_csv}\n${userId},${userGender},${userAge},${userGenres}" />
    </c:forEach>
</table>

<button onclick="getCSV('${users_csv}','users')"><fmt:message key="qoeEntries.downloadUsers"/></button>

<table width="100%" class="ruleTable indent">
    <tr>
        <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_id"/></th>
        <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_idUser"/></th>
        <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_idMediaFile"/></th>
        <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_idTranscoding"/></th>
        <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_rating"/></th>
    </tr>

    <c:set var="entries_csv" value="id,idUser,idMediaFile,idTranscoding,rating"/>
    <c:forEach items="${model.musicqoeRatings}" var="qoeEntry">

        <c:choose>
            <c:when test="${empty qoeEntry.id}">
                <fmt:message key="common.unknown" var="entryId"/>
            </c:when>
            <c:otherwise>
                <c:set var="entryId" value="(${qoeEntry.id})"/>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${empty qoeEntry.idUser_MyMusicQoE}">
                <fmt:message key="common.unknown" var="entryUserId"/>
            </c:when>
            <c:otherwise>
                <c:set var="entryUserId" value="${qoeEntry.idUser_MyMusicQoE}"/>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${empty qoeEntry.idMediaFile}">
                <fmt:message key="common.unknown" var="entryMediaFileId"/>
            </c:when>
            <c:otherwise>
                <c:set var="entryMediaFileId" value="${qoeEntry.idMediaFile}"/>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${empty qoeEntry.idTranscoding}">
                <fmt:message key="common.unknown" var="entryTranscodingId"/>
            </c:when>
            <c:otherwise>
                <c:set var="entryTranscodingId" value="${qoeEntry.idTranscoding}"/>
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test="${empty qoeEntry.rating}">
                <fmt:message key="common.unknown" var="entryRating"/>
            </c:when>
            <c:otherwise>
                <c:set var="entryRating" value="${qoeEntry.rating}"/>
            </c:otherwise>
        </c:choose>

        <tr>
            <td class="ruleTableCell">${entryId}</td>
            <td class="ruleTableCell">${entryUserId}</td>
            <td class="ruleTableCell">${entryMediaFileId}</td>
            <td class="ruleTableCell">${entryTranscodingId}</td>
            <td class="ruleTableCell">${entryRating}</td>
        </tr>
        <c:set var="entries_csv" value="${entries_csv}\n${entryId},${entryUserId},${entryMediaFileId},${entryTranscodingId},${entryRating}" />
    </c:forEach>
</table>

<button onclick="getCSV('${entries_csv}','entries')"><fmt:message key="qoeEntries.downloadEntries"/></button>

<div class="forward"><a href="qoeEntries.view?"><fmt:message key="common.refresh"/></a></div>

</body></html>