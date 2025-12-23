header = "  \e[1;34m%-30s\e[m \n"
format = "\e[1mmake %-32s\e[m %-50s \n"

all:
	@printf $(header) "Build"
	@printf $(format) "build" "Production build."
	@printf $(format) "draft" "Build drafts."
	@printf $(format) "watch" "Watch filesystem for changes."
	@printf $(header) "Server"
	@printf $(format) "run" "Run hugo dev server."

build:
	hugo

docker:
	docker build --platform="linux/amd64" . -t lunemec/nemec.lu:latest

draft:
	hugo -D

watch:
	hugo -D -w

run:
	hugo server -D

run_docker: docker
	docker run -it --rm=true -p 8080:80 lunemec/nemec.lu:latest
