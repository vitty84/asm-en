#!/usr/bin/env bash
# Push HTML files to gh-pages automatically.

# Fill this out with the correct org/repo
ORG=icopy-site
REPO=asm-en
# This probably should match an email for one of your users.
EMAIL=chenjiajia1@gmail.com

set -e

git remote add gh-token "https://${GH_TOKEN}@github.com/$ORG/$REPO.git";
git fetch gh-token && git fetch gh-token gh-pages:gh-pages;

# Update git configuration so I can push.
if [ "$1" != "dry" ]; then
    # Update git config.
    git config user.name "Travis Builder"
    git config user.email "$EMAIL"
fi
cp search_index.py /home/travis/virtualenv/python3.6.3/lib/python3.6/site-packages/mkdocs/contrib/search/search_index.py
mkdocs gh-deploy -v --clean --force --remote-name gh-token;