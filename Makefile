SHELL:=/bin/bash
TERRAFORM_VERSION=0.12.24
TERRAFORM=docker run --rm -v "${PWD}:/work" -e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) -e http_proxy=$(http_proxy) --net=host -w /work hashicorp/terraform:$(TERRAFORM_VERSION)

.PHONY: all clean test docs format

all: test docs format

clean:
	rm -rf .terraform/

test:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) init modules/http-80-tcp && $(TERRAFORM) validate modules/http-80-tcp && \
		$(TERRAFORM) init modules/http-443-tcp && $(TERRAFORM) validate modules/http-443-tcp && \
		$(TERRAFORM) init modules/ssh-22-tcp && $(TERRAFORM) validate modules/ssh-22-tcp

docs:
	docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./ >./README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/http-80-tcp >./modules/http-80-tcp/README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/http-443-tcp >./modules/http-443-tcp/README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/ssh-22-tcp >./modules/ssh-22-tcp/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/http-80-tcp && \
		$(TERRAFORM) fmt -list=true ./modules/http-443-tcp && \
		$(TERRAFORM) fmt -list=true ./modules/ssh-22-tcp
