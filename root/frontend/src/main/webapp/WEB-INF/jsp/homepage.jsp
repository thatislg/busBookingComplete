<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="http://localhost:9082/css/style.css"/>
	<!-- header -->
	<header class = "flex" style="background:linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),url(../img/bus5.jpg) center/cover no-repeat;">
		<div class = "container">
			<div class = "title">
				<h1>ENJOY YOUR JOURNEYS<br>ENJOY YOUR LIFE</h1>
				<p>心地良いバスに乗り、自分のツアーを最も楽しもう！</p>
			</div>
			<div class = "header-form">
				<h2>路線検索</h2>
				<form class = "flex" action = "routeSearch/search" id="search-form">
					<input type = "text" class = "form-control" placeholder = "出発地（都道府県）" name="departurePrefecture" oninvalid="this.setCustomValidity('入力必須')" onchange="this.setCustomValidity('')" required/>
					<input type = "text" onfocus="(this.type='date')" min="${today}" max="${nMonth}" class = "form-control" placeholder = "例：12/31/2022" name="departureDate" oninvalid="this.setCustomValidity('選択必須')" onchange="this.setCustomValidity('')" required/>
					<input type = "text" class = "form-control" placeholder = "到着地（都道府県）" name="arrivalPrefecture" oninvalid="this.setCustomValidity('入力必須')" onchange="this.setCustomValidity('')" required/>
					<button type="submit" form="search-form" class="btn"><i class="fa-solid fa-magnifying-glass"> 検索</i></button>
				</form>
			</div>
		</div>
	</header>
	<!-- end of header -->
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
	<!-- end of section -->		
	

<jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>
