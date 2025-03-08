# Ensure that every command in this Makefile
# will run with bash instead of the default sh
SHELL := /usr/bin/env bash

#############
# Constants #
#############

PREFIX      ?= /usr/local
INSTALL_DIR  = $(PREFIX)/bin

APP_NAME    = netbox-extractor
SOURCE_FILE = src/$(APP_NAME).cr
OUTPUT_DIR  = bin
OUTPUT_FILE = $(APP_NAME)

SPEC_OPTS            =
COMPILE_OPTS_DEV     = --threads 4
COMPILE_OPTS_RELEASE = --threads 4 --release --error-trace

# Use sudo to install/uninstall built binary if current user is not root
ifneq ($(UID), 0)
	sudo = sudo
else
	sudo =
endif

ifeq ($(shell tty -s && echo true),true)
  SPEC_OPTS += --verbose
  COMPILE_OPTS_DEV += --progress
  COMPILE_OPTS_RELEASE += --progress
endif

OPENAPI_VERSION := 7.17.0
OPENAPI_CLI_URL := https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/$(OPENAPI_VERSION)/openapi-generator-cli-$(OPENAPI_VERSION).jar

NETBOX_VERSION  := 4.4.9
NETBOX_LIB_DIR  := vendor/netbox-client
NETBOX_PATCHES  := vendor/netbox-client-patches
NETBOX_API_FILE := vendor/netbox-rest.$(NETBOX_VERSION).yml

################
# Public tasks #
################

# This is the default task
all: help

.PHONY: all

#####################
# Development tasks #
#####################

setup: ## Setup local environment
	brew bundle install
	asdf plugin add crystal || true
	asdf plugin add java || true
	asdf install
	asdf current

build: ## Compile to development binary
	crystal build $(COMPILE_OPTS_DEV) -o $(OUTPUT_DIR)/$(OUTPUT_FILE) $(SOURCE_FILE)

deps: ## Install development dependencies
	shards install

clean: ## Cleanup environment
	rm -rf bin/*
	rm -rf lib/

spec: ## Run Crystal spec
	crystal spec $(SPEC_OPTS)

doc: ## Generate project documentation
	rm -rf docs
	crystal doc

format: ## Format code
	crystal tool format

ameba: ## Run static code analysis
	bin/ameba

.PHONY: setup build deps clean spec doc ameba


################################
# Netbox API Development tasks #
################################

netbox-api-build: netbox-api-generate netbox-api-patch netbox-api-format ## Download, generate, patch, format

netbox-api-download-openapi-cli: ## Download OpenAPI jar
	curl $(OPENAPI_CLI_URL) --output openapi-generator-cli.jar

netbox-api-generate: ## Generate NetboxClient lib
	rm -rf $(NETBOX_LIB_DIR)
	export _JAVA_OPTIONS=-DmaxYamlCodePoints=99999999 && \
		java -jar openapi-generator-cli.jar generate \
		-i $(NETBOX_API_FILE) \
		-g crystal \
		-o $(NETBOX_LIB_DIR) \
		--additional-properties moduleName=NetboxClient \
		--additional-properties shardName=netbox-client

netbox-api-patch: ## Patch NetboxClient code
	git apply $(NETBOX_PATCHES)/*.diff
	echo "ok"

netbox-api-create-patch: ## Create patch for NetboxClient code
	git diff vendor/ > $(NETBOX_PATCHES)/patch.diff

netbox-api-format: ## Format NetboxClient code
	crystal tool format $(NETBOX_LIB_DIR)/spec
	crystal tool format $(NETBOX_LIB_DIR)/src
	crystal tool format $(NETBOX_LIB_DIR)/spec
	crystal tool format $(NETBOX_LIB_DIR)/src

.PHONY: netbox-api-build netbox-api-download-openapi-cli netbox-api-generate netbox-api-patch netbox-api-format


############################
# Docker Development tasks #
############################

docker-image: ## Build local multiplatforms Docker image for local development
	docker buildx bake docker-image

.PHONY: docker-image


#################
# Release tasks #
#################

release: ## Compile to production binary
	crystal build $(COMPILE_OPTS_RELEASE) -o $(OUTPUT_DIR)/$(OUTPUT_FILE) $(SOURCE_FILE)
	cd bin; for f in *; do shasum --algorithm 256 $$f > $$f.sha256; done

deps-release: ## Install production dependencies
	shards install --production

install: ## Install binary in $(INSTALL_DIR)
	$(sudo) cp --verbose $(OUTPUT_DIR)/$(OUTPUT_FILE) $(INSTALL_DIR)/$(OUTPUT_FILE)

uninstall: ## Uninstall binary from $(INSTALL_DIR)
	$(sudo) rm --verbose --force $(INSTALL_DIR)/$(OUTPUT_FILE)

release-static: ## Build static binary with Docker
	docker buildx bake binary
	mv packages/linux_arm64/$(OUTPUT_FILE)-linux-arm64 packages/
	mv packages/linux_amd64/$(OUTPUT_FILE)-linux-amd64 packages/
	rmdir packages/linux_arm64/ packages/linux_amd64/
	rm -f packages/*.sha256
	cd packages; for f in *; do shasum --algorithm 256 $$f > $$f.sha256; done

.PHONY: release deps-release install uninstall release-static


#################
# Private tasks #
#################

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: help
