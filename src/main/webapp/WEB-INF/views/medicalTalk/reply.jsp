<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script src="https://code.jquery.com/jquery-latest.min.js"
		type="application/javascript"></script>
	<script type="application/javascript"
		src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
 
<script>
	var bidx = '${vo.bidx}'; //게시글 번호
	 
	$('[name=replyInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	    var insertData = $('[name=replyInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	    replyInsert(insertData); //Insert 함수호출(아래)
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
	                a += '<div class="replyArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                a += '<div class="replyInfo'+value.pidx+'">'+'댓글번호 : '+value.pidx+' / 작성자 : '+value.pwriter;
	                a += '<a onclick="replyUpdate('+value.pidx+',\''+value.pcontent+'\');"> 수정 </a>';
	                a += '<a onclick="replyDelete('+value.pidx+');"> 삭제 </a> </div>';
	                a += '<div class="replyContent'+value.pidx+'"> <p> 내용 : '+value.pcontent +'</p>';
	                a += '</div></div>';
	            });
	            
	            $(".replyList").html(a);
	        }
	    });
	}
	 
	//댓글 등록
	function replyInsert(insertData){
	    $.ajax({
	        url : 'medicalView/reply/insert',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	            if(data == 1) {
	            	replyList(); //댓글 작성 후 댓글 목록 reload
	                $('[name=pcontent]').val('');
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
	 
	 
	 
	 
	$(document).ready(function(){
		replyList(); //페이지 로딩시 댓글 목록 출력 
	});
	 
	 
 
</script>

