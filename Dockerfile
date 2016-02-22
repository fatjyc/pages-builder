# Base
FROM ubuntu:trusty
# Set the locale
RUN locale-gen en_US.UTF-8
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
# Fix local and timezone
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y \
  python \
  ruby \
  libxml2-dev \
  curl \
  git \
  wget \
  build-essential \
  automake \
  autoconf \
  openssh-client \
  zlib1g-dev \
  gettext \
  libreadline-dev \
  libssl-dev \
  libffi-dev \
  libicu-dev \
  bison \
  nodejs

RUN wget -qO- https://github.com/ruby/ruby/archive/v2_1_7.tar.gz | tar xvz

RUN cd ruby-2_1_7 && autoconf && ./configure --disable-install-doc && make && make install

RUN gem install --no-ri --no-rdoc --source https://ruby.taobao.org \
jekyll:3.0.3 \
jekyll-sass-converter:1.3.0 \
jekyll-textile-converter:0.1.0 \
kramdown:1.9.0 \
rdiscount:2.1.8 \
redcarpet:3.3.3 \
RedCloth:4.2.9 \
liquid:3.0.6 \
rouge:1.10.1 \
jemoji:0.5.1 \
jekyll-mentions:1.0.1 \
jekyll-redirect-from:0.9.1 \
jekyll-sitemap:0.10.0 \
jekyll-feed:0.4.0 \
jekyll-gist:1.4.0 \
jekyll-paginate:1.1.0 \
github-pages-health-check:1.0.1 \
jekyll-coffeescript:1.0.1 \
jekyll-seo-tag:1.2.0 \
github-pages:51 \
html-pipeline:2.3.0 \
sass:3.4.21 \
safe_yaml:1.0.4 \
pygments.rb:0.6.3
