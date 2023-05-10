<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/menu.do" />
<link rel="stylesheet" href="/css/egovframework/com/jpg/index.css">
<script src="/js/egovframework/com/jpg/index.js"></script>


<script>

$(function() {
	var outMsg = '${outMsg}';

	if (outMsg.length > 1) {
		alert(outMsg);
	}

});

function getCookie(name){
	  var nameOfCookie = name + "=";
	  var x = 0

	  while( x <= document.cookie.length){
	    var y = (x+nameOfCookie.length);

	    if(document.cookie.substring(x, y) == nameOfCookie){
	      if((endOfCookie=document.cookie.indexOf( ";",y )) == -1)
	        endOfCookie = document.cookie.length;
	      return unescape(document.cookie.substring(y, endOfCookie));
	    }

	    x = document.cookie.indexOf( " ", x ) + 1;

	    if( x == 0 )
	      break;
	  }

	  return "";
	}

</script>


<c:forEach var="pop" items="${popList}" varStatus="status">
      	<c:import url="/uss/ion/pwm/openPopupManage.do" charEncoding="utf-8">
			<c:param name="popupId" value="${pop.popupId}" />
		    <c:param name="fileUrl" value="${pop.fileUrl}" />
			<c:param name="stopVewAt" value="Y" />
			<c:param name="popCount" value="${status.count}"/>
		</c:import>
		
