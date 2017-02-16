FROM ruby:2.3.1
ARG PARLIAMENT_BASE_URL

ENV APP_USER parliament
ENV GTM_KEY $GTM_KEY
ENV ASSET_LOCATION_URL $ASSET_LOCATION_URL

# create user to run app in user space
RUN set -x \
        && groupadd -g 5000 $APP_USER \
        && adduser --disabled-password --uid 5000 --gid 5000 --gecos '' $APP_USER

ENV RAILS_ROOT /opt/parliamentukprototype

# application specific environment variables
ENV PARLIAMENT_BASE_URL $PARLIAMENT_BASE_URL
ENV DATA_URI_PREFIX http://id.ukpds.org

RUN mkdir -p $RAILS_ROOT

# gems installation
COPY Gemfile* $RAILS_ROOT/
RUN cd $RAILS_ROOT \
    && gem update --system \
    && gem install bundler \
    && env NOKOGIRI_USE_SYSTEM_LIBRARIES=true bundle install \
    && chown -R $APP_USER:$APP_USER $GEM_HOME

# add project
COPY . $RAILS_ROOT
RUN chown -R $APP_USER:$APP_USER $RAILS_ROOT

USER $USER
WORKDIR $RAILS_ROOT

ARG GIT_SHA=unknown
ARG GIT_TAG=unknown
LABEL git-sha=$GIT_SHA \
	      git-tag=$GIT_TAG

# EXPOSE 3000

RUN rails assets:precompile

CMD ["passenger", "start"]
