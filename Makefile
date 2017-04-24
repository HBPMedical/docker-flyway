IMAGE := lren/flyway

build:
	sudo docker build -t $(IMAGE) .
