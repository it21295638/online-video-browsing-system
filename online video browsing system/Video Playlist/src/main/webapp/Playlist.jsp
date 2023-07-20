<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Playlist"%>
<%@page import="Dao.PlaylistDao"%>
<%@page import="Model.Video"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Video Player</title>
	<link rel="stylesheet" href="./styles/style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<title>Playlist</title>
</head>
<body>

	<%
        int playlistID = Integer.parseInt(request.getParameter("playlistID"));

		PlaylistDao playlistDao = new PlaylistDao();
        Playlist playlist = playlistDao.getPlaylistByID(playlistID);

		ArrayList<Video> videos = playlistDao.getPlaylistVideos(playlistID);
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
						<a href="./accounts.jsp" target="_blank" class="btn" style="background:var(--clr-1); color:var(--clr-5);">
							<i class="bi bi-person"></i>
							<span>Login</span>
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
    <div class="container-fluid">
        <a class="mt-3" href="Playlists.jsp">Back</a>
    </div>
    <div class="mt-5 container">
        <div class="row">
            <div class="col-xl-3">
                <img alt="playlist" src="img/playlist.png" />
            </div>
            <div class="col-xl-9 mt-5">
                <h3><%=playlist.getName()%></h3>
                <h6><%=playlist.getNVideos()%> video(s)</h6>

                <form method="post" action="UpdatePlaylistServlet">
                    <div class="row mt-3">
                        <div class="col-6">
                            <input type="hidden" name="playlistID" id="playlistID" value="<%=playlist.getPlaylistID()%>" />
                            <input type="text" name="name" id="name" class="form-control" />
                        </div>
                        <div class="col-3">
                            <input type="submit" class="btn btn-primary" value="rename">
                        </div>
                    </div>
                </form>
            </div>
        </div>

		<hr>

		<%for(Video video: videos){ %>
			<div class="row">
				<div class="col-sm-1">
					<h5 class="mt-4">video id:<%=video.getVideoID()%></h5>
				</div>
				<div class="col-xl-3">
					<img src="img/video.png" width="70" height="70" alt="video" />
				</div>
				<div class="col-xl-8">
					<h5 class="mt-4"><%=video.getVname()%></h5>
				</div>
			</div>
		<%}%>
    </div>


		
	<footer class="fixed-bottom footer" style="background:var(--clr-1);" class="text-center py-4">
		<a href="#" class="btn text-light">@watchita</a>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	
</body>
</html>