include package/shared.mk

SSH_KEYS_SRC  = $(HOME)/ssh
SSH_KEYS_DEST = $(HOME)/.ssh

all: move-app copy-ssh-keys

move-app: $(APP_DIR)

$(APP_DIR):
	rsync -av \
		--exclude=.git\
		--exclude=_build \
		--exclude=deps \
		--exclude=node_modules \
		--exclude=rel \
		--exclude=tarballs \
		$(SOURCE_DIR)/ $(APP_DIR)

copy-ssh-keys: $(SSH_KEYS_DEST)

$(SSH_KEYS_DEST):
	if [ -d $(SSH_KEYS_SRC) ]; then \
		mkdir $(SSH_KEYS_DEST) && \
		rsync -av $(SSH_KEYS_SRC)/ $(SSH_KEYS_DEST); \
	fi
