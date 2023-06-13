all: build run

build: Dockerfile
	docker build -t gohelloapp -f Dockerfile .

run: build
	docker run -it -p 8080:80 gohelloapp 

# clean:
# 	rm -rf *.o hello