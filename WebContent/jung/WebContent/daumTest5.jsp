<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>    
<%@ page import = "java.sql.*" %>   <%-- JDBC 관련 클래스 import --%>
<%!
	// JDBC 관련 기본 객체 변수들 선언
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;   // executeQuery(), SELECT 결과 
	int cnt = 0;           // executeUpdate(), DML 결과
	
	// Connection 에 필요한 값 세팅
	String driver = "org.mariadb.jdbc.Driver";	  // JDBC 드라이버 클래스
	String url = "jdbc:mariadb://localhost:3306/mydb";   // DB 접속 URL
	String uid = "myuser";   // DB 접속 계정 정보
	String upw = "1234";
%>

<%! //쿼리문 준비
	String sql_select = "SELECT * FROM TestMap ORDER BY uid";
%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9e74f5e39c3142a6c0f11bedb03510b"></script>
</head>

<body>
<div id="map" style="width:100%;height:350px;"></div>

<%
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, upw);
		
		// 트랜잭션 실행
		pstmt = conn.prepareStatement(sql_select);
		
		rs = pstmt.executeQuery();
%>

<%
		while(rs.next()){
			int uid = rs.getInt("uid");
			double xTest = rs.getDouble("xTest");
			double yTest = rs.getDouble("yTest");
			
			out.print(xTest);
			out.print(yTest);
		}
			
%>	
<%-- 변환 jsp 로 

<script>
var x = xTest;
var y = yTest;
var imageSrc2 = 'image/marker2.png', // 마커이미지의 주소입니다    
imageSize2 = new kakao.maps.Size(25, 25), // 마커이미지의 크기입니다
imageOption2 = {offset: new kakao.maps.Point(10, 10)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize2, imageOption2),
markerPosition2 = new kakao.maps.LatLng2(x, y); // 마커가 표시될 위치입니다

//마커를 생성합니다
var marker2 = new kakao.maps.Marker({
position: markerPosition2, 
image: markerImage2 // 마커이미지 설정 
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  

</script>

 --%>	

<%		
	} catch(Exception e){
		e.printStackTrace();
		//※ 예외처리를 하든지, 예외 페이지를 설정해주어야 한다.
	} finally {
		// DB 리소스 해제
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	} // end try
%>

</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="Mapjs01.js" type="text/javascript"></script>


</html>
