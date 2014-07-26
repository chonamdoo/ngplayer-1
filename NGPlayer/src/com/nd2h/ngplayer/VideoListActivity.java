package com.nd2h.ngplayer;

import java.util.ArrayList;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.media.ThumbnailUtils;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.provider.MediaStore;
import android.provider.MediaStore.Video.Thumbnails;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

public class VideoListActivity extends Activity implements OnItemClickListener{
	public static Bitmap bitmap;
	private View mContentView = null;
	private ListView videoListView = null;
	private OrderAdapter videoListAdapter;

	private Cursor videoCursor = null;
	private String[] proj = { MediaStore.Video.Media._ID, MediaStore.Video.Media.DATA, MediaStore.Video.Media.DISPLAY_NAME, MediaStore.Video.Media.DURATION };
	private ArrayList<VideoListData> videoListData;

	public VideoListActivity() {
	}
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.medialist);
		sendBroadcast(new Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE, Uri.parse("file://"+ Environment.getExternalStorageDirectory())));
		videoCursor = managedQuery(MediaStore.Video.Media.EXTERNAL_CONTENT_URI,proj, null, null, null);

		videoListData = new ArrayList<VideoListData>();
		initLocalList(videoCursor);
		videoListView = (ListView)findViewById(R.id.local_list);
		videoListAdapter = new OrderAdapter(this, R.layout.row, videoListData);
		videoListView.setAdapter(videoListAdapter);
		videoListView.setOnItemClickListener(this);
	}
	public void onItemClick(AdapterView<?> listView, View view, int position, long id) { ///나중에 해결하기... 디스플레이 네임.. ㅎ
		
		String url = videoListData.get(position).getVideoName();	
		Intent intent = new Intent(this,FFmpegBasic.class);
		intent.putExtra("url",url);
	     Log.v("DEBUG32","url : " + url);
		startActivity(intent);
	}
	private void initLocalList(Cursor videocursor) {

		while (videocursor.moveToNext()) {
			VideoListData m = new VideoListData();
			m.setId(videocursor.getLong(0));
			m.setVideoName(videocursor.getString(1)+"");
			m.setVideoPath(videocursor.getString(2));
			m.setVideoPlayTime(videocursor.getString(3)+"");
			videoListData.add(m);
		}
	}
	private class OrderAdapter extends ArrayAdapter<VideoListData> {

		private ArrayList<VideoListData> items;
		private Context mContext;
		private int mResource;
		public OrderAdapter(Context context, int textViewResourceId, ArrayList<VideoListData> items) {
			super(context, textViewResourceId, items);
			this.items = items;
			this.mContext = context;
			this.mResource = textViewResourceId;
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			View v = convertView;
			if (v == null) {
				v = (View) View.inflate(mContext, mResource, null);
			}
			final ImageView img = (ImageView) v.findViewById(R.id.icon);
			final VideoListData item = items.get(position);
			final Handler a = new Handler() {
				public void handleMessage(Message msg) {
					switch (msg.what) {
					case 1:
						if (msg.obj != null) {
							img.setImageBitmap((Bitmap) msg.obj);
						} else {
							img.setImageResource(R.drawable.ic_launcher);
						}
						break;
					}
				}
			};

			new Thread(new Runnable() {
				public void run() {
					// a.sendEmptyMessage(1);
					bitmap = ThumbnailUtils.createVideoThumbnail(item.getVideoName(), Thumbnails.MICRO_KIND);
					// ByteArrayOutputStream stream = new
					// ByteArrayOutputStream() ;
					// bitmap.compress( CompressFormat.JPEG, 50, stream) ;
					// byte[] byteArray = stream.toByteArray() ;
					// BitmapFactory.Options options = new
					// BitmapFactory.Options();
					// options.inSampleSize = 4;
					// Bitmap temp = BitmapFactory.decodeByteArray( byteArray,
					// 0, byteArray.length , options);
					// a.sendMessage(a.obtainMessage(1, temp));
					a.sendMessage(a.obtainMessage(1, bitmap));
				}
			}).start();
			// img.setImageResource(R.drawable.ic_launcher);
			TextView tt = (TextView) v.findViewById(R.id.toptext);
			TextView bt = (TextView) v.findViewById(R.id.bottomtext);

			/* TextView wt = (TextView) v.findViewById(R.id.weblocal); */
			// String arr[] = item.getVideoName().split("/");

			// 시간계산
			int total = 0;
			try {
				total = Integer.parseInt(item.getVideoPlayTime());
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			// Log.e("재생 시간", "재생 시간" + item.getVideoPlayTime());
			int hour = total / (1000 * 60 * 60);
			int spare = total % (1000 * 60 * 60);
			int min = spare / (1000 * 600);
			spare = spare % (1000 * 60);
			int sec = spare / (1000);
			// 시간 계산
			tt.setText(item.getVideoPath());
			if (hour == 0 && min == 0 && sec == 0)
				bt.setText("알수 없음");
			else
				bt.setText(hour + ":" + min + ":" + sec);

			return v;
		}
	}
}
