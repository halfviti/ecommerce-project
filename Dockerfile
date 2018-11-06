FROM ruby:2.5
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /simple_store
WORKDIR /simple_store
COPY Gemfile /simple_store/Gemfile
COPY Gemfile.lock /simple_store/Gemfile.lock
RUN bundle install
COPY . /simple_store