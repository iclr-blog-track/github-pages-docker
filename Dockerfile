FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN apt-get update && apt-get upgrade && apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata

# Initial list of packages taken from https://github.com/wechris/docker-jekyll-github-pages/blob/master/Dockerfile
RUN apt-get update && apt-get upgrade && apt-get install curl wget bash cmake ruby ruby-bundler ruby-dev ruby-irb \
     ruby-rdoc git nodejs build-essential ruby-full -y
RUN gem install bundler
RUN gem install jekyll
RUN gem install github-pages
RUN gem install jekyll-paginate-v2
RUN mkdir /home/blog
