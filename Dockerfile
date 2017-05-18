# === 1 ===
FROM phusion/passenger-ruby19:0.9.17
MAINTAINER Jon Gillies <supercoder@gmail.com>

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# === 2 ===
# Start Nginx / Passenger / Redis
RUN rm -f /etc/service/nginx/down
RUN rm -f /etc/service/redis/down

# === 3 ===
# install the latest bundler or you will get errors like "Your Ruby version is 1.9.3, but your Gemfile specified 2.2.0"
RUN gem install bundler

# === 4 ====
# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

# Add the nginx info
ADD files/nginx.conf /etc/nginx/sites-enabled/webapp.conf

# === 5 ===
# Prepare folders
RUN mkdir /home/app/webapp

# === 6 ===
# Run Bundle in a cache efficient way
WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install #--without development test

# === 7 ===
# Add the rails app
ADD . /home/app/webapp

ADD files/rc.local /etc/rc.local
RUN chmod +x /etc/rc.local

# === 8 ===
# Make sure files are owned by the app user
RUN chown -R app:app /home/app

# === 9 ===
# Put the logs directory in it's a volume
VOLUME /home/app/webapp/logs

# === 10 ===
# Add RAILS_ENV to /etc/environment
RUN echo 'RAILS_ENV=production' >> /etc/environment

# === 11 ===
# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
