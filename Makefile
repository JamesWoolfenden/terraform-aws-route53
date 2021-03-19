#Makefile
ifdef OS
   RM   = $(powershell  -noprofile rm .\.terraform\modules\ -force -recurse)
   BLAT = powershell  -noprofile rm .\.terraform\ -force -recurse
else
   ifeq ($(shell uname), Linux)
      RM  = rm .terraform/modules/ -fr
      BLAT= rm .terraform/ -fr
   endif
endif

.PHONY: all

all: init plan build

init:
	$(RM)
	terraform init -reconfigure

plan:
	terraform plan -refresh=true

p:
	terraform plan -refresh=true

build:
	terraform apply -auto-approve

apply: build

check: init
	terraform plan -detailed-exitcode

destroy: init
	terraform destroy -force

docs:
	terraform-docs md . > README.md

valid:
	tflint
	terraform fmt -check=true -diff=true

target:
	@read -p "Enter Module to target:" MODULE;
	terraform apply -target $$MODULE
purge:
	$(BLAT)
