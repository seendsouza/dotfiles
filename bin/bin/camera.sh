sudo xhost +local:root      # allow display something on your screen
sudo docker run -it \
    --env="DISPLAY" --env=DISPLAY:$DISPLAY \
    --device=/dev/video3:/dev/video0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -p 5000:5000 \
    danyu9394/linux_camera_tool:v047
