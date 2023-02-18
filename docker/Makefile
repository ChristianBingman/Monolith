IMAGEDIR=./images
PLATFORMS=linux/amd64

manage-runner: $(IMAGEDIR)/manage-runner/Dockerfile
	DOCKER_BUILDKIT=1 docker buildx build -t christianbingman/manage-runner:latest --platform $(PLATFORMS) --push $(IMAGEDIR)/manage-runner/
