package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import Model.Video;

public class VideoDao {
	
	public static Video getVideo(int videoID) throws ClassNotFoundException{

		Video videoObject = new Video();
		
		try {
			Connection con = DatabaseConnection.connectDB();
			Statement ste = con.createStatement();
			String ql = "select * from videos where idvideo='"+videoID+"'";
			ResultSet rs = ste.executeQuery(ql);
			
			if(rs.next()) {
				int vid = rs.getInt("idvideo");
				String vname = rs.getString("vname");
				String desc = rs.getString("description");
				String video = rs.getString("video");
				String user = rs.getString("UserName");
				String date = rs.getString("uplodedate");
				String category = rs.getString("category");
				
				videoObject = new Video(vid,vname, desc, video, user, date, category);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return videoObject;
	}
	
}
