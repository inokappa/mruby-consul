FROM ruby
MAINTAINER inokappa

RUN apt-get update -y
RUN apt-get install -y \
    gcc \
    make \
    git \
    rake \
    bison \
    curl \
    automake \
    autoconf \
    libtool \
RUN rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/mruby/mruby.git /usr/local/mruby
WORKDIR /usr/local/mruby
ADD build_config.rb /tmp/build_config.rb
RUN mkdir /tmp/mruby-consul
ADD mrbgem.rake /tmp/mruby-consul/mrbgem.rake
ADD mrblib /tmp/mruby-consul/mrblib
RUN MRUBY_CONFIG=/tmp/build_config.rb rake

ENTRYPOINT ["/usr/local/mruby/bin/mruby"]
