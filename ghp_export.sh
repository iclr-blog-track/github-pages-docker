#!/bin/bash

cp /srv/jekyll/_config.yml /srv/jekyll/_config.yml.bak
GHP_UUID="https://iclr.iro.umontreal.ca/$(uuidgen)_$(date +%s)" yq e -i '.url = strenv(GHP_UUID)' /srv/jekyll/_config.yml

jekyll clean
jekyll build
rm -rf site.zip
zip -r site.zip _site
chmod 777 site.zip

#rm /srv/jekyll/_config.yml
#mv /srv/jekyll/_config.yml.bak /srv/jekyll/_config.yml
chmod 777 _config.yml