</c:forEach>
<div id="container">
	<!--start section01//bannerview.jsp-->
		<c:import url="/uss/ion/bnr/getBannerImage.do" charEncoding="utf-8">
			<c:param name="atchFileId" value="${banner.bannerImageFile}" />
		</c:import>
	<!--end panel-1-->  
	<div class="side_menu">
		<div class="tab">
			<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=M" title="공연일정 바로가기"><img src="/images/egovframework/com/jpg/sd_icon01.png" alt=""><span>공연일정</span></a> 
			<a href="/contents.do?id=ticketing" title="공연예매 바로가기"><img src="/images/egovframework/com/jpg/sd_icon02.png" alt=""><span>공연예매</span></a> 
			<a href="/contents.do?id=location" title="오시는 길 바로가기"><img src="/images/egovframework/com/jpg/sd_icon03.png" alt=""><span>오시는길</span></a>
			<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000044" title="뉴스레터 바로가기"><img src="/images/egovframework/com/jpg/sd_icon04.png" alt=""><span>뉴스레터</span></a>
		</div>
		<div class="sns_url">
			<a href="" title="인스타그램 바로가기(새창)" target="_blank"><img src="/images/egovframework/com/jpg/sd_icon05.png" alt=""></a>
			<a href="" title="유튜브 바로가기(새창)" target="_blank"><img src="/images/egovframework/com/jpg/sd_icon06.png" alt=""></a>
			<a href="" title="블로그 바로가기(새창)" target="_blank"><img src="/images/egovframework/com/jpg/sd_icon07.png" alt=""></a>
			<a href="" title="카카오채널 바로가기(새창)" target="_blank"><img src="/images/egovframework/com/jpg/sd_icon08.png" alt=""></a>
		</div>
	</div>
	<!--end side_menu-->

	<!--start content-->
	<div class="content">
		<!--start panel-2-->

		<div class="section seciton01">
			<div class="inner">
				<h2 class="h2_title">Only for Greeners</h2>
				<div class="poster_list">
					<!--start 공연포스터-->
					
					<c:set var="now" value="<%=new java.util.Date()%>" />
					<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set> 
							
					<div class="poster">
						<c:forEach items='${list5}' var="list5" varStatus="status">
							<div class="slick-slide" >
								<a tabindex="1" class="tabindex_slick"  href="/cop/bbs/selectArticleDetail.do?bbsId=${list5.bbsId}&nttId=${list5.nttId}&skin=M" style="display:block">
									<div class="post_img">
										<c:choose>
											<c:when test="${list5.ntceEndde >= sysYear}">
												<img src="/cmm/fms/getImage.do?atchFileId=${list5.atchFileId}" alt="<c:out value='${list5.nttSj}'/>">
											</c:when>
											<c:when test="${list5.ntceEndde < sysYear}">
												<img src="/cmm/fms/getImage.do?atchFileId=${list5.atchFileId}" class="grayimg" alt="<c:out value='${list5.nttSj}'/>">
											</c:when> 
										</c:choose>
									</div>
									<div class="poster_tit">
										<p class="mini_tit">
											<c:choose>
											<c:when test="${list5.type =='토요'}">
												<span class="bedge blue">토요</span>
											</c:when>
											<c:when test="${list5.type =='정기'}">
												<span class="bedge pink">정기</span>
											</c:when>
											<c:when test="${list5.type =='기획'}">
												<span class="bedge green">기획</span>
											</c:when>
											</c:choose>
											<c:out value='${list5.sjBoldAtMain}'/>
										</p>
										<h3 class="post_sj"><c:out value='${list5.nttSj}' escapeXml="false"/></h3>
										<p class="post_date">${fn:substring(list5.ntceBgnde,0,10)} - ${fn:substring(list5.ntceEndde,0,10)}</p>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>

					<div class="btn_box">
						<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000055&skin=M" class="btn_000">자세히 보기</a>
					</div>
					<!--end 공연포스터-->

				</div>
				<div class="line_box pc">
					<div class="line"></div>
					<div class="line"></div>
					<div class="line"></div>
					<div class="line"></div>
					<div class="line"></div>
				</div>
			</div>
		</div>

		
		<div class="section seciton02">
			<div class="inner">
				<div class="sns_thumb">
					<div class="sns_tit">
						<h2 class="h2_title">#NOW ON</h2>

						<div class="sns_nav">
							<button type="button" class="sns_prev material-icons" title="이전" ></button>
							<button type="button" class="sns_play material-icons" style="display: none;" title="재생"></button>
							<button type="button" class="sns_pause material-icons" title="정지"></button>
							<button type="button" class="sns_next material-icons" title="다음"></button>
						</div>
					</div>
					<div id="insta_con" class="tabcontent2 btnb_alls_od" style="display:block;">
						<div class="thumb_list insta_list_allbox01">
							<!--  인스타 -->
							<c:forEach items='${instar}' var="instar" varStatus="status">
								<div class="slick-slide sns_list">
									<a tabindex="0"  href='<c:out value="${instar.snsLink }"/>' target="_blank" title="전남도립국악단 인스타그램 바로가기(새창)">
										<img src="/cmm/fms/getImage.do?atchFileId=${instar.snsFile}" alt="<c:out value='${instar.snsTitle}'/>" style="height:100%; object-fit:cover;">
										<div class="sns_sj">
											<img src="/images/egovframework/com/jpg/insta_icon.png" class="insta_icon" alt="인스타그램">
											<p><c:out value='${instar.snsTitle}'/></p>
										</div>
									</a>
								</div>
							</c:forEach>
							<!--
							<c:forEach items='${youtube}' var="youtube" varStatus="status">
								<div class="slick-slide sns_list">
									<a tabindex = "3" href='<c:out value="${youtube.snsLink }"/>' target="_blank" title="유튜브 공유하기(새창)">
										<img src="/cmm/fms/getImage.do?atchFileId=${youtube.snsFile}" alt="<c:out value='${youtube.snsTitle}'/>" >
										<div class="sns_sj">
											<img src="/images/egovframework/com/jpg/youtube_icon.png" class="youtube_icon">
											<p><c:out value='${youtube.snsTitle}'/></p>
										</div>
									</a>
								</div>
							</c:forEach>
							-->
						</div>
					</div>
				</div>
				<div class="line_box pc">
					<div class="line"></div>
					<div class="line"></div>
					<div class="line"></div>
					<div class="line"></div>
					<div class="line"></div>
				</div>
			<!--end 인스타,전라남도 도립 국악단 유투브 썸네일-->
			</div>
		</div>
		<!--end paneanl-2-->
		<form id="subForm" name="BoardVO" method="post" action="/cop/bbs/selectArticleDetail.do" style="display: hidden">
			<input class="nttIdVal" name="nttId" type="hidden" value="">
			<input class="bbsIdVal" name="bbsId" type="hidden" value="">
			<input class="pageIndexVal" name="pageIndex" type="hidden" value=""/>
			<input class="skinVal" name="skin" type="hidden" value=""/>
		</form>
		<div class="section section03">
			<div class="inner">
				<div class="latest" id="notice">
					<div class="la_head">
						<h3 class="latest_tit">NOTICE</h3>
						<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000041" title="공지사항 더보기" class="go_btn">+</a>
					</div>
					<ul id="latest_list">
						<c:forEach items='${list1}' var="list1" varStatus="status">
							<li>
								<div class="ntc_list" data-nttid="<c:out value="${list1.nttId}"/>" data-bbsid="<c:out value="${list1.bbsId}"/>" data-pageindex="<c:out value='${searchVO.pageIndex}'/>" data-skin="<c:out value='${boardMasterVO1.bbsTyCode}'/>">
									<a class="goBtn" href="/cop/bbs/selectArticleDetail.do?nttId=${list1.nttId}&bbsId=${list1.bbsId}" id="tabContents" tabindex="0">
										<p class="list_sj"><span class="list_date"><c:out value='${list1.frstRegisterPnttm}'/></span><c:out value='${list1.nttSj}'/></p>
									</a>
								</div>
							</li>
						</c:forEach> 
					</ul>
					<div class="la_nav">
						<button type="button" class="la_prev material-icons" title="이전"></button>
						<button type="button" class="la_next material-icons" title="다음"></button>
					</div>
				</div>
				<div class="latest">
					<div class="la_head">
						<h3 class="latest_tit">채용공고</h3>
						<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000042" title="채용공고 더보기" class="go_btn">+</a>
					</div>
					<ul id="latest_list02">
						<c:forEach items='${list2}' var="list2" varStatus="status">
							<li>
								<div class="ntc_list" data-nttid="<c:out value="${list2.nttId}"/>" data-bbsid="<c:out value="${list2.bbsId}"/>" data-pageindex="<c:out value='${searchVO.pageIndex}'/>" data-skin="<c:out value='${boardMasterVO1.bbsTyCode}'/>">
									<a class="goBtn" href="/cop/bbs/selectArticleDetail.do?nttId=${list2.nttId}&bbsId=${list2.bbsId}">
										<p class="list_sj"><span class="list_date"><c:out value='${list2.frstRegisterPnttm}'/></span><c:out value='${list2.nttSj}'/></p>
									</a>
								</div>
							</li>
						</c:forEach> 
					</ul>
					<div class="la_nav02">
						<button type="button" class="la_prev material-icons" title="이전"></button>
						<button type="button" class="la_next material-icons" title="다음"></button>
					</div>
				</div>
				<div class="latest">
					<div class="la_head">
						<h3 class="latest_tit">교육체험</h3>
						<a href="/cop/bbs/selectArticleList.do?bbsId=BBSMSTR_000000000046" title="채용공고 더보기" class="go_btn">+</a>
					</div>
					<ul id="latest_list03">
						<c:forEach items='${list4}' var="list4" varStatus="status">
							<li>
								<div class="ntc_list" data-nttid="<c:out value="${list4.nttId}"/>" data-bbsid="<c:out value="${list4.bbsId}"/>" data-pageindex="<c:out value='${searchVO.pageIndex}'/>" data-skin="<c:out value='${boardMasterVO1.bbsTyCode}'/>">
									<a class="goBtn" href="/cop/bbs/selectArticleDetail.do?nttId=${list4.nttId}&bbsId=${list4.bbsId}">
										<p class="list_sj"><span class="list_date"><c:out value='${list4.frstRegisterPnttm}'/></span><c:out value='${list4.nttSj}'/></p>
									</a>
								</div>
							</li>
						</c:forEach> 
					</ul>
					<div class="la_nav03">
						<button type="button" class="la_prev material-icons" title="이전"></button>
						<button type="button" class="la_next material-icons" title="다음"></button>
					</div>
				</div>
			</div>
			
		</div>

			

			<!--start tab_body-->

			<!--end tab_body-->
		</div>
		<!--end panel-3-->

		<%@ include file="/WEB-INF/jsp/egovframework/com/jpg/include/footer.jsp"%>
	<!--end content-->
