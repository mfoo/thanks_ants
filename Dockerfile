FROM ubuntu:22.04

MAINTAINER Martin Foot, martin@mfoot.com

# Package cleanup and preparation
RUN apt-get update
RUN apt-get -y upgrade

# Ruby and gem dependencies
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install \
	build-essential \
	default-libmysqlclient-dev \
	libxml2-dev \
	ruby \
	ruby-dev \
	rubygems \
	tzdata \
	zlib1g-dev
RUN gem install bundler

COPY thanks_ants /thanks_ants
WORKDIR /thanks_ants
RUN bundle install --without development test

EXPOSE 3000

CMD bundle exec rails s
