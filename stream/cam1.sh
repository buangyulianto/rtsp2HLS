#nice --10 ffmpeg -protocol_whitelist "file,rtp,udp,tcp,rtsp" -rtsp_transport tcp -i rtsp://10.21.0.19:8554/cam1 -c:v libx264 -preset ultrafast -b:v 200k -max_muxing_queue_size 1024 -f hls -hls_time 1 -segment_time 5 -hls_list_size 3 -hls_flags delete_segments -hls_allow_cache 0 /opt/cam1.m3u8
ffmpeg -rtsp_transport tcp -i rtsp://10.21.0.19:8554/cam1 -c:v libx264 -preset ultrafast -tune zerolatency -b:v 900k -max_muxing_queue_size 1024 -maxrate 750k -bufsize 3000k -f hls -hls_time 1 -segment_time 5 -hls_ls_list_size 3 -hls_flags delete_segments -hls_allow_cache 0 /opt/cam1.m3u8

