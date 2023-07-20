<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Playlist"%>
<%@page import="Dao.PlaylistDao"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Video Player</title>
	<link rel="stylesheet" href="styles/Playlists.css">
	<link rel="stylesheet" href="./styles/style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	<title>Insert title here</title>
</head>
<body>

	<%
		int userID = 1;

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

	<div class="mx-3 my-5 w-100 pe-5 d-flex justify-content-end">
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
		Create new video playlist 
		</button> 
	</div>
        
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticBackdropLabel">Enter playlist name : </h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				
				<form action="NewPlaylistServlet" method="post">
					<div class="form-group mx-sm-3 mb-2">
						<input type="text" class="form-control" id="name" name="name" placeholder="Playlist Name">
					</div>
				
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<input class="btn btn-primary" type="submit" value="Create Playlist">
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="container">
		<h3 class="mb-5">My Playlists</h3>
	</div>

	<div class="productGrid">
		<%for(Playlist playlist: playlistList){ %>
		<div class="productCard" >
			<div class="imgBx">
				<img alt="product" src="img/playlist.png" class="itemProduct"/>
			</div>
			<div class="p-3">
				<h5><%=playlist.getName()%></h5>
				<div class="row">
					<div class="col-6"> 
						<a class="productBtn btn btn-primary" href="Playlist.jsp?playlistID=<%=playlist.getPlaylistID()%>">View</a>
					</div> 
					<div class="col-6" align="right">
						<form action="DeletePlaylistServlet" method="post">
							<input type="hidden" name="playlistID" id="playlistID" value="<%=playlist.getPlaylistID()%>" />
							<input type="submit" class= "productBtn btn btn-danger " value="Delete" />
						</form>
					</div>
				</div>
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