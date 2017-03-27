FROM ruby:2.3.1-alpine

# Add command line argument used to cusomise the image at build-time
ARG PARLIAMENT_BASE_URL
ARG GTM_KEY
ARG ASSET_LOCATION_URL
ARG SECRET_KEY_BASE

# Add Gemfiles
ADD Gemfile /app/
ADD Gemfile.lock /app/

# Set the working DIR
WORKDIR /app

# Bundle install (cached)
RUN apk --update add --virtual build-dependencies build-base ruby-dev && \
    gem install bundler --no-ri --no-rdoc && \
    cd /app; bundle install --without development test --path vendor/bundle && \
    apk del  build-dependencies

# Copy the application over
ADD . /app

# Make sure our user owns the application
RUN chown -R nobody:nogroup /app

# Set up our user and environment
USER nobody

ENV PARLIAMENT_BASE_URL $PARLIAMENT_BASE_URL
ENV DATA_URI_PREFIX http://id.ukpds.org
ENV GTM_KEY $GTM_KEY
ENV ASSET_LOCATION_URL $ASSET_LOCATION_URL
ENV SECRET_KEY_BASE $SECRET_KEY_BASE
ENV RACK_ENV production
ENV RAILS_SERVE_STATIC_FILES true

# Add a specific GIT tag for tracking
ARG GIT_SHA=unknown
ARG GIT_TAG=unknown
LABEL git-sha=$GIT_SHA \
	      git-tag=$GIT_TAG

# Precompile assets
RUN rails assets:precompile

# Launch puma
CMD ["bundle", "exec", "rails", "s", "Puma"]
