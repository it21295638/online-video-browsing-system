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
 * Servlet implementation class AddToPlaylistServlet
 */
@WebServlet("/AddToPlaylistServlet")
public class AddToPlaylistServlet extends HttpServlet {
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
		
		int playlistID = Integer.parseInt(request.getParameter("playlistID"));
        int videoId = Integer.parseInt(request.getParameter("videoID"));

		boolean istrue;

		try {
			istrue = playlistDao.addPlaylistVideo(playlistID,videoId);
			
			if(istrue == true){
				
				PrintWriter output = response.getWriter();  
				response.setContentType("text/html");  
				output.println("<script type=\"text/javascript\">"); 
				output.println("alert('Added to playlist');");  
				output.println("window.location.replace('Playlists.jsp');");
				output.println("</script>");
			}
			else{
				
				PrintWriter output = response.getWriter();  
				response.setContentType("text/html");  
				output.println("<script type=\"text/javascript\">"); 
				output.println("alert('Already in the playlist');");  
				output.println("window.location.replace('Playlists.jsp');");
				output.println("</script>");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
	}

}
