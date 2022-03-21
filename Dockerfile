FROM debian:buster-slim
LABEL maintainer="Radek Světlík <svetlik.radek@svkpk.cz>"

RUN apt update && apt install -y --no-install-recommends \
  locales \
  cpanminus \
  build-essential \
  libexpat1-dev

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN adduser --disabled-password --gecos "" catmandu

COPY ./cpanfile /home/catmandu

WORKDIR /home/catmandu

RUN cpanm -n -q --installdeps . && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /root/.cpanm/* /usr/local/share/man/* && \
  rm /home/catmandu/cpanfile

USER catmandu

CMD ["/bin/bash"]