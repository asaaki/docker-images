# in-container package builder

include package/shared.mk

export TIMESTAMP         := $(shell date -u +"%Y%m%d_%H%M%S")
export NAMED_TARBALL_DIR  = $(TARBALLS_DIR)/$(TIMESTAMP)
export NAMED_ROOTFS       = $(APP_NAME)-$(APP_VER).tar.gz
export NAMED_TARBALL      = $(NAMED_TARBALL_DIR)/$(NAMED_ROOTFS)
export LINKED_TARBALL     = $(TARBALLS_DIR)/$(NAMED_ROOTFS)

export SSH_KEYS_SRC       = $(HOME)/ssh
export SSH_KEYS_DEST      = $(HOME)/.ssh

all: artifact

artifact: tarball
	@echo Write artifact data for the image step
	$(MAKE) -f package/make-artifact.mk

tarball: $(NAMED_TARBALL)

$(NAMED_TARBALL): app-release
	$(MAKE) -f package/make-tarball.mk

app-release: prerequisites
	$(MAKE) -f package/make-app.mk

prerequisites: move-app copy-keys exrm

exrm: move-app
	$(MAKE) -f package/check-exrm.mk

move-app:
	$(MAKE) -f package/move-app.mk

copy-keys: $(SSH_KEYS_DEST)

$(SSH_KEYS_DEST):
	if [ -d $(SSH_KEYS_SRC) ]; then \
		mkdir $(SSH_KEYS_DEST) && \
		cp $(SSH_KEYS_SRC)/* $(SSH_KEYS_DEST); \
	fi

.PHONY: all app-release exrm move-app prerequisites tarball
