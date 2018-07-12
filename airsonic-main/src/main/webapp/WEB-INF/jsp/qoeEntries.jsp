<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html><head>
    <%@ include file="head.jsp" %>
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE">

    <link type="text/css" rel="stylesheet" href="<c:url value="/style/jquery.dataTables.min.css"/>">
    <link type="text/css" rel="stylesheet" href="<c:url value="/style/bootstrap.min.css"/>">

    <script type="text/javascript" src="<c:url value="/script/Chart.bundle.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/script/jquery-3.3.1.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/script/jquery.dataTables.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/script/bootstrap.bundle.min.js"/>"></script>

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

<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="tables-tab" data-toggle="tab" role="tab" aria-controls="tables" aria-selected="true" href="#tables">Tables</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="graphs-tab" data-toggle="tab" role="tab" aria-controls="grapsh" aria-selected="false" href="#graphs">Graphs</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
    <div id="tables" class="tab-pane fade show active" role="tabpanel" aria-labelledby="tables-tab">
        <table width="100%" class="ruleTable indent compact" id="userTable">
            <thead>
                <tr>
                    <th class="ruleTableHeader"><fmt:message key="qoeEntries.user_id"/></th>
                    <th class="ruleTableHeader"><fmt:message key="qoeEntries.user_gender"/></th>
                    <th class="ruleTableHeader"><fmt:message key="qoeEntries.user_age"/></th>
                    <th class="ruleTableHeader"><fmt:message key="qoeEntries.user_genres"/></th>
                </tr>
            </thead>
            <tbody>
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
            </tbody>
        </table>

        <br />

        <button class="btn btn-primary" onclick="getCSV('${users_csv}','users')"><fmt:message key="qoeEntries.downloadUsers"/></button>

        <br />

        <table width="100%" class="ruleTable indent compact" id="ratingTable">
            <thead>
                <tr>
                    <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_numberOfPlaylist"/></th>
                    <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_idUser"/></th>
                    <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_idMediaFile"/></th>
                    <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_mfTitle"/></th>
                    <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_mfArtist"/></th>
                    <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_mfGenre"/></th>
                    <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_idTranscoding"/></th>
                    <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_tcName"/></th>
                    <th class="ruleTableHeader"><fmt:message key="qoeEntries.entry_rating"/></th>
                </tr>
            </thead>
            <tbody>

                <c:set var="entries_csv" value="numberOfPlaylist,idUser,idMediaFile,mfTitle,mfArtist,mfGenre,idTranscoding,tcName,rating"/>
                <c:set var="arr_entryNumberOfPlaylist" value="" />
                <c:set var="arr_entryUserId" value="" />
                <c:set var="arr_entryMediaFileId" value="" />
                <c:set var="arr_entryMfTitle" value="" />
                <c:set var="arr_entryMfArtist" value="" />
                <c:set var="arr_entryMfGenre" value="" />
                <c:set var="arr_entryTranscodingId" value="" />
                <c:set var="arr_entryTcName" value="" />
                <c:set var="arr_entryRating" value="" />
                <c:forEach items="${model.musicqoeRatings}" var="qoeEntry">

                    <c:choose>
                        <c:when test="${empty qoeEntry.numberOfPlaylist}">
                            <fmt:message key="common.unknown" var="entryNumberOfPlaylist"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="entryNumberOfPlaylist" value="(${qoeEntry.numberOfPlaylist})"/>
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
                        <c:when test="${empty qoeEntry.mfTitle}">
                            <fmt:message key="common.unknown" var="entryMfTitle"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="entryMfTitle" value="${qoeEntry.mfTitle}"/>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${empty qoeEntry.mfArtist}">
                            <fmt:message key="common.unknown" var="entryMfArtist"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="entryMfArtist" value="${qoeEntry.mfArtist}"/>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${empty qoeEntry.mfGenre}">
                            <fmt:message key="common.unknown" var="entryMfGenre"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="entryMfGenre" value="${qoeEntry.mfGenre}"/>
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
                        <c:when test="${empty qoeEntry.tcName}">
                            <fmt:message key="common.unknown" var="entryTcName"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="entryTcName" value="${qoeEntry.tcName}"/>
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
                        <td class="ruleTableCell">${entryNumberOfPlaylist}</td>
                        <td class="ruleTableCell">${entryUserId}</td>
                        <td class="ruleTableCell">${entryMediaFileId}</td>
                        <td class="ruleTableCell">${entryMfTitle}</td>
                        <td class="ruleTableCell">${entryMfArtist}</td>
                        <td class="ruleTableCell">${entryMfGenre}</td>
                        <td class="ruleTableCell">${entryTranscodingId}</td>
                        <td class="ruleTableCell">${entryTcName}</td>
                        <td class="ruleTableCell">${entryRating}</td>
                    </tr>
                    <c:set var="entries_csv" value="${entries_csv}\n${entryNumberOfPlaylist},${entryUserId},${entryMediaFileId},${entryMfTitle},${entryMfArtist},${entryMfGenre},${entryTranscodingId},${entryTcName},${entryRating}" />
                    <c:set var="arr_entryNumberOfPlaylist" value="${arr_entryNumberOfPlaylist},${entryNumberOfPlaylist}" />
                    <c:set var="arr_entryUserId" value="${arr_entryUserId},${entryUserId};" />
                    <c:set var="arr_entryMediaFileId" value="${arr_entryMediaFileId},${entryMediaFileId}" />
                    <c:set var="arr_entryMfTitle" value="${arr_entryMfTitle},&quot;${entryMfTitle}&quot;" />
                    <c:set var="arr_entryMfArtist" value="${arr_entryMfArtist},&quot;${entryMfArtist}&quot;" />
                    <c:set var="arr_entryMfGenre" value="${arr_entryMfGenre},&quot;${entryMfGenre}&quot;" />
                    <c:set var="arr_entryTranscodingId" value="${arr_entryTranscodingId},${entryTranscodingId}" />
                    <c:set var="arr_entryTcName" value="${arr_entryTcName},&quot;${entryTcName}&quot;" />
                    <c:set var="arr_entryRating" value="${arr_entryRating},${entryRating}" />
                </c:forEach>
            </tbody>
        </table>

        <br />

        <button class="btn btn-primary" onclick="getCSV('${entries_csv}','entries')"><fmt:message key="qoeEntries.downloadEntries"/></button>
    </div>

    <div id="graphs" class="tab-pane fade" role="tabpanel" aria-labelledby="graphs-tab">

        <canvas id="ratingPerTranscoder"></canvas>

    </div>