</div>
<!--end container-->

</div>
<!--end wrap-->

<script>
	//1st sec
	$('.visual').slick({
		dots : true,
		infinite : true,
		autoplay : true,
		autoplaySpeed : 3000,
		slidesToShow : 1,
		slidesToScroll : 1,
		focusOnSelect : true,
		fade : false,
		swipeToSlide: true,
		//variableWidth: true,
		adaptiveHeight : false,
		appendDots: $('.slick_nav'),
		arrows: true,
		prevArrow: $('.slick_nav .prev'),
		nextArrow: $('.slick_nav .next')
	});

	$('.play').on('click', function() {
	  $('.visual').slick('slickPlay');
	});

	$('.pause').on('click', function() {
	  $('.visual').slick('slickPause');
	});


	  function fixSlickStyle(event, slick) {
		if (slick.slideCount <= slick.options.slidesToShow) {
		  slick.$slideTrack.css('transform','');
		}
	  }

	  $('.poster,.thumb_list')
	  .on('setPosition', function(event, slick) {
		fixSlickStyle(event, slick);
	  })
	  .on('afterChange', function(event, slick, currentSlide){
		fixSlickStyle(event, slick);
	  })

	$('.slick_btn button').click(function(e){
		e.preventDefault();
		$this = $(this);
		slickControl( $this, '.visual', '.pause', '.play');
	});	

	// slick control
	function slickControl($this, slick, stop, play){
		$slick = $(slick); //slider wrap
		$stop = $(stop); //Stop Button
		$play = $(play);//Play Button

		if($this.is(stop)){
			$stop.css('display','none');
			$play.delay(100).css('display','inline-block').focus();
			$slick.slick('slickPause');
		}
		if($this.is(play)){
			$play.css('display','none');
			$stop.delay(100).css('display','inline-block').focus();
			$slick.slick('slickPlay');
		}
	};

	//2nd sec poster
	$('.poster').slick({
		dots : false,
		arrows : false,
		infinite : true,
		autoplay : true,
		autoplaySpeed : 5000,
		slidesToShow : 4,
		//focusOnSelect : true,
		slidesToScroll : 4,
		adaptiveHeight : false,
		responsive : [
			{
				breakpoint : 1199,
				settings : {
					slidesToShow : 3,
					slidesToScroll : 3,
				}
			}, {
			breakpoint : 1024,
			settings : {
				slidesToShow : 2,
				slidesToScroll : 2,
			}
		}, {
			breakpoint : 480,
			settings : {
				slidesToShow : 2,
				slidesToScroll : 2,
				arrows : true
			}
		} ]
	});

	//2nd sec sns thumb
