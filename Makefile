IMAGE := hbpmip/flyway

build:
	sudo docker build -t $(IMAGE) .
