# Build a Container running a Pseudo-Shell
# Requires the installation of as, ld and docker

MANDATORY = as ld docker
VERSION   = 2.0

default: build

check:
	$(if $(shell echo $(DOCKER_ID_USER)),, $(error "DOCKER_ID_USER is not set"))
	$(foreach exec, $(MANDATORY), $(if $(shell which $(exec)),, $(error "No $(exec) in $(PATH)")))

makedir:
	mkdir -p bin

compile:
	as -o sh.o sh.s
	ld -e main -s -o sh sh.o

move:
	mv -f sh bin/sh

compress:
	tar -cf - bin/ | xz -9e -c - > bin.tar.xz

clean:
	rm -f sh.o
	rm -Rf bin

containerize:
	docker build -t pseudo-shell:$(VERSION) .
	docker tag pseudo-shell:2.0 $(DOCKER_ID_USER)/pseudo-shell:$(VERSION)

build: check makedir compile move compress clean containerize