function windowOpen(url,target){
	
	if(confirm("해당 페이지로 이동을 하시겠습니까?")){
		window.open(url, target);
		}
	}
	$('.thumb_list').slick({
		dots : false,
		arrows : true,
		infinite : true,
		autoplay : true,
		autoplaySpeed : 5000,
	    focusOnSelect: true,
		slidesToShow : 4,
		slidesToScroll : 1,
		adaptiveHeight : false,
		prevArrow: $('.sns_nav .sns_prev'),
		nextArrow: $('.sns_nav .sns_next'),
		responsive : [
			{
				breakpoint : 1199,
				settings : {
					slidesToShow : 3,
					slidesToScroll : 3,
				}
			}, {
			breakpoint : 768,
			settings : {
				slidesToShow : 2,
				slidesToScroll : 2,
			}
		}, {
			breakpoint : 600,
			settings : {
				slidesToShow : 1,
				slidesToScroll : 1,
			}
		} ]
	});
	$('.thumb_list .slick-slide a').on('mouseenter', function() {
	  $(this).children('.sns_sj').addClass('on');
	});

	$('.thumb_list .slick-slide a').on('mouseleave', function() {
	  $(this).children('.sns_sj').removeClass('on');
	});

	$('.thumb_list .slick-slide a').on('focus', function() {
	  $(this).children('.sns_sj').addClass('on');
	});

	$('.thumb_list .slick-slide a').on('blur', function() {
	  $(this).children('.sns_sj').removeClass('on');
	});


	$('.sns_play').on('click', function() {
	  $('.thumb_list').slick('slickPlay');
	});

	$('.sns_pause').on('click', function() {
	  $('.thumb_list').slick('slickPause');
	});

	$('.sns_nav button').click(function(e){
		e.preventDefault();
		$this = $(this);
		slickControl2( $this, '.thumb_list', '.sns_pause', '.sns_play');
	});	

	// slick control
	function slickControl2($this, slick, stop, play){
		$slick = $(slick); //slider wrap
		$stop = $(stop); //Stop Button
		$play = $(play);//Play Button

		if($this.is(stop)){
			$stop.css('display','none');
			$play.delay(100).css('display','inline-block').focus();
			$slick.slick('slickPause');
		}
		if($this.is(play)){
			$play.css('display','none');
			$stop.delay(100).css('display','inline-block').focus();
			$slick.slick('slickPlay');
		}
	};

	$('#latest_list').slick({
		vertical: true,
		infinite: true,
		autoplay: true,
		focusOnSelect : true,
		slidesToShow: 1,
		dot:false,
		prevArrow: $('.la_nav .la_prev'),
		nextArrow: $('.la_nav .la_next'),
		arrows:true,
	});

	$('#latest_list02').slick({
		vertical: true,
		infinite: true,
		autoplay: true,
		focusOnSelect : true,
		slidesToShow: 1,
		dot:false,
		arrows:true,
		prevArrow: $('.la_nav02 .la_prev'),
		nextArrow: $('.la_nav02 .la_next'),
	});

	$('#latest_list03').slick({
		vertical: true,
		infinite: true,
		autoplay: true,
		focusOnSelect : true,
		slidesToShow: 1,
		dot:false,
		arrows:true,
		prevArrow: $('.la_nav03 .la_prev'),
		nextArrow: $('.la_nav03 .la_next'),
	});


	// http://www.dte.web.id/2013/02/event-mouse-wheel.html

	//panel-2 tab
	function openCity2(evt, cityName) {
		var i, tabcontent2, tablinks2;
		tabcontent2 = document.getElementsByClassName("tabcontent2");
		for (i = 0; i < tabcontent2.length; i++) {
			tabcontent2[i].style.display = "none";
		}
		tablinks2 = document.getElementsByClassName("tablinks2");
		for (i = 0; i < tablinks2.length; i++) {
			tablinks2[i].className = tablinks2[i].className.replace(" active",
					"");
		}
		document.getElementById(cityName).style.display = "block";
	}

	//document.getElementById("defaultOpen2").click();
	
	//panel-3 tab
	$(function(){
        var tabMenu = $(".tab02");
        var $tabButton = $(".tab02 > div > button");

        //컨텐츠 내용을 숨겨주세요!
        tabMenu.find("div > .tabcontent").hide();
        tabMenu.find("div.active > .tabcontent").show();

        //두번째 버튼 클릭 --> 모든 active 삭제 --> 내가 클릭한 버튼 active 추가
        function tabList(e){
        //e.preventDefault(); //#의 기능을 차단
        var target = $(this);
        target.next().show().parent("div").addClass("active").siblings("div").removeClass("active").find(".tabcontent").hide();    
        }

        tabMenu.find("div > button").click(tabList).focus(tabList);

        $tabButton.on("click focusin", function() {
            $tabButton.remove('atv');
            $(this).addClass("atv");
        });
    });

	
	//panel-3 tab
	function openCity(evt, cityName) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}
		document.getElementById(cityName).style.display = "block";
		//evt.currentTarget.className += " atv";
	}

	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();

	function go_url(url) {
		if (url != '')
			window.open(url, '_blank');
	}

	$(".goBtn").on("click", function() {
		var baseDom = $(this).parent();
		
		$("#subForm .nttIdVal").val(baseDom.data("nttid"));
		$("#subForm .bbsIdVal").val(baseDom.data("bbsid"));
		$("#subForm .pageIndexVal").val(baseDom.data("pageindex"));	
		$("#subForm .skinVal").val(baseDom.data("skin"));	
		$("#subForm").submit();
	});
	
	function tapOpen(type){
		if(type == "insta"){
			$("#youtube_con").hide();
			$("#insta_con").show();
			$(".youtube").attr("title","유튜브");
			$(".insta").attr("title","인스타그램 선택됨");
			$(".youtube").removeClass("selected");
			$(".insta").addClass("selected");
			//init(type);
			$('.thumb_list').slick('resize');
		}else{
			$("#youtube_con").show();
			$("#insta_con").hide();
			$(".insta").attr("title","인스타그램");
			$(".youtube").attr("title","유튜브 선택됨");
			$(".insta").removeClass("selected");
			$(".youtube").addClass("selected");
			//init(type);
			 $('.thumb_list2').slick('resize');
		}

		
	}
	var agent = navigator.userAgent.toLowerCase();
	
	
	//$(".tabindex_slick").attr("tabindex", "3");
</script>

</body>

</html>