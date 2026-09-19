#
# textlintする環境をDocker上に作成する
#
FROM httpd:2.4

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
#
# 必要なパッケージをインストールします
#
RUN apt update
RUN apt -y upgrade
RUN apt -y install locales-all
RUN apt -y install sudo make vim
RUN apt -y install nodejs npm
RUN npm install -g textlint textlint-plugin-html textlint-rule-preset-japanese textlint-rule-preset-ja-spacing textlint-filter-rule-comments textlint-rule-prh

#
# 環境設定
#
# 内部での作業は一般ユーザー「builder」にて実施
#
ENV UNAME=builder
ENV GID=1000
ENV UID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
#RUN echo "$UNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers # sudoが必要な時は生かす
WORKDIR /usr/local/apache2/htdocs/
