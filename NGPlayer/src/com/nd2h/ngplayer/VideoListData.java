package com.nd2h.ngplayer;

public class VideoListData {

	private String videoName;
	private String videoPath;
	private String videoThumbnailPath;
	private String videoPlayTime;
	private long id;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getVideoName() {
		return videoName;
	}
	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}
	public String getVideoPath() {
		return videoPath;
	}
	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}
	public String getVideoThumbnailPath() {
		return videoThumbnailPath;
	}
	public void setVideoThumbnailPath(String videoThumbnailPath) {
		this.videoThumbnailPath = videoThumbnailPath;
	}
	public String getVideoPlayTime() {
		return videoPlayTime;
	}
	public void setVideoPlayTime(String videoPlayTime) {
		this.videoPlayTime = videoPlayTime;
	}
}
