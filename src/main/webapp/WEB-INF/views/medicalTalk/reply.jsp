<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="path" value="${pageContext.request.contextPath}" />
	<script src="https://code.jquery.com/jquery-latest.min.js"
		type="application/javascript"></script>
	<script type="application/javascript"
		src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
 
<script>
	var bidx = '${vo.bidx}'; //게시글 번호
	var mname = '${member.mname}';
	var midx = '${member.midx}';
	console.log("######"+bidx);
	console.log("$$$$$"+mname);
	console.log("#######"+midx);
	
	$('[name=replyInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시
		alert("reply.jsp / btn click : call");
	    var insertData = $('[name=replyInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	    console.log("eeee"+insertData);
	    replyInsert(insertData);
	});
	 
	 
	 
	//댓글 목록 
	function replyList(){
	    $.ajax({
	        url : 'medicalView/reply/list',
	        type : 'get',
	        data : {'bidx':bidx},
	       		
	        success : function(data){
	            var a =''; 
	            $.each(data, function(key, value){
/* 	            	console.log("replyList() / ajax succes / foreach : key :"+ key );
	            	console.log('bidx : ' + bidx);
	            	console.log('value.pidx : ' + value.pidx);

 */	
	                a += '<div class="replyArea" style="border: 3px solid #FF8F8F; border-radius: 25px;	width: 1100px; height:280px; margin-bottom: 15px;">';
	                a += '<div class="replyTitle'+value.ptitle+'" style="margin:15px 0 10px 65px; width: 970px; height: 35px; text-align: left; font-size: 25px;">'+value.ptitle+'';
	                a += '<div class="replyLike">';
	            	a += '<form name="reply_' + key +'">';
	            	a += '<input type="hidden" name="bidx" value="'+ bidx + '">';
	            	a += '<input type="hidden" name="pidx" value="'+ value.pidx + '">';
	            	a += '<input type="hidden" name="pwriter" value="'+ value.pwriter + '">';
	            	a += '<input type="hidden" name="midx" value="'+ value.midx + '">';
	           	 	if (midx == 0){
	                a += '<a href="javascript: login_need()"><img src="${path }/resources/image/dislike.png" id="like_img"></a>';
	            	}else if(midx !== 0){
	                a += '<a href="javascript: like_func(' + key + ');"><img src="${path }/resources/image/dislike.png"></a>';
	            	}
	                a += '</div>';
	                a += '</form>';
	                a += '</div>';
	                a += '<div class="replyContent'+value.pidx+'" style="margin: 0 0 10px 65px; width: 970px; height: 150px; ">  '+value.pcontent +'';
	                a += '</div>';
	                a += '<div class="hob" style="display:flex; width:1000px; margin-left:65px; margin-top:25px;" >';
	                a += '<div class="replyWriter'+value.pwriter+'" style="font-size:16px; margin-top:10px;">  '+value.pwriter +'';
	                a += '</div>';
	                a += '<div class="replyDate'+value.pdate+'" style="	margin-left:50px; font-size:16px; margin-top:10px;">  '+value.pdate +'';
	                a += '</div>';

	                a += '<div class="button" style="display:flex; margin-left:530px; margin-bottom:20px;">';
	                a += '<a onclick="replyUpdate('+value.pidx+',\''+value.pcontent+'\');" style="margin-left:10px; width: 80px; height: 15px; padding: 10px; font-size:15px; font-weight: bold; text-align:center; background-color: #FFEFEF; border: #FFEFEF; border-radius: 30px; "> 수정 </a>';
	                a += '<a onclick="replyDelete('+value.pidx+');"  style="margin-left:10px; width: 80px; height: 15px; padding: 10px; font-size:15px; font-weight: bold; text-align:center; background-color: #FFEFEF; border: #FFEFEF; border-radius: 30px; "> 삭제 </a> </div>';
	                a += '</div></div>';
	            	
	            });
	            
	            $(".replyList").html(a);
	        }
	    });
	}
	 
	//댓글 등록
	function replyInsert(insertData){
		alert("reply.jsp / replyInsert ajax ")
	    $.ajax({
	        url : 'medicalView/reply/insert',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	            if(data == 1) {
	            	replyList(); //댓글 작성 후 댓글 목록 reload
	                $('[name=pcontent]').val('');
	                $('[name=ptitle]').val('');
	                $('[name=pwriter]').val('');
	                $('[name=pdate]').val('');
	            }
	        }
	    });
	}
	 
	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function replyUpdate(pidx, pcontent){
	    var a ='';
	    
	    a += '<div class="input-group">';
	    a += '<input type="text" class="form-control" name="pcontent_'+pidx+'" value="'+pcontent+'"/>';
	    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="replyUpdateProc('+pidx+');">수정</button> </span>';
	    a += '</div>';
	    
	    $('.replyContent'+pidx).html(a);
	    
	}
	 
	//댓글 수정
	function replyUpdateProc(pidx){
	    var updateContent = $('[name=pcontent_'+pidx+']').val();
	    
	    $.ajax({
	        url : 'medicalView/reply/update',
	        type : 'post',
	        data : {'pcontent' : updateContent, 'pidx' : pidx},
	        success : function(data){
	            if(data == 1) replyList(pidx); //댓글 수정후 목록 출력 
	        }
	    }); 
	}
	 
	//댓글 삭제 
	function replyDelete(pidx){
	    $.ajax({
	        url : 'medicalView/reply/delete/'+pidx,
	        type : 'post',
	        success : function(data){
	            if(data == 1) replyList(bidx); //댓글 삭제후 목록 출력 
	        }
	    });
	}
	
 	function like_func(idx){
 		var likeData = $('[name=reply_'+ idx + ']').serialize();
	    console.log(likeData);

		$.ajax({
//			url: 'medicalView/reply/like.do'?pidx='+pidx+'&bidx='+bidx+'&pwriter='+pwriter,
			url: 'medicalView/reply/like.do',
			data: likeData,
			type: "get",
			cache: false, 
			dataType: "json",
			success: function(data) {
				alert(data.msg);
				var like_img = '';
				if(data.like_check == 0){
					like_img = "${path }/resources/image/dislike.png";
				}else {
					like_img = "${path }/resources/image/like.png";
				}
				var reply_form =  $('[name=reply_'+ idx + ']');
				$('#like_img', reply_form).attr('src', like_img);
				$('#plike').html(data.plike);
				$('#like_check').html(data.like_check);
			},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	} 

	 function login_need(){
		 alert("로그인 후 이용하실 수 있습니다.");
	 }
	
	 
	 
	 
	$(document).ready(function(){
		replyList(); //페이지 로딩시 댓글 목록 출력 
	});
	 
	 
 
</script>
<style>
.button a:hover {
		border-radius: 30px;
		transition: .2s;
		box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
		cursor: pointer;
	}
</style>

