#
# apacheをテストする環境をDocker上に作成する
#
FROM httpd:2.4

ENV TZ=Asia/Tokyo
#
# 必要なパッケージをインストールします
#
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
  && apt-get update  \
  && apt-get install --no-install-recommends -y \
    locales-all=2.41-* \
    sudo=1.9.* \
    make=4.4.* \
    vim=2:9.*  \
    php8.4=8.4.* \
    smarty4=4.5.* \
    nodejs=20.19.* \
    npm=9.2.* \
  && rm -rf /var/lib/apt/lists/* \
  && npm install -g textlint@15.8.0 \
        textlint-plugin-html@1.0.1 \
        textlint-rule-preset-japanese@10.0.4 \
        textlint-rule-preset-ja-spacing@3.0.3 \
        textlint-filter-rule-comments@1.3.0 \
        textlint-rule-prh@6.1.0
#
# 環境設定
#
# 内部での作業は一般ユーザー「builder」にて実施
#
ENV UNAME=builder
ENV GID=1000
ENV UID=1000
ENV APACHE_DOCUMENT_ROOT=/home/builder/html/
RUN groupadd -g $GID -o $UNAME \
  &&  useradd -l -m -u $UID -g $GID -o -s /bin/bash $UNAME
#RUN echo "$UNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers # sudoが必要な時は生かす
WORKDIR /home/builder/
