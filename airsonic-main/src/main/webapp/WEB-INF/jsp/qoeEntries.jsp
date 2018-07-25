<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html><head>
    <%@ include file="head.jsp" %>

    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE">

    <link type="text/css" rel="stylesheet" href="<c:url value="/style/bootstrap.min.css"/>">
    <link type="text/css" rel="stylesheet" href="<c:url value="/style/dataTables.bootstrap4.min.css"/>">


    <script type="text/javascript" src="<c:url value="/script/Chart.bundle.min.js"/>"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="<c:url value="/script/jquery-3.3.1.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/script/jquery.dataTables.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/script/bootstrap.bundle.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/script/dataTables.bootstrap4.min.js"/>"></script>


    <script>

        function getCSV(csv_data,typeD){

            var hiddenElement = document.createElement('a');
            hiddenElement.href = 'data:text/csv;charset=utf-8,' + encodeURI(csv_data);
            hiddenElement.target = '_blank';
            hiddenElement.download = typeD+'_mymusicqoe.csv';
            hiddenElement.click();

        }

    </script>

    <style>
        .downloadBtn {
            margin: 10px;
        }
    </style>

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
<div class="tab-content container-fluid" id="myTabContent">
    <div id="tables" class="tab-pane fade show active" role="tabpanel" aria-labelledby="tables-tab">
        <br />
        <table class="table table-striped table-sm" id="ratingTable">
            <thead class="thead-light">
                <tr>
                    <th><fmt:message key="qoeEntries.entry_idUser"/></th>
                    <th><fmt:message key="qoeEntries.entry_mfTitle"/></th>
                    <th><fmt:message key="qoeEntries.entry_mfArtist"/></th>
                    <th><fmt:message key="qoeEntries.entry_mfGenre"/></th>
                    <th><fmt:message key="qoeEntries.entry_tcName"/></th>
                    <th><fmt:message key="qoeEntries.entry_headphones"/></th>
                    <th><fmt:message key="qoeEntries.entry_date"/></th>
                    <th><fmt:message key="qoeEntries.entry_rating"/></th>
                </tr>
            </thead>
            <tbody>

                <c:set var="entries_csv" value="numberOfPlaylist,idUser,idMediaFile,mfTitle,mfArtist,mfGenre,idTranscoding,tcName,headphones,date,rating"/>
                <c:set var="arr_entryUserId" value="" />
                <c:set var="arr_entryMfTitle" value="" />
                <c:set var="arr_entryMfArtist" value="" />
                <c:set var="arr_entryMfGenre" value="" />
                <c:set var="arr_entryTcName" value="" />
                <c:set var="arr_entryHeadphones" value="" />
                <c:set var="arr_entryRating" value="" />
                <c:set var="arr_entryDate" value="" />
                <c:forEach items="${model.musicqoeRatings}" var="qoeEntry">

                    <c:choose>
                        <c:when test="${empty qoeEntry.numberOfPlaylist}">
                            <fmt:message key="common.unknown" var="entryNumberOfPlaylist"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="entryNumberOfPlaylist" value="${qoeEntry.numberOfPlaylist}"/>
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
                        <c:when test="${empty qoeEntry.headphones}">
                            <fmt:message key="common.unknown" var="entryHeadphones"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="entryHeadphones" value="${qoeEntry.headphones}"/>
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

                    <c:choose>
                        <c:when test="${empty qoeEntry.date}">
                            <fmt:message key="common.unknown" var="entryDate"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="entryDate" value="${qoeEntry.date}"/>
                        </c:otherwise>
                    </c:choose>

                    <tr>
                        <td>${entryUserId}</td>
                        <td>${entryMfTitle}</td>
                        <td>${entryMfArtist}</td>
                        <td>${entryMfGenre}</td>
                        <td>${entryTcName}</td>
                        <td>${entryHeadphones}</td>
                        <td>${entryDate}</td>
                        <td>${entryRating}</td>
                    </tr>
                    <c:set var="entries_csv" value="${entries_csv}##${entryNumberOfPlaylist},${entryUserId},${entryMediaFileId},${entryMfTitle},${entryMfArtist},${entryMfGenre},${entryTranscodingId},${entryTcName},${entryHeadphones},${entryDate},${entryRating}" />
                    <c:set var="arr_entryUserId" value="${arr_entryUserId},${entryUserId};" />
                    <c:set var="arr_entryMfTitle" value="${arr_entryMfTitle},&quot;${entryMfTitle}&quot;" />
                    <c:set var="arr_entryMfArtist" value="${arr_entryMfArtist},&quot;${entryMfArtist}&quot;" />
                    <c:set var="arr_entryMfGenre" value="${arr_entryMfGenre},&quot;${entryMfGenre}&quot;" />
                    <c:set var="arr_entryTcName" value="${arr_entryTcName},&quot;${entryTcName}&quot;" />
                    <c:set var="arr_entryHeadphones" value="${arr_entryHeadphones},&quot;${entryHeadphones}&quot;" />
                    <c:set var="arr_entryRating" value="${arr_entryRating},${entryRating}" />
                    <c:set var="arr_entryDate" value="${arr_entryDate},&quot;${entryDate}&quot;" />
                </c:forEach>
            </tbody>
        </table>

        <br />

        <%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
        <%@ page import="java.io.*" %>

        <%
            String escaped_entries_csv = (String)pageContext.getAttribute("entries_csv");
            escaped_entries_csv = StringEscapeUtils.escapeJavaScript(escaped_entries_csv);
            escaped_entries_csv = escaped_entries_csv.replace("##","\\n");
        %>

        <button class="btn btn-primary downloadBtn" onclick="getCSV('<%= escaped_entries_csv %>','entries')"><fmt:message key="qoeEntries.downloadEntries"/></button>

        <br />

        <table class="table table-striped table-sm" id="userTable">
                    <thead class="thead-light">
                <tr>
                    <th><fmt:message key="qoeEntries.user_id"/></th>
                    <th><fmt:message key="qoeEntries.user_gender"/></th>
                    <th><fmt:message key="qoeEntries.user_age"/></th>
                    <th><fmt:message key="qoeEntries.user_genres"/></th>
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
                            <c:set var="userId" value="${qoeUser.id}"/>
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
                        <c:when test="${qoeUser.age==1}">
                            <c:set var="userAge" value="-20"/>
                        </c:when>
                        <c:when test="${qoeUser.age==2}">
                            <c:set var="userAge" value="20-30"/>
                        </c:when>
                        <c:when test="${qoeUser.age==3}">
                            <c:set var="userAge" value="30-40"/>
                        </c:when>
                        <c:when test="${qoeUser.age==4}">
                            <c:set var="userAge" value="40-50"/>
                        </c:when>
                        <c:when test="${qoeUser.age==5}">
                            <c:set var="userAge" value="50-60"/>
                        </c:when>
                        <c:when test="${qoeUser.age==6}">
                            <c:set var="userAge" value="60+"/>
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
                        <td>${userId}</td>
                        <td>${userGender}</td>
                        <td>${userAge}</td>
                        <td>${userGenres}</td>
                    </tr>
                    <c:set var="users_csv" value="${users_csv}##${userId},${userGender},${userAge},${userGenres}" />
                    <c:set var="arr_userId" value="${arr_userId},${userId}" />
                    <c:set var="arr_userGender" value="${arr_userGender},&quot;${userGender}&quot;" />
                    <c:set var="arr_userAge" value="${arr_userAge},&quot;${userAge}&quot;" />
                    <c:set var="arr_userGenres" value="${arr_userGenres},${userGenres}" />
                </c:forEach>
            </tbody>
        </table>

        <br />

         <%
            String escaped_users_csv = (String)pageContext.getAttribute("users_csv");
            escaped_users_csv = StringEscapeUtils.escapeJavaScript(escaped_users_csv);
            escaped_users_csv = escaped_users_csv.replace("##","\\n");
        %>

        <button class="btn btn-primary downloadBtn" onclick="getCSV('<%= escaped_users_csv %>','users')"><fmt:message key="qoeEntries.downloadUsers"/></button>


    </div>

    <div id="graphs" class="tab-pane fade" role="tabpanel" aria-labelledby="graphs-tab">

        <div class="nav flex-column nav-pills" id="v-graphs-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link active" id="v-graphs-ratingPerTranscoder-tab" data-toggle="pill" href="#v-graphs-ratingPerTranscoder" role="tab" aria-controls="v-graphs-ratingPerTranscoder" aria-selected="true">Rating by Transcoder</a>
            <a class="nav-link" id="v-graphs-ratingPerGenre-tab" data-toggle="pill" href="#v-graphs-ratingPerGenre" role="tab" aria-controls="v-graphs-ratingPerGenre" aria-selected="false">Rating by Genre</a>
            <a class="nav-link" id="v-graphs-ratingPerTranscoderPerGenre-tab" data-toggle="pill" href="#v-graphs-ratingPerTranscoderPerGenre" role="tab" aria-controls="v-graphs-ratingPerTranscoderPerGenre" aria-selected="false">Rating by Transcoder by Genre</a>
            <a class="nav-link" id="v-graphs-favoriteGenres-tab" data-toggle="pill" href="#v-graphs-favoriteGenres" role="tab" aria-controls="v-graphs-favoriteGenres" aria-selected="false">Favorite Genres</a>
            <a class="nav-link" id="v-graphs-demographic-tab" data-toggle="pill" href="#v-graphs-demographic" role="tab" aria-controls="v-graphs-demographic" aria-selected="false">Demographic</a>
        </div>
        <div class="tab-content" id="v-graphs-tabContent">
            <div class="tab-pane fade show active" id="v-graphs-ratingPerTranscoder" role="tabpanel" aria-labelledby="v-graphs-ratingPerTranscoder-tab">
                <canvas id="ratingPerTranscoder"></canvas>
            </div>
            <div class="tab-pane fade" id="v-graphs-ratingPerGenre" role="tabpanel" aria-labelledby="v-graphs-ratingPerGenre-tab">
                <canvas id="ratingPerGenre"></canvas>
            </div>
            <div class="tab-pane fade" id="v-graphs-ratingPerTranscoderPerGenre" role="tabpanel" aria-labelledby="v-graphs-ratingPerTranscoderPerGenre-tab">
                <canvas id="ratingPerTranscoderPerGenre"></canvas>
            </div>
            <div class="tab-pane fade" id="v-graphs-favoriteGenres" role="tabpanel" aria-labelledby="v-graphs-favoriteGenres-tab">
                <canvas id="favoriteGenres"></canvas>
            </div>
            <div class="tab-pane fade row" id="v-graphs-demographic" role="tabpanel" aria-labelledby="v-graphs-demographic-tab">
                <div  class="col-sm">
                    <h3>Gender</h3>
                    <canvas id="genders"></canvas>
                </div>
                <div  class="col-sm">
                    <h3>Age</h3>
                    <canvas id="ages"></canvas>
                </div>
            </div>
        </div>

    </div>
