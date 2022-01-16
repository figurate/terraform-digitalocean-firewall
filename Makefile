SHELL:=/bin/bash
include .env

.PHONY: all clean test docs format

all: test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) init modules/http-80-tcp && $(TERRAFORM) validate modules/http-80-tcp && \
		$(TERRAFORM) init modules/http-443-tcp && $(TERRAFORM) validate modules/http-443-tcp && \
		$(TERRAFORM) init modules/ssh-22-tcp && $(TERRAFORM) validate modules/ssh-22-tcp

test: validate
	$(CHECKOV) -d /work
	$(TFSEC) /work

docs:
	$(TERRAFORM_DOCS) markdown ./ >./README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/http-80-tcp >./modules/http-80-tcp/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/http-443-tcp >./modules/http-443-tcp/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/ssh-22-tcp >./modules/ssh-22-tcp/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/http-80-tcp && \
		$(TERRAFORM) fmt -list=true ./modules/http-443-tcp && \
		$(TERRAFORM) fmt -list=true ./modules/ssh-22-tcp
