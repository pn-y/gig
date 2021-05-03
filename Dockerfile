FROM ruby:2.6

RUN mkdir /app
WORKDIR /app
COPY Gemfile* ./
COPY gig.gemspec ./
RUN gem install bundler:2.2.1
RUN bundle config set no-cache 'true' && bundle install --jobs 4
ADD . /app
RUN gem build gig.gemspec && gem install --local gig-0.0.1.gem
CMD bash
