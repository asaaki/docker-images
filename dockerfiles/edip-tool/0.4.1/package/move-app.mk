# app release builder

include package/shared.mk

IN_APP_DIR = cd $(APP_DIR) &&

all: move-app

# cp -av $(SOURCE_DIR) $(APP_DIR)
# cd $(APP_DIR) && rm -rf _build deps node_modules rel tarballs
move-app:
	rsync -av \
		--exclude=.git\
		--exclude=_build \
		--exclude=deps \
		--exclude=node_modules \
		--exclude=rel \
		--exclude=tarballs \
		$(SOURCE_DIR)/ $(APP_DIR)

.PHONY: all move-app
