FROM ruby:2.5
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs imagemagick
RUN mkdir /web
WORKDIR /web
COPY Gemfile /web/Gemfile
COPY Gemfile.lock /web/Gemfile.lock
RUN bundle install
COPY . /web