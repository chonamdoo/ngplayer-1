package com.nd2h.ngplayer;


import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

public class FFmpegBasic extends Activity {
	private VideoSurfaceView mVideoSurfaceView;
	String url;
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        mVideoSurfaceView = (VideoSurfaceView) findViewById(R.id.surface_view);
        url = getIntent().getStringExtra("url");
        stopVideo();
        playVideo(url);
  
    }
    private void stopVideo() {
        mVideoSurfaceView.stopPlayback();
    }

    private void playVideo(String path) {
        mVideoSurfaceView.setVideoPath(path);
//        mVideoSurfaceView.setMediaController(new MediaController(this));
        mVideoSurfaceView.start();
    }
}

