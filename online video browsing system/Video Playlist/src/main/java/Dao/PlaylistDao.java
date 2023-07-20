package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Model.Playlist;
import Model.Video;

public class PlaylistDao {

    public boolean newPlaylist(Playlist playlist) throws ClassNotFoundException{

        String newPlaylist_SQL = "INSERT INTO playlists" + " (userID, name) VALUES " + " (?,?); ";

        boolean Status = false; 

        try(
            Connection connection = DatabaseConnection.connectDB();

            PreparedStatement column = connection.prepareStatement(newPlaylist_SQL, Statement.RETURN_GENERATED_KEYS);){
            column.setInt(1, playlist.getUserID());
            column.setString(2, playlist.getName());

            int rows = column.executeUpdate(); 

            if (rows > 0){
                Status = true;

                ResultSet result = column.getGeneratedKeys();
                result.next();

                playlist.setPlaylistID(result.getInt(1));
            
            }
            connection.close();

        } catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        } 
        return Status;
    }

    public ArrayList<Playlist> getPlaylists(int userID) throws ClassNotFoundException{

        String getPlaylists_SQL = "SELECT * FROM Playlists WHERE userID = ?";

        ArrayList<Playlist> playlists = new ArrayList<Playlist>();

        try(
            Connection conn = DatabaseConnection.connectDB();

            PreparedStatement statement = conn.prepareStatement(getPlaylists_SQL);){

            statement.setInt(1, userID);
            
            ResultSet playlistDetails = statement.executeQuery();
            while(playlistDetails.next()){
                Playlist playlist = new Playlist();
                playlist.setPlaylistID(playlistDetails.getInt("playlistID"));
                playlist.setName(playlistDetails.getString("name"));
                playlist.setUserID(playlistDetails.getInt("userID"));
                
                playlists.add(playlist);
            }
            
            conn.close();

        } catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        } 
        return playlists;
    }

    public Playlist getPlaylistByID(int playlistID) throws ClassNotFoundException{

        String getPlaylist_SQL = "SELECT *, COUNT(v.playlistID) as countV FROM playlists p, playlist_videos v WHERE p.playlistID = v.playlistID AND p.playlistID = ?";

        Playlist playlist = new Playlist();

        try(
            Connection conn = DatabaseConnection.connectDB();
            PreparedStatement statement = conn.prepareStatement(getPlaylist_SQL);)
            {   
            statement.setInt(1, playlistID);

            ResultSet playlistDetails = statement.executeQuery(); 

            playlistDetails.next();
            playlist.setPlaylistID(playlistDetails.getInt("playlistID"));
            playlist.setName(playlistDetails.getString("name"));
            playlist.setNVideos(playlistDetails.getInt("countV"));
            playlist.setUserID(playlistDetails.getInt("userID"));

            conn.close();

        } catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        } 
    
        return playlist;
    }

    public boolean updatePlaylist(Playlist playlist) throws ClassNotFoundException{

        String UpdatePlaylist_SQL = "UPDATE playlists SET name = ? WHERE playlistID = ?";

        boolean Status = false; 

        try(
            
            Connection conn = DatabaseConnection.connectDB();
            PreparedStatement statement = conn.prepareStatement(UpdatePlaylist_SQL);){  

                statement.setInt(2, playlist.getPlaylistID()); 
                statement.setString(1, playlist.getName());

                int rows = statement.executeUpdate(); 
                
                if (rows > 0){
                    Status = true;
                }
                statement.close();

            conn.close();

        } catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        } 

        return Status;
    }

    public boolean deletePlaylist(int playlistID) throws ClassNotFoundException{

        String DeletePlaylist_SQL = "DELETE FROM playlists WHERE playlistID = ?";

        boolean Status = false; 

        try(
            Connection conn = DatabaseConnection.connectDB();

            PreparedStatement statement = conn.prepareStatement(DeletePlaylist_SQL);){

            statement.setInt(1, playlistID);

            int rows = statement.executeUpdate(); 

            if (rows > 0){
                Status = true;    
            }
            conn.close();

        } catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        } 

        return Status;
    }

    public boolean addPlaylistVideo(int playlistID, int videoID) throws ClassNotFoundException{

        String addPlaylistVideo_SQL = "INSERT INTO playlist_videos" + " (playlistID, videoID) VALUES " + " (?,?); ";

        boolean Status = false; 

        try(
            Connection connection = DatabaseConnection.connectDB();

            PreparedStatement column = connection.prepareStatement(addPlaylistVideo_SQL);){
            column.setInt(1, playlistID);
            column.setInt(2, videoID);

            int rows = column.executeUpdate(); 

            if (rows > 0){
                Status = true;
            }
            connection.close();

        } catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        } 
        return Status;
    }

    public ArrayList<Video> getPlaylistVideos(int playlistID) throws ClassNotFoundException{

        String getPlaylistVideos_SQL = "SELECT * FROM playlist_videos p, videos v WHERE p.videoID = v.idvideo AND p.playlistID = ?";

        ArrayList<Video> videos = new ArrayList<Video>();

        try(
            Connection conn = DatabaseConnection.connectDB();

            PreparedStatement statement = conn.prepareStatement(getPlaylistVideos_SQL);){

            statement.setInt(1, playlistID);

            ResultSet videoDetails = statement.executeQuery();
            while(videoDetails.next()){
                Video video = new Video();
                video.setVideoID(videoDetails.getInt("idvideo"));
                video.setVname(videoDetails.getString("vname"));
                
                videos.add(video);
            }
            
            conn.close();

        } catch (SQLException | ClassNotFoundException e){
            e.printStackTrace();
        } 
        return videos;
    }
}
