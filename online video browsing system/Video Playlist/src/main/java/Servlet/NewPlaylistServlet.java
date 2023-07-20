package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.PlaylistDao;
import Model.Playlist;

/**
 * Servlet implementation class NewPlaylistServlet
 */
@WebServlet("/NewPlaylistServlet")
public class NewPlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PlaylistDao playlistDao;

	public void init(){
		playlistDao = new PlaylistDao();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		//int userID = (int) request.getSession(false).getAttribute("userID");
		int userID = 1;


		Playlist playlist = new Playlist();
		playlist.setName(name);
		playlist.setUserID(userID);

		boolean istrue;

		try {
			istrue = playlistDao.newPlaylist(playlist);
			
			if(istrue == true){
				
				PrintWriter output = response.getWriter();  
				response.setContentType("text/html");  
				output.println("<script type=\"text/javascript\">"); 
				output.println("window.location.replace('Playlists.jsp');");
				output.println("</script>");
			}
			else{
				
				PrintWriter output = response.getWriter();  
				response.setContentType("text/html");  
				output.println("<script type=\"text/javascript\">"); 
				output.println("alert('Playlist creation failed');");  
				output.println("window.location.replace('Playlists.jsp');");
				output.println("</script>");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
	}

}
