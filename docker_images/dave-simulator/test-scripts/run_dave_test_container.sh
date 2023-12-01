 #!/bin/bash

docker container rm -f dave_test_container

docker run -i -d \
--name dave_test_container \
--rm \
--volume /tmp/.X11-unix:/tmp/.X11-unix. \
--env DISPLAY=host.docker.internal:0.0 \
--env HTTP_PROXY=http://$hostIP:$hostPort \
--env HTTPS_PROXY=https://$hostIP:$hostPort \
--env http_proxy=http://$hostIP:$hostPort \
--env https_proxy=https://$hostIP:$hostPort \
1227861021188/dave_simulator:latest

#docker cp /home/tao/underwater-slam-simulator/docker_images/dave-simulator/demo_description dave_test_container:/root/catkin_ws/src/

#docker exec dave_test_container bash -c "echo 'export GAZEBO_RESOURCE_PATH=/root/catkin_ws/src/demo_description/:\$GAZEBO_RESOURCE_PATH' >> /root/.bashrc"
#docker exec dave_test_container bash -c "cp /root/catkin_ws/src/demo_description/config/rexrov_sonar.xacro /root/catkin_ws/src/uuv_simulator/uuv_descriptions/robots/"
#docker exec dave_test_container bash -c "cp /root/catkin_ws/src/demo_description/config/sonar_snippets.xacro /root/catkin_ws/src/uuv_simulator/uuv_sensor_plugins/uuv_sensor_ros_plugins/urdf/"
#docker exec -i -t dave_test_container /bin/bash -i -c "roslaunch demo_description demo.launch;/bin/bash -i"
docker exec -i -t dave_test_container /bin/bash -i -c "roslaunch nps_uw_multibeam_sonar sonar_tank_blueview_p900_nps_multibeam.launch;/bin/bash -i"


