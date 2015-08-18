# in-container package builder

include package/shared.mk

export TIMESTAMP         := $(shell date -u +"%Y%m%d_%H%M%S")
export NAMED_TARBALL_DIR  = $(TARBALLS_DIR)/$(TIMESTAMP)
export NAMED_ROOTFS       = $(APP_NAME)-$(APP_VER).tar.gz
export NAMED_TARBALL      = $(NAMED_TARBALL_DIR)/$(NAMED_ROOTFS)
export LINKED_TARBALL     = $(TARBALLS_DIR)/$(NAMED_ROOTFS)

all: artifact

artifact: tarball
	@echo Write artifact data for the image step
	$(MAKE) -f package/make-artifact.mk

tarball: $(NAMED_TARBALL)

$(NAMED_TARBALL): app-release
	$(MAKE) -f package/make-tarball.mk

app-release: prerequisites
	$(MAKE) -f package/make-app.mk

prerequisites: exrm

exrm:
	$(MAKE) -f package/check-exrm.mk

.PHONY: all app-release artifact exrm prerequisites tarball
