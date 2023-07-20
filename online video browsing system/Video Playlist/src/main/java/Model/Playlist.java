package Model;

public class Playlist {
    private int playlistID;
    private String name;
    private int userID;
    private int nVideos;
    
    public Playlist() {
    }

    public Playlist(int playlistID, String name, int userID, int nVideos) {
        this.playlistID = playlistID;
        this.name = name;
        this.userID = userID;
        this.nVideos = nVideos;
    }

    public int getPlaylistID() {
        return playlistID;
    }

    public void setPlaylistID(int playlistID) {
        this.playlistID = playlistID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getNVideos() {
        return nVideos;
    }

    public void setNVideos(int nVideos) {
        this.nVideos = nVideos;
    }
}
