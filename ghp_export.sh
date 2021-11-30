#!/bin/bash
jekyll clean && jekyll build
rm -rf site.zip
zip -r site.zip _site
chmod 777 site.zip