SHELL:=/bin/bash
include .env

VERSION=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

.PHONY: all clean validate test diagram docs format release

all: test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init -upgrade && $(TERRAFORM) validate && \
		$(TERRAFORM) -chdir=modules/http-80-tcp init -upgrade && $(TERRAFORM) -chdir=modules/http-80-tcp validate && \
		$(TERRAFORM) -chdir=modules/http-443-tcp init -upgrade && $(TERRAFORM) -chdir=modules/http-443-tcp validate && \
		$(TERRAFORM) -chdir=modules/ssh-22-tcp init -upgrade && $(TERRAFORM) -chdir=modules/ssh-22-tcp validate

test: validate
	$(CHECKOV) -d /work
	$(TFSEC) /work

diagram:
	$(DIAGRAMS) diagram.py

docs: diagram
	$(TERRAFORM_DOCS) markdown ./ >./README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/http-80-tcp >./modules/http-80-tcp/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/http-443-tcp >./modules/http-443-tcp/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/ssh-22-tcp >./modules/ssh-22-tcp/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/http-80-tcp && \
		$(TERRAFORM) fmt -list=true ./modules/http-443-tcp && \
		$(TERRAFORM) fmt -list=true ./modules/ssh-22-tcp

release: test
	git tag $(VERSION) && git push --tags
