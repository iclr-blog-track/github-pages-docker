FROM jekyll/jekyll

RUN apk update && apk upgrade && apk add zip
RUN gem install jekyll-paginate-v2
RUN gem instal github-pages
COPY ghp_export.sh /bin/ghp_export
COPY ghp_serve.sh /bin/ghp_serve