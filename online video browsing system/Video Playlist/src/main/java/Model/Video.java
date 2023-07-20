package Model;

public class Video {
	
	int videoID;
	String vname;
	String desc;
	String video;
	String user;
	String date;
	String category;

	public Video(){

	}

	public Video(int videoID, String vname, String desc, String video, String user, String date, String category) {
		this.videoID = videoID;
		this.vname = vname;
		this.desc = desc;
		this.video = video;
		this.user = user;
		this.date = date;
		this.category = category;
	}

	public int getVideoID() {
		return videoID;
	}

	public void setVideoID(int videoID) {
		this.videoID = videoID;
	}

	public String getVname() {
		return vname;
	}

	public void setVname(String vname) {
		this.vname = vname;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
}
