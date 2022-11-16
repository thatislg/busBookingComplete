<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

<body>
	<header class = "flex">
		<div class = "container">
			<div class = "header-title">
				<h1>ENJOY YOUR JOURNEYS<br>ENJOY YOUR LIFE</h1>
				<p>いいバスに乗って自分のツアーをより楽しくしよう！</p>
			</div>
			<div class = "header-form">
				<h2>路線選択</h2>
				<form class = "flex">
					<input type = "text" class = "form-control" placeholder = "出発地"/>
					<input type = "date" class = "form-control" placeholder = "Date"/>
					<input type = "text" class = "form-control" placeholder = "到着地"/>
					<input type = "submit" class = "btn" value = "検索" formaction="/routeSearch/search">
				</form>
			</div>
		</div>
	</header>
	<!-- section -->
	<section class="contents" >
		<section class="section section-information">
		    <div class="in-section">
		        <h2 class="bg-black"><i class="fa fa-info-circle"></i>お知らせ</h2>
		        <div class="wrap-article">
	                <article>
	                        <time datetime="2022.11.15">2022.11.15</time>
	                            <h3><a href="">VTI株式会社からのお知らせ</a></h3>
	                    <div class="body">
	                        新型コロナウイルスの影響に伴う運行再開情報について
	                    </div>
	                </article>
	                <article>
	                        <time datetime="2022.06.10">2022.06.10</time>
	                            <h3><a href="">発車オ～ライネットからのお知らせ</a></h3>
	                    <div class="body">
	                        ＪＴＢ高速バス　コンビニエンスストアにおける販売休止について
	                    </div>
	                </article>
	                <article>	                  
	                        <time datetime="2022.8.10">2022.8.10</time>
	                            <h3><a href="">阿佐海岸鉄道からのお知らせ</a></h3>	                   
	                    <div class="body">
	                        世界初！DMV運行開始に伴うご予約について
	                    </div>
	                </article>
	                <article>          
	                        <time datetime="2022.16.19">2022.16.19</time>
	                            <h3><a href="">VTI株式会社からのお知らせ</a></h3>	                  
	                    <div class="body">
	                        2021年11月10日施行　会員規約改定について
	                    </div>
	                </article>
		        </div>
		    </div>
		</section>
	</section>	
	<!-- end ofsection -->		
	
	<!-- js -->
	<script src = "js/script.js"></script>
	<!-- end of js -->
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>
