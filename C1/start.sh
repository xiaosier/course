#!/bin/sh
set -e

baseDir="$GHOST_SOURCE/content"
for dir in "$baseDir"/*/ "$baseDir"/themes/*/; do
	targetDir="$GHOST_CONTENT/${dir#$baseDir/}"
	mkdir -p "$targetDir"
	if [ -z "$(ls -A "$targetDir")" ]; then
		tar -c --one-file-system -C "$dir" . | tar xC "$targetDir"
	fi
done

cp "$GHOST_SOURCE"/config.js "$GHOST_CONTENT"/
cp "$GHOST_SOURCE"/content/themes/casper/default.hbs "$GHOST_CONTENT"/themes/casper/
cd "$GHOST_SOURCE" && npm start --production