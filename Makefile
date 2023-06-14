IMG=gohelloapp

all: build run

build: Dockerfile
	docker build -t $(IMG) -f Dockerfile .

run: build
	docker run -it -p 8080:80 $(IMG) 

