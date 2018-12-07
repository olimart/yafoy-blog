# Yafoy blog

## Get started

$ jekyll serve

## How to publish

[From Stackoverflow](https://stackoverflow.com/questions/17835937/how-do-i-push-jekyll-site-directory-to-gh-pages-branch-and-leave-the-source-in)
Checkout your branch, where your build-source is located (master)

Remove all content of the _site directory:
$ rm -r _site/*

Clone your repo's gh-pages branch into the _site directory:
$ git clone -b gh-pages `git config remote.origin.url` _site

Final steps: Just let jekyll build, do commit & push:

$ JEKYLL_ENV=production bundle exec jekyll build
$ cd into _site:
$ cd _site

target all files for commit:
$ git add -A

commit them:
git commit -am 'Yeah. Built from subdir'

and push your site to GitHub-Pages:
git push
