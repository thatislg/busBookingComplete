<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@include file="/WEB-INF/jsp/common/define.jsp"%>
<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>
<!-- <link rel="stylesheet" href="./css/style.css"/> -->
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
					<select class = "form-control" name="departurePrefecture" id="departurePrefecture-select" oninvalid="this.setCustomValidity('選択必須')" onchange="this.setCustomValidity('')" required>
					    <option value="">--出発地--</option>
					    <c:forEach items="${prefectureList}" var="pf">
					    	<option value="${pf.prefecture}"><c:out value="${pf.prefecture}"/></option>
					 	</c:forEach>
					</select>
					<input type = "text" onfocus="(this.type='date')" min="${today}" max="${nMonth}" class = "form-control" placeholder = "出発日" name="departureDate" oninvalid="this.setCustomValidity('選択必須')" onchange="this.setCustomValidity('')" required/>
					<select class = "form-control" name="arrivalPrefecture" id="arrivalPrefecture-select" oninvalid="this.setCustomValidity('選択必須')" onchange="this.setCustomValidity('')" required>
					    <option value="">--到着地--</option>
					    <c:forEach items="${prefectureList}" var="pf">
					    	<option value="${pf.prefecture}"><c:out value="${pf.prefecture}"/></option>
					 	</c:forEach>
					</select>
					<button type="submit" form="search-form" class="btn"><i class="fa-solid fa-magnifying-glass"> 検索</i></button>
				</form>
			</div>
		</div>
	</header>
	<!-- end of header -->
	<!-- section -->
	<section class="contents" >	
		<section class="section section-pickup">
			<div class="in-section">
	                <h2><i class="fa fa-bus"></i>安心・安全への取り組み</h2>
	                <h3>当サイトは、国から厳しい審査を受けた<br>一般乗合バス事業者の路線バスのみ取り扱っております。</h3>
	                <div class="clearfix">
	                    <div class="figure"><img src="../img/photo-noriai.png" alt="安心安全への取り組み"></div>
	                    <div class="info-body">
	                        <p>道路運送法の規定に関わる審査を受け、国土交通大臣から許可を受けた事業者です。
	                        <br>安全にバスを運行できるか以下の内容を厳しく審査された後、許可を受けます。</p>
	                        <ul>
	                            <li>道路運送法に抵触しないような停留所の設置</li>
	                            <li>運転者の休憩、仮眠施設の設置</li>
	                            <li>車両の保管、設備施設の設置</li>
	                            <li>事故を未然に防ぐ為の教育及び、指導体制、社内規定の構築</li>
	                            <li>損害賠償能力</li>
	                            <li>財務内容</li>
	                        </ul>
	                        <p>運行路線は一つ一つ全て事前に認可を受ける必要があります。運行ルートや時刻表などのほかに、停留所の位置まで届け出て認可を受けております。
	                        <br>当サイトに掲載している路線バスは全て一般乗合バス事業者による「路線バス」です。非常に高いレベルの安全運行管理を実施しております。ご安心してご利用ください。</p>
	                    </div>
	                </div>
	          </div>
		</section>
     
		<section class="section section-information">
		    <div class="in-section">
		        <h2><i class="fa-solid fa-info"></i>お知らせ</h2>
		        <div class="wrap-article">
	                <article>
	                        <time>2022.11.15</time>
	                            <h3><a href="">VTI-BUS株式会社からのお知らせ</a></h3>
	                    <div class="body">
	                        新型コロナウイルスの影響に伴う運行再開情報について
	                    </div>
	                </article>
	                <article>
	                        <time>2022.06.10</time>
	                            <h3><a href="">発車オ～ライネットからのお知らせ</a></h3>
	                    <div class="body">
	                        ＪＴＢ高速バス　コンビニエンスストアにおける販売休止について
	                    </div>
	                </article>
	                <article>	                  
	                        <time>2022.8.10</time>
	                            <h3><a href="">阿佐海岸鉄道からのお知らせ</a></h3>	                   
	                    <div class="body">
	                        世界初！DMV運行開始に伴うご予約について
	                    </div>
	                </article>
	                <article>          
	                        <time>2022.16.19</time>
	                            <h3><a href="">VTI-BUS株式会社からのお知らせ</a></h3>	                  
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