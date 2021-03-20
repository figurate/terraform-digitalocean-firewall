SHELL:=/bin/bash

ifneq (, $(shell which docker))
TERRAFORM_VERSION=0.14.7
TERRAFORM=docker run --rm -v "${PWD}:/work" -v "${HOME}/.ssh:/root/.ssh" -v "${HOME}/.aws:/root/.aws" -v "${HOME}/.terraformrc:/root/.terraformrc" -e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) -e http_proxy=$(http_proxy) --net=host -w /work hashicorp/terraform:$(TERRAFORM_VERSION)
else
TERRAFORM=terraform
endif

TERRAFORM_DOCS=docker run --rm -v "${PWD}:/work" tmknom/terraform-docs

CHECKOV=docker run --rm -v "${PWD}:/work" bridgecrew/checkov

TFSEC=docker run --rm -v "${PWD}:/work" liamg/tfsec

DIAGRAMS=docker run -v "${PWD}:/work" figurate/diagrams python

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
