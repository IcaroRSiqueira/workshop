FROM ruby:2.6.5

RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get update && apt-get install -y nodejs 
RUN npm install -g yarn

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

WORKDIR /workshop

ADD . /workshop

RUN bundle install
