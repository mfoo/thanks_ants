FROM debian:jessie

MAINTAINER Martin Foot, martin@mfoot.com

# Package cleanup and preparation
RUN apt-get update
RUN apt-get -y upgrade

# Ruby and gem dependencies
RUN apt-get -y install build-essential ruby ruby-dev rubygems
RUN apt-get -y install libxml2-dev zlib1g-dev libmysqlclient-dev
RUN gem install bundler

COPY thanks_ants /thanks_ants
WORKDIR /thanks_ants
RUN bundle install --without development test
RUN bundle exec rake assets:precompile

EXPOSE 8080

CMD bundle exec unicorn -E production -c config/unicorn.rb
