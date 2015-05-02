FROM nginx

MAINTAINER Martin Foot, martin@mfoot.com

# Package cleanup and preparation
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential

# Nginx configuration
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Rails configuration
RUN apt-get install -y ruby ruby-dev rubygems libxml2-dev zlib1g-dev libmysqlclient-dev

# Copy the gem files to another directory and bundle install. Prevents docker
# build re-running bundle install when files other than the Gemfiles change
RUN gem install bundler

COPY thanks_ants /thanks_ants
WORKDIR /thanks_ants
RUN bundle install --without development test
RUN bundle exec rake assets:precompile

# Service configuration
RUN apt-get install -y supervisor
COPY unicorn.conf /etc/supervisor/conf.d/
COPY nginx.conf /etc/supervisor/conf.d/

COPY nginx_default.conf /etc/nginx/conf.d/default.conf
#RUN rm -f /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD /usr/bin/supervisord -n
