SHELL:=/bin/bash
include .env

.PHONY: all clean test docs format

all: test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) -chdir=modules/http-80-tcp init && $(TERRAFORM) -chdir=modules/http-80-tcp validate && \
		$(TERRAFORM) -chdir=modules/http-443-tcp init && $(TERRAFORM) -chdir=modules/http-443-tcp validate && \
		$(TERRAFORM) -chdir=modules/ssh-22-tcp init && $(TERRAFORM) -chdir=modules/ssh-22-tcp validate

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
