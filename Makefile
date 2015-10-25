DOCKER = $(shell which docker)

# Format: <image name> + "_" + <version>
IMAGES = \
	base-alpine_3.2 \
	base-dev_0.1.1 \
	base-erlang_18.0 \
	elixir-dev_1.0.5 \
	elixir-phoenix-dev_0.1.0 \
	edip-tool_0.4.2

repo_name  = asaaki/$(subst _,:,$(1))
dockerfile = dockerfiles/$(subst _,/,$(1))

all: $(IMAGES)

$(IMAGES): %:
	@echo
	@echo Building $(call repo_name,$@) ...
	cd $(call dockerfile,$@) && \
		$(DOCKER) build --rm -t $(call repo_name,$@) .
	@echo

### Dev Helpers

remove: remove-containers remove-untagged-images

remove-containers:
	-docker rm `docker ps -a -q`

remove-untagged-images:
	-docker rmi `docker images -q -f dangling=true`

remove-images:
	-for image in $(IMAGES); do \
		docker rmi asaaki/$$(echo $$image | sed -e "s/_/:/g"); \
	done

.PHONY: all build remove remove-containers remove-untagged-images
