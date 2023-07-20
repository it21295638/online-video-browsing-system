<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.script.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Video"%>
<%@page import="Model.Playlist"%>
<%@page import="Dao.VideoDao"%>
<%@page import="Dao.PlaylistDao"%>
<%@ page import="java.sql.*" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Video Player</title>
    <link rel="stylesheet" href="./styles/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
  </head>
  <body>

	<%
        //String userID = request.getSession(false).getAttribute("userID");
		int userID = 1;
		int videoID = Integer.parseInt(request.getParameter("videoID"));
		Video videoObject = VideoDao.getVideo(videoID);
		PlaylistDao playlistDao = new PlaylistDao();
		ArrayList<Playlist> playlistList = playlistDao.getPlaylists(userID);
	%>
  	
  	<div class="container-fluid text-center bg-light top-header g-0">
	  <div class="main-header row align-items-center d-flex flex-wrap">
	    <div class="col-12 col-lg-2 justify-content-center order-1">
	      <a href="./index.jsp" class="navbar-brand">
	      	<img src="./img/logo.jpg" class="img-fluid" style="width:70px;" alt="...">
	      </a>
	    </div>
	    <div class="col-12 col-lg-7 order-lg-2 order-3 my-3">
	      <form class="d-flex" role="search">
	        <input class="form-control me-2 py-1" type="search" placeholder="Search" aria-label="Search">
	        <button class="btn text-light" style="background:#394339;" type="submit">Search</button>
	      </form>
	    </div>
	    <div class="col-12 col-lg-3 order-lg-3 order-2 d-none d-lg-block">
	    	<div class="row">
		    <div class="col">
		      <a href="./library.jsp" target="_blank" class="btn" style="background:var(--clr-1); color:var(--clr-5);">
		      	<i class="bi bi-collection"></i>
		      	<span>Library</span>
		      </a>
		    </div>
		    <div class="col">
		      <a href="./accounts.jsp" target="_blank" class="btn" style="background:var(--clr-1); color:var(--clr-5);">
		      	<i class="bi bi-person-plus"></i>
		      	<span>Sign up</span>
		      </a>
		    </div>
		  </div>
	    </div>
	  </div>
	  
	</div>
	
	<div class="container-fluid w-100">
		
	  	<div class="videoPlayer">
			<video width="100%" height="500px" controls autoplay id="myVideo">
				<source src="<%=videoObject.getVideo()%>" type="video/mp4">
			</video>				
		</div>
		<div class="row px-3">
		    <div class="col-12 col-md-8">
		      <h4 id="vidtitle"><%=videoObject.getVname() %></h4>
		      <h5 class="fs-6">
		      	<span>123 views.</span>
		      	<span><%=videoObject.getDate()%></span>
		      </h5>
		    </div>
		    <div class="col-12 col-md-4 d-flex">
		      <div class="d-flex align-items-center">
		      	<form action="getLike" method="post">
		      	<button type="button" class="btn fs-3 likeBtn">
		      		<i class="bi bi-hand-thumbs-up" id="likeBtn"></i>
		      	</button>
		      	<span class="fs-5" id="likeCount">12</span>
		      	</form>
		      </div>
		      <div class="d-flex align-items-center">
		      	<button type="button" class="btn fs-3 dislikeBtn">
		      		<i class="bi bi-hand-thumbs-down"></i>
		      	</button>
		      	<span class="fs-5" id="dislikeCount">5</span>
		      </div>
		      <div class="d-flex align-items-center">
		      	<a href="" class="btn" id="downBtn">
		      		<i class="bi bi-arrow-down-circle-fill"></i>
		      		<span class="fs-5">Download</span>
		      	</a>
		      </div>
		      <div class="d-flex align-items-center">
		      	<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
		      		<i class="bi bi-plus-circle-fill"></i>
		      		<span class="fs-5">Add To Playlist</span>
		      	</button>
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="staticBackdropLabel">Select playlist </h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							
							<form action="AddToPlaylistServlet" method="post">
								<div class="form-group mx-sm-3 mb-2">
									<input type="hidden" name="videoID" id="videoID" value="<%=videoObject.getVideoID()%>" />
									<select name="playlistID" id="playlistID" class="form-select" required>
										<%for(Playlist playlist: playlistList){%>                        
										<option value=<%=playlist.getPlaylistID()%>><%=playlist.getName()%></option>
										<%} %>
									</select>
								</div>
							
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									<input class="btn btn-primary" type="submit" value="Add to playlist">
								</div>
							</form>
						</div>
					</div>
				</div>
		      </div>
		    </div>
		</div>
		
		<div class="w-100 my-3" style="background:var(--clr-1); height:2px;"></div>
		
		<a href="./profile.jsp" class="btn fs-5 d-flex align-items-center px-3" onload="call()">
			<i class="bi bi-person-circle fs-2"></i>
			
			<%
				try{			
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/video_db","root", "1234");
  				Statement statement=connection.createStatement();
  				String name = videoObject.getUser();%><%
  				
  	 				
  				
  				String sql = "select * from profile where UserName='"+name+"'";
  				ResultSet resultSet = statement.executeQuery(sql);
	  			while(resultSet.next()){
	  			%>
	  			
	  				<span class="ps-2" ><%=resultSet.getString(2)%> <%=resultSet.getString("lName")%></span>
	  			<%
	  			}	
				}catch(Exception e){
					e.printStackTrace();
				}
	  		%>
			
			
		</a>

		<p class="p-3" id="desc"><%=videoObject.getDesc()%></p>
		
		
		<div class="w-100 my-3" style="background:var(--clr-1); height:2px;"></div>
		
		<div class="d-block px-3">
			<h4 id="ccount"></h4>
			
			
			<form class="mb-3" action="insert" method="post">
				<div class="mb-3">
			   		<input type="text" name="comment" class="form-control border-top-0 border-start-0 border-end-0 border-bottom-1 cin" placeholder="Add a comment">
			  		<input type="text" name="vidID" id="vidID" style="display:none;" class="form-control border-top-0 border-start-0 border-end-0 border-bottom-1 cin" placeholder="Add a comment" value="hidden">
			  	</div>
			  	<input type="submit" class="btn" style="background:var(--clr-1); color:var(--clr-5);" onclick="addc()" value="Comment">
			</form>
			
			<ul id="cList" class="list-group border-0 my-3">			
			<%
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/video_db","root", "1234");
					int vsid = videoObject.getVideoID();%><%
					String query = "select * from comment where videoID='"+vsid+"'";
					PreparedStatement ps = con.prepareStatement(query);
					ResultSet rs = ps.executeQuery(query);
					
					
					while(rs.next()){
					%>
					<li class="list-group-item border-0 pb-3" onclick="editBtn()">
						<i class="bi bi-person-circle fs-4"></i>
						<span class="ps-3"><%= rs.getString("comment")%></span>
					</li>
					<% }
				}catch(Exception e){
					
				}
			%>
			</ul>
		</div>
	</div>
	
	<footer style="background:var(--clr-1);" class="text-center py-4">
		<a href="#" class="btn text-light">@watchita</a>
	</footer>
	
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  	<script src="../JS/script.js"></script>
  	<script src="../JS/reactionCtrl.js"></script>
  	<script>
  	
  		
  		//contorl video
 
  		
  		
  		

  		
  		
  		
  		//control reactions  		
  		let likeBtn = document.querySelector(".likeBtn");
  		let likeIcon = likeBtn.querySelector(".bi-hand-thumbs-up");
  		let dislikeBtn = document.querySelector(".dislikeBtn");
  		let dislikeIcon = dislikeBtn.querySelector(".bi-hand-thumbs-down");
  		let likeCount = document.getElementById("likeCount");
  		let dislikeCount = document.getElementById("dislikeCount");
  		
  		likeBtn.onclick = function(){
  			if(likeIcon.classList.contains("bi-hand-thumbs-up")){
  				likeIcon.classList.replace("bi-hand-thumbs-up", "bi-hand-thumbs-up-fill");
  				likeCount.textContent = Number(likeCount.innerHTML) + 1;
  				
  				if(dislikeIcon.classList.contains("bi-hand-thumbs-down-fill")){
  					dislikeIcon.classList.replace("bi-hand-thumbs-down-fill", "bi-hand-thumbs-down");
  					dislikeCount.textContent = Number(dislikeCount.innerHTML) - 1;
  				}
  			}
  			else{
  				likeIcon.classList.replace("bi-hand-thumbs-up-fill", "bi-hand-thumbs-up");
  				likeCount.textContent = Number(likeCount.innerHTML) - 1 ;
  			}
  		}
  		
  		dislikeBtn.onclick = function(){
  			if(dislikeIcon.classList.contains("bi-hand-thumbs-down")){
  				dislikeIcon.classList.replace("bi-hand-thumbs-down", "bi-hand-thumbs-down-fill");
  				dislikeCount.textContent = Number(dislikeCount.innerHTML) + 1;
  				
  				if(likeIcon.classList.contains("bi-hand-thumbs-up-fill")){
  					likeIcon.classList.replace("bi-hand-thumbs-up-fill", "bi-hand-thumbs-up");
  					likeCount.textContent = Number(likeCount.innerHTML) - 1 ;
  				}
  			}
  			else{
  				dislikeIcon.classList.replace("bi-hand-thumbs-down-fill", "bi-hand-thumbs-down");
  				dislikeCount.textContent = Number(dislikeCount.innerHTML) - 1;
  			}
  		}
  		
  		
  		
  		
  		
  	</script>
  	
  </body>
</html>