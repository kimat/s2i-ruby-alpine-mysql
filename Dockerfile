FROM ruby:2.4-alpine

RUN apk --update add \
    bash \
    build-base \
    mariadb-dev \
    libxml2-dev libxslt-dev \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && rm /var/cache/apk/*

EXPOSE 8080


LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i \
      io.s2i.scripts-url=image:///usr/libexec/s2i

ENV RUBY_VERSION 2.4


RUN mkdir -p /usr/libexec/s2i
# DEPRECATED: Use above LABEL instead, because this will be removed in future versions.
ENV STI_SCRIPTS_URL=image:///usr/libexec/s2i
# Path to be used in other layers to place s2i scripts into
ENV STI_SCRIPTS_PATH=/usr/libexec/s2i
# Copy assemble, run, save-assets scripts
COPY ./s2i/bin/ $STI_SCRIPTS_PATH

RUN mkdir -p /opt/app-root/src
ENV APP_ROOT=/opt/app-root
ENV HOME=/opt/app-root/src
ENV PATH=/opt/app-root/src/bin:/opt/app-root/bin:$PATH
WORKDIR /opt/app-root/src

# Copy extra files to the image (bunlder config)
COPY ./root/ /

# postgresql-dev \

# pg: postgresql-dev
# mysql: mariadb-dev
# nokogiri: libxml2-dev libxslt-dev:w
# github gems: git

RUN bundle config build.nokogiri --use-system-libraries

CMD $STI_SCRIPTS_PATH/usage
