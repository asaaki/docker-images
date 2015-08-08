DOCKER = $(shell which docker)

# Format: <image name> + "_" + <version>
IMAGES = \
	base-alpine_3.2 \
	base-dev_0.1.0 \
	base-erlang_18.0 \
	elixir-dev_1.0.5 \
	elixir-phoenix-dev_0.1.0 \
	edip-tool_0.3.0

repo_name  = asaaki/$(subst _,:,$(1))
dockerfile = dockerfiles/$(subst _,/,$(1))

all: $(IMAGES)

$(IMAGES): %:
	@echo
	@echo Building $(call repo_name,$@) ...
	cd $(call dockerfile,$@) && \
		$(DOCKER) build --rm -t $(call repo_name,$@) .
	@echo

.PHONY: all build
