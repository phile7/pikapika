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
   String driver = "org.mariadb.jdbc.Driver";     // JDBC 드라이버 클래스
   String url = "jdbc:mariadb://localhost:3306/mydb";   // DB 접속 URL
   String uid = "myuser";   // DB 접속 계정 정보
   String upw = "1234";
%>

<%! //쿼리문 준비
   String sql_select = "SELECT * FROM toilet_info ORDER BY t_uid";
%>

<%
try{
      Class.forName(driver);
      conn = DriverManager.getConnection(url, uid, upw);
      
      // 트랜잭션 실행
      pstmt = conn.prepareStatement(sql_select);
      
      rs = pstmt.executeQuery();
      
      while(rs.next()){
      int tuid = rs.getInt("t_uid");
      double t_latitude = rs.getDouble("t_latitude");
      double t_longitude = rs.getDouble("t_longitude");
      }
 %>
 	
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

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<body>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9e74f5e39c3142a6c0f11bedb03510b"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
//마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '카카오', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        title: '생태연못', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        title: '텃밭', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        title: '근린공원',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>

</body>
</html>