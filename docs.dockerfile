FROM ruby:2.6

RUN gem install jekyll bundler

WORKDIR /docs

RUN mkdir -p /src
RUN mkdir -p /docs
ADD src/Gemfile* /src/
ADD docs/Gemfile* /docs/

RUN bundle install
ADD src /src/
ADD docs /docs/
ENTRYPOINT bundle exec jekyll serve --config _config.yml,_config-dev.yml
