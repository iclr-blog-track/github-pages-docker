#!/bin/bash

cp /srv/jekyll/_config.yml /srv/jekyll/_config.yml.bak
GHP_UUID="https://iclr.iro.umontreal.ca/$(uuidgen)_$(date +%s)" yq e -i '.url = strenv(GHP_UUID)' /srv/jekyll/_config.yml
GHP_UUID_URL="$(yq e '.url' /srv/jekyll/_config.yml)"
GHP_UUID="$(echo ${GHP_UUID_URL##*/})"

echo "SUBMISSION URL":
echo $GHP_UUID_URL

echo "SUBMISSION UUID:"
echo $GHP_UUID

jekyll clean
jekyll build

printf "%s\n" "url: $GHP_UUID_URL" "uuid: $GHP_UUID" > vars.yml
chmod 777 vars.yml

rm -rf site.zip
cp -r _site $GHP_UUID
chmod 777 $GHP_UUID
zip -r site.zip $GHP_UUID
chmod 777 site.zip

rm /srv/jekyll/_config.yml
mv /srv/jekyll/_config.yml.bak /srv/jekyll/_config.yml
chmod 777 _config.yml