</div>


<div class="forward"><a href="qoeEntries.view?"><fmt:message key="common.refresh"/></a></div>

</body>

<script>

    $(document).ready(function() {
        $('#userTable').DataTable();
        $('#ratingTable').DataTable( {
            "order": [[ 6, "desc" ]]
        } );
    } );

    // Then we'll use the int and convert to hex.
    function hashCode(str) {
        var hash = 0;
        for (var i = 0; i < str.length; i++) {
            hash = str.charCodeAt(i) + ((hash << 5) - hash);
        }
        return hash;
    }

    // Convert an int to hexadecimal with a max length
    // of six characters.
    function intToARGB(i) {
        var hex = ((i>>24)&0xFF).toString(16) +
                ((i>>16)&0xFF).toString(16) +
                ((i>>8)&0xFF).toString(16) +
                (i&0xFF).toString(16);
        // Sometimes the string returned will be too short so we
        // add zeros to pad it out, which later get removed if
        // the length is greater than six.
        hex += '000000';
        return hex.substring(0, 6);
    }

    // Extend the string type to allow converting to hex for quick access.
    String.prototype.toHexColour = function() {
        return intToARGB(hashCode(this));
    }


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

    function indexesOf2Similar(str,str2,arr,arr2){
        var res = [];
        for(i=0;i<arr.length;i++){
            if(arr[i].includes(str) && arr2[i].includes(str2))
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

    function count_uniq(keys,keys_uniq){
        let auxArr = [];
        keys_uniq.forEach(function(element) {
            let indexes = indexesOf(element,keys);
            auxArr.push(indexes.length);
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

    function genreOrderedByCodec(keys, values, arr_tcName, arr_tcName_uniq, genre){
        let auxArr = [];
        arr_tcName_uniq.forEach(function(element){
            console.log(element);
            console.log(genre);
            indexes = indexesOf2Similar(genre,element,keys,arr_tcName);
            console.log("Indexes:");
            console.log(indexes);
            let sum = 0;
            indexes.forEach(function(element2){
                sum+=values[element2];
            });
            auxArr.push(sum/indexes.length);
        });
        return auxArr;
    }



    var arr_tcName = [${arr_entryTcName}];
    arr_tcName = arr_tcName.filter(function(n){ return n != undefined });
    //console.log(arr_tcName);

    var arr_mfGenre = [${arr_entryMfGenre}];
    arr_mfGenre = arr_mfGenre.filter(function(n){ return n != undefined });
    //console.log(arr_mfGenre);

    var arr_rating = [${arr_entryRating}];
    arr_rating = arr_rating.filter(function(n){ return n != undefined });
    //console.log(arr_rating);

    var arr_tcName_uniq = [...new Set(arr_tcName)];
    arr_tcName_uniq.sort();
    //console.log(arr_tcName_uniq);

    var arr_mfGenre_uniq = [...new Set(arr_mfGenre)];
    arr_mfGenre_uniq.sort();
    //console.log(arr_mfGenre_uniq);

    var arr_bitrates = [64,128,192,"vbr"];
    //console.log(arr_bitrates);



    //CHART 1
    var arr_tcName_rating_uniq = avg_values_uniq(arr_tcName,arr_rating,arr_tcName_uniq);
    //console.log(arr_tcName_rating_uniq);

    var arr_opus_val = codecOrderedByBitrate(arr_tcName_uniq, arr_tcName_rating_uniq, "opus", arr_bitrates);
    //console.log(arr_opus_val);
    var arr_mp3_val = codecOrderedByBitrate(arr_tcName_uniq, arr_tcName_rating_uniq, "mp3", arr_bitrates);
    //console.log(arr_mp3_val);
    var arr_flac_val = codecOrderedByBitrate(arr_tcName_uniq, arr_tcName_rating_uniq, "flac", arr_bitrates);
    //console.log(arr_flac_val);

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
                            },
                            labelString: "Rating (Average)"

                  }],
                  xAxes: [{
                            labelString: "Bitrate"
                  }]
            }
        }
    });


    //CHART 2
    var arr_mfGenre_rating_uniq = avg_values_uniq(arr_mfGenre,arr_rating,arr_mfGenre_uniq);
    //console.log(arr_mfGenre_rating_uniq);

    var ctx2 = document.getElementById('ratingPerGenre').getContext('2d');
    var chart2 = new Chart(ctx2, {
        // The type of chart we want to create
        type: 'bar',

        // The data for our dataset
        data: {
            labels: arr_mfGenre_uniq,
            datasets: [
                {
                    label: "Genres",
                    backgroundColor: 'rgb(44, 49, 55)',
                    borderColor: 'rgb(44, 49, 55)',
                    data: arr_mfGenre_rating_uniq,
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
                            },
                            labelString: "Rating (Average)"

                  }],
                  xAxes: [{
                            labelString: "Genres"
                  }]
            }
        }
    });

    //CHART 3

    var arr_tcName_mfGenre_rating_uniq = [];

    arr_mfGenre_uniq.forEach(function(element){
        let auxArr;
        auxArr = genreOrderedByCodec(arr_mfGenre, arr_rating, arr_tcName, arr_tcName_uniq, element);
        arr_tcName_mfGenre_rating_uniq.push(auxArr);
    });

    var datasetsGraph3 = [];

    arr_tcName_mfGenre_rating_uniq.forEach(function(element, index){
            //console.log("Element:");
            //console.log(element);
            //console.log("Colour");
            //console.log(arr_mfGenre_uniq[index].toHexColour());
            datasetsGraph3.push({
                    label: arr_mfGenre_uniq[index],
                    backgroundColor: '#'+arr_mfGenre_uniq[index].toHexColour(),
                    data: element,
            });
    });


    var ctx3 = document.getElementById('ratingPerTranscoderPerGenre').getContext('2d');
    var chart3 = new Chart(ctx3, {
        // The type of chart we want to create
        type: 'bar',

        // The data for our dataset
        data: {
            labels: arr_tcName_uniq,
            datasets: datasetsGraph3
        },

        // Configuration options go here
        options: {
            scales: {
                  yAxes: [{
                            ticks: {
                                suggestedMin: 0,
                                suggestedMax: 100
                            },
                            stacked: false,
                            labelString: "Rating (Average)"

                  }],
                  xAxes: [{
                            stacked: false,
                            labelString: "Transcoding"
                  }]
            }
        }
    });

    //CHART 4

    var str_genres = '${arr_userGenres}';
    var arr_genres = str_genres.split(",");
    arr_genres = arr_genres.filter(function(entry) { return entry.trim() != ''; });
    //console.log(arr_genres);

    var arr_genres_uniq = [...new Set(arr_genres)];
    arr_genres_uniq.sort();

    var arr_genres_count = count_uniq(arr_genres,arr_genres_uniq);
    var arr_genres_color = [];

    arr_genres_uniq.forEach(function(element){
        arr_genres_color.push('#'+element.toHexColour());
    });

    var ctx4 = document.getElementById('favoriteGenres').getContext('2d');
    var chart4 = new Chart(ctx4, {
        // The type of chart we want to create
        type: 'pie',

        // The data for our dataset
        data: {
            datasets: [
                {
                    data: arr_genres_count,
                    backgroundColor: arr_genres_color,
                    label: 'Genres'
                }
            ],
            labels: arr_genres_uniq
        },

        // Configuration options go here
        options: {
            responsive: true
        }
    });


    //CHART 5

    var arr_genders = [${arr_userGender}];
    arr_genders = arr_genders.filter(function(n){ return n != undefined });

    var arr_genders_uniq = [...new Set(arr_genders)];
    arr_genders_uniq.sort();

    var arr_genders_count = count_uniq(arr_genders,arr_genders_uniq);
    var arr_genders_color = ['#FA58F4','#58ACFA'];

    var ctx5 = document.getElementById('genders').getContext('2d');
    var chart5 = new Chart(ctx5, {
        // The type of chart we want to create
        type: 'pie',

        // The data for our dataset
        data: {
            datasets: [
                {
                    data: arr_genders_count,
                    backgroundColor: arr_genders_color,
                    label: 'Genders'
                }
            ],
            labels: arr_genders_uniq
        },

        // Configuration options go here
        options: {
            responsive: true
        }
    });


    //CHART 6

    var arr_ages = [${arr_userAge}];
    arr_ages = arr_ages.filter(function(n){ return n != undefined });

    var arr_ages_uniq = [...new Set(arr_ages)];
    arr_ages_uniq.sort();

    var arr_ages_count = count_uniq(arr_ages,arr_ages_uniq);

    var arr_ages_color = [];
    arr_ages_uniq.forEach(function(element){
        arr_ages_color.push('#'+element.toHexColour());
    });


    var ctx6 = document.getElementById('ages').getContext('2d');
    var chart6 = new Chart(ctx6, {
        // The type of chart we want to create
        type: 'pie',

        // The data for our dataset
        data: {
            datasets: [
                {
                    data: arr_ages_count,
                    backgroundColor: arr_ages_color,
                    label: 'Ages'
                }
            ],
            labels: arr_ages_uniq
        },

        // Configuration options go here
        options: {
            responsive: true
        }
    });



</script>


</html>