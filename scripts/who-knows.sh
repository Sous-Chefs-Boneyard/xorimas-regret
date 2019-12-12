#!/bin/sh
for D in ./*; do cd $D;
if git diff-index --quiet HEAD --; then
    echo "no change"
else
    echo "changes"
    git branch xor_build_updates; git checkout xor_build_updates; git add -A; git commit -m "Updates to Dangerfile"; git push -u origin xor_build_updates;
    hub pull-request -m "Updating build system"
fi
cd ..;
done
