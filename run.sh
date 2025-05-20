docker build \
  --build-arg uid=$(id -u) \
  --build-arg username=${USER} \
  -t cpp-builder . \
    && \
    docker run --network=host --privileged -itu 0 --rm \
	   -u $(id -u):$(id -g) \
	   -v $HOME:$HOME \
	   -v /tmp/.X11-unix:/tmp/.X11-unix \
	   -e DISPLAY=$DISPLAY \
	   -h $HOSTNAME \
	   cpp-builder bash