</div>


<div class="forward"><a href="qoeEntries.view?"><fmt:message key="common.refresh"/></a></div>

</body>

<script>

    $(document).ready(function() {
        $('#userTable').DataTable();
        $('#ratingTable').DataTable();
    } );


    function indexesOf(str,arr){
        var res = [];
        for(i=0;i<arr.length;i++){
            if(arr[i] == str)
                res.push(i);
        }

        return res;
    }

     function indexesOfSimilar(str,arr){
            var res = [];
            for(i=0;i<arr.length;i++){
                if(arr[i].includes(str))
                    res.push(i);
            }

            return res;
        }

    function avg_values_uniq(keys,values,keys_uniq){
        let auxArr = [];
        keys_uniq.forEach(function(element) {
            let indexes = indexesOf(element,keys);
            let sum = 0;
            indexes.forEach(function(element2){
                sum+=values[element2];
            });
            auxArr.push(sum/indexes.length);
        });
        return auxArr;
    }

    function codecOrderedByBitrate(keys_uniq, values_uniq, tcName, arr_birate){
        let auxArr = [];
        indexes = indexesOfSimilar(tcName, keys_uniq);
            arr_birate.forEach(function(element){
                let aux = null;
                indexes.forEach(function(element2){
                    if(keys_uniq[element2]==tcName+" "+element){
                        aux = values_uniq[element2];
                    } else if(element == "vbr" && keys_uniq[element2]=="flac"){
                        aux = values_uniq[element2];
                    }
                });
                auxArr.push(aux);
                aux = null;
            });
        return auxArr;
    }



    var arr_tcName = [${arr_entryTcName}];
    arr_tcName = arr_tcName.filter(function(n){ return n != undefined });
    console.log(arr_tcName);

    var arr_rating = [${arr_entryRating}];
    arr_rating = arr_rating.filter(function(n){ return n != undefined });
    console.log(arr_rating);

    var arr_tcName_uniq = [...new Set(arr_tcName)];
    console.log(arr_tcName_uniq);
    arr_tcName_uniq.sort();

    var arr_rating_uniq = avg_values_uniq(arr_tcName,arr_rating,arr_tcName_uniq);
    console.log(arr_rating_uniq);

    var arr_bitrates = [64,128,192,"vbr"];
    console.log(arr_bitrates);

    var arr_opus_val = codecOrderedByBitrate(arr_tcName_uniq, arr_rating_uniq, "opus", arr_bitrates);
    console.log(arr_opus_val);

    var arr_mp3_val = codecOrderedByBitrate(arr_tcName_uniq, arr_rating_uniq, "mp3", arr_bitrates);
    console.log(arr_mp3_val);

    var arr_flac_val = codecOrderedByBitrate(arr_tcName_uniq, arr_rating_uniq, "flac", arr_bitrates);
    console.log(arr_flac_val);

    var ctx = document.getElementById('ratingPerTranscoder').getContext('2d');
    var chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'bar',

        // The data for our dataset
        data: {
            labels: arr_bitrates,
            datasets: [
            {
                label: "Opus",
                backgroundColor: 'rgb(255, 99, 132)',
                borderColor: 'rgb(255, 99, 132)',
                data: arr_opus_val,
            },
            {
                label: "Mp3",
                backgroundColor: 'rgb(93, 73, 251)',
                borderColor: 'rgb(93, 73, 251)',
                data: arr_mp3_val,
            },
            {
                label: "Flac",
                backgroundColor: 'rgb(78, 216, 138)',
                borderColor: 'rgb(78, 216, 138)',
                data: arr_flac_val,
            }
            ]
        },

        // Configuration options go here
        options: {
            scales: {
                  yAxes: [{
                        ticks: {
                            suggestedMin: 0,
                            suggestedMax: 100
                        }
                  }]
            }
        }
    });

</script>


</html>