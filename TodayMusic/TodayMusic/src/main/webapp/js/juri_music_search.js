/**
 * 
 */

function fnGetList(sGetToken){
      var $getval = $("#search_box").val();
 
       if($getval==""){
 
        alert("검색어를 입력하세요.");
        $("#search_box").focus();
        return;
    }
 
    $("#get_view").empty();
    $("#nav_view").empty();
 
    /* //https://developers.google.com/youtube/v3/docs/search/list */
 
    var order = "relevance";
    var maxResults = "50";
    /* API KEY */
    var key = "AIzaSyDr2RhsPKAQMwq1kvq3xzlWWfj451WW2Hs";
 
 
 
    var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order="+order
 
            + "&q="+ encodeURIComponent($getval) +"&key="+key+"&maxResults="+maxResults;
 
    console.log(sGetToken);
 
    if(sGetToken != null){
        sTargetUrl += "&pageToken="+sGetToken+"";
    }
 
    console.log(sTargetUrl);
 
    $.ajax({
        type: "POST",
        url: sTargetUrl,
        dataType: "jsonp",
        success: function(jdata) {
            console.log(jdata);
 

            $(jdata.items).each(function(i){
 
                /* console.log(this.snippet.channelId); */
                $("#get_view").append("<p class='box'><a href='https://youtu.be/"+this.id.videoId+"' target='_blank'><img src='"+this.snippet.thumbnails.default.url+"'><span>"+this.snippet.title+"</span></a></p>");

            }).promise().done(function(){
 
                if(jdata.prevPageToken){
                    $("#nav_view").append('<a href="javascript:fnGetList(\''+jdata.prevPageToken+'\');"><이전페이지></a>');
                }
 
                if(jdata.nextPageToken){
                    $("#nav_view").append('<a href="javascript:fnGetList(\''+jdata.nextPageToken+'\');"><다음페이지></a>');
                }
            });
        },
 
        error:function(xhr, textStatus) {
            console.log(xhr.responseText);
            alert("[안내] 서버가 준비 중입니다. 다음에 다시 시도해보세요!");
            return;
        }
 
    });
 
}