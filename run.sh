#! /bin/bash

start() {
    nvidia-docker start tensorflow
}

stop() {
    nvidia-docker stop tensorflow
}

run() {
	nvidia-docker run -d \
	-p 10888:8888 \
	-p 6006:6006 \
	-v \
	/home/webapps/deep-learning/workspace:/notebooks/workspace \
	--name tensorflow \
	gcr.io/tensorflow/tensorflow:latest-gpu-py3
}

init() {
	nvidia-docker run -it \
	-v \
	/home/webapps/deep-learning/workspace:/notebooks/workspace \
	--name tensorflow \
	gcr.io/tensorflow/tensorflow:latest-gpu-py3 \
	/bin/bash -c "sh /notebooks/workspace/init.sh"
}

case "$1" in
        run|start|stop)
		  COMMAND=$1
		  shift
		  $COMMAND $@
		  ;;
		*)
		  echo $"Usage:$0 {run|start|stop}"
	      exit 2
esac
