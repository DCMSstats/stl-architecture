start:
	docker pull structurizr/lite && docker run -it --rm -p 8080:8080 -v $(PWD):/usr/local/structurizr structurizr/lite
