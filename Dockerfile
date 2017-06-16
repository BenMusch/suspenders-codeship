FROM ruby:2.4.0-alpine

RUN apk update && apk add nodejs build-base libxml2-dev libxslt-dev postgresql \
  postgresql-dev qt5-qtwebkit-dev
RUN QMAKE=/usr/lib/qt5/bin/qmake gem install capybara-webkit

RUN mkdir /app
WORKDIR /app
ENV RAILS_ENV test

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

COPY . .
RUN bundle install
