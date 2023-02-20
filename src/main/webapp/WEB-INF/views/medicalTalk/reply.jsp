<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="path" value="${pageContext.request.contextPath}" />
	<script src="https://code.jquery.com/jquery-latest.min.js"
		type="application/javascript"></script>
	<script type="application/javascript"
		src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
 
<script>
	var bidx = ${vo.bidx}; //게시글 번호
	var mname = '${member.mname}';
	var midx = ${member.midx};
//	var likeval = ${like};
/* 	var pidx = ${ro.pidx}; */
	
	console.log("게시물 번호 : " + bidx);
	console.log("멤버 이름 : " + mname);
	console.log("멤버 id : " + midx);
//	console.log("좋아요 여부 : " + likeval);
	
	$('[name=replyInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시
	    var insertData = $('[name=replyInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	    console.log("eeee"+insertData);
	    replyInsert(insertData);
	});
	
	
	
	//댓글 목록
	function replyList(){
		
	    $.ajax({
	        url : 'medicalView/reply/list',
	        type : 'get',
	        data : {'bidx':bidx,'midx':midx},
	       		
	        success : function(data){
	            var a ='';
	            $.each(data, function(key, value){
/* 	            	console.log("replyList() / ajax succes / foreach : key :"+ key );
	            	console.log('bidx : ' + bidx);
	            	console.log('value.pidx : ' + value.pidx);

 */	
	            	console.log('value.likeCheck : ' + value.likeCheck);
	                a += '<div class="replyArea" style="border: 3px solid #FF8F8F; border-radius: 25px;	width: 1100px; height:280px; margin-bottom: 15px;">';
	                a += '<div class="replyMain" style="display:flex;">';
	                a += '<div class="replyTitle'+value.ptitle+'" style="margin:15px 0 10px 65px; width: 930px; height: 35px; text-align: left; font-size: 25px;">'+value.ptitle+'';
	                a += '</div>';
	                a += '<div class="replyLike" style="width:35px; hieght:35px; margin-top:15px;">';
	            	a += '<input type="hidden" name="bidx" value="'+ bidx + '">';
	            	a += '<input type="hidden" name="pidx" value="'+ value.pidx + '">';
	            	a += '<input type="hidden" name="pwriter" value="'+ value.pwriter + '">';
	            	a += '<input type="hidden" name="midx" value="'+ value.midx + '">';
	           	 	if (midx == 0){
	                a += '<buttonclass="LikeBtn" onclick="login_need()" ><img src="${path }/resources/image/dislike.png" id="like_img"></button>';
	            	}else if(midx !== 0){
	            		if( value.likeCheck == 0 )
	            		{
							a += '<button class="LikeBtn" style="border:none; background-color:#fff; width:25px; height:25px; cursor:pointer;" type="button" onclick="doLike('+value.pidx+','+value.midx+','+ value.likeCheck +',this);"><img src="${path }/resources/image/dislike.png" name="like_img" style="width:25px; height:25px;"></button>';
	            		}else{
							a += '<button class="LikeBtn" style="border:none; background-color:#fff; width:25px; height:25px; cursor:pointer;" type="button" onclick="doLike('+value.pidx+','+value.midx+','+ value.likeCheck +',this);"><img src="${path }/resources/image/like.png" name="like_img" style="width:25px; height:25px;"></button>';
	            		}
	            	}
	                a += '</div>';
	                a += '<div class="replyLikeCount'+value.plikecount+'" style="width:35px; hieght:35px; margin-top:15px;">';
	                a += '</div>';
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
	    a += '<input type="text"  id="ptitle" name="ptitle_'+pidx+'" placeholder="제목을 입력하세요." style="border-radius: 10px;	margin: 10px 0 10px 40px;width: 1000px;	height: 35px;text-align: left;font-size: 25px;">'
	    a += '<input type="text" name="pcontent_'+pidx+'" value="'+pcontent+'" style="	width: 1000px;margin: 0 0 10px 40px;height: 150px; border-radius: 10px;"/>';
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
	
	// 버튼 눌렀을때 호출되는 함수
	function doLike(pidx,midx,like_check,obj){
		
		// 호출이 되었는지 alert으로 띄움
//		alert("doLike call");
		// 값이 제대로 넘어왔는지, 콘솔에 찍음
//		console.log("pidx : " + pidx );
//		console.log("midx : " + midx );
//		console.log("likecheck :" + like_check);
		console.log("this :" + obj.tagName);
		console.log("chilren :" + obj.children[0].getAttribute('src'));
//		console.log("src :" + obj.children[0].getAttribute('src'));
		
		// 기존에 좋아요를 눌렀는지 판단하고
		if(like_check > 0){
			alert("좋아요 취소");
			// 좋아요를 취소하는 ajax
 			$.ajax({
				type :'post',
				url : 'medicalView/reply/likeDown',
				data : {"pidx" : pidx, "midx" : midx},
				success : function(data) {
					replyList();
//					obj.children[0].setAttribute('src',"${path }/resources/image/dislike.png")
					alert('취소 성공');
				}
			});
		}else{
			alert("좋아요");
			// 좋아요를 추가하는 ajax
 			$.ajax({
				type :'post',
				url : 'medicalView/reply/likeUp',
				data : {"pidx" : pidx, "midx" : midx},
				success : function(data) {
					replyList();
//					obj.children[0].setAttribute('src',"${path }/resources/image/like.png")
					alert('좋아요 성공');
				}
			});
		}
	}
	
/* 	if(likeval > 0){
		console.log(likeval + "좋아요 누름");
		$('.LikeBtn').html("좋아요 취소");
		$('.LikeBtn').click(function() {
			alert("기존  취소 call");
			$.ajax({
				type :'post',
				url : 'medicalView/reply/likeDown',
				data : {"pidx" : pidx, "midx" : midx},
				success : function(data) {
					alert('취소 성공');
				}
			})
		})

	}else{
		console.log(likeval + "좋아요 안누름")
		console.log(midx);
		$('.LikeBtn').click(function() {
			alert("기존  좋아요 call");
			$.ajax({
				type :'post',
				url : 'medicalView/reply/likeUp',
				data : {"pidx" : pidx, "midx" : midx},
				success : function(data) {
					alert('성공염');
				}
			})
		})
	} */
	
/* 	if(likeval>0){
		$('.LikeBtn').html("좋아요취소");
		$('.LikeBtn').click(function like_func(idx){
			var likeData = $('[name= replylike' +idx+ ']').serialize();
			$ajax({
				type:'post',
				url : 'medicalView/reply/likeDown',
				data : likeData,
				
				success : function(data){
					alert('취소성공');
				}
				
				
			})
		})
	
			
	}else{
		$('.LikeBtn').click(function like_func(idx) {
			var likeData = $('[name= replylike'+idx+ ']').serialize();
			$ajax({
				type:'post',
				url : 'medicalView/reply/likeUp'+likeno,
				data : likeData,
				success : function(data){
					alert('좋아요성공');
				}
		})
	})
		
	}	
	
 */
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
	
	#like_img{
		width:25px; height:25px;
	
	}
	
		
	.input-group {
		height:280px;
		width: 1100px;
		margin: 0 auto 0;
		border: 3px solid #FF8F8F;
		border-radius: 25px;
	}
	

	input#ptitle {
		border-radius: 10px;
		margin: 10px 0 10px 40px;
		width: 1000px;
		height: 35px;
		text-align: left;
		font-size: 25px;
	}
	
	input#pcontent {
		width: 1000px;
		margin: 0 0 10px 40px;
		height: 150px;
		border-radius: 10px;
	}
	
	.input-group-btn {
		display: inline-block;
		width: 230px;
		height: 40px;
		margin-left:820px;
		margin-bottom:10px;
	}
	
	
	.input-group-btn button {
		font-weight: bold;
		width: 100px;
		padding: 10px;
		font-size: 15px;
		background-color: #FFEFEF;
		border: #FFEFEF;
		border-radius: 30px;
		margin-left:10px;
		
	} 
	.input-group-btn button:hover{
		
</style>
