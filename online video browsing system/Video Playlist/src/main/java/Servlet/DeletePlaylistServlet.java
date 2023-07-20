package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.PlaylistDao;

/**
 * Servlet implementation class DeleteReservationServlet
 */
@WebServlet("/DeletePlaylistServlet")
public class DeletePlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PlaylistDao playlistDao;

	public void init(){
		playlistDao = new PlaylistDao();  
	}
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int playlistID = Integer.parseInt(request.getParameter("playlistID"));

		boolean istrue;

		try {
			istrue = playlistDao.deletePlaylist(playlistID);
			
			if(istrue == true){
				
				PrintWriter output = response.getWriter();  
				response.setContentType("text/html");  
				output.println("<script type=\"text/javascript\">"); 
				output.println("alert('Deleted Successfully');");  
				output.println("window.location.replace('Playlists.jsp');");
				output.println("</script>");
			}
			else{
				//if deleting is unsuccessful display an alert
				PrintWriter output = response.getWriter();  
				response.setContentType("text/html");  
				output.println("<script type=\"text/javascript\">"); 
				output.println("alert('Deleting failed');");  
				output.println("window.location.replace('Playlists.jsp');");
				output.println("</script>");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
