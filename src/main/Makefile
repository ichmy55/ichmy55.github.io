#
# Github pages を検証する環境を作成する Makefile
#
.ONESHELL:
#
# ターゲット一覧
#
.PHONY: help up up-package stop down ps bash build lint clean distclean remotebuild remotelint remoteclean remotedistclean localbuild local-lint localclean localdistclean
.DEFAULT_GOAL := help
#
# Docker コマンドマクロ
#
DOCKER := docker
# 
# Makefileのファイル名
HELPFILE := $(MAKEFILE_LIST)
#
# プロジェクト毎設定の読み込み
#
include variables.mk
#
# ソースファイル一覧
#
SRCDIR   := src
SRCDIR2  := markdown
SRCS     := index.html $(wildcard  $(SRCDIR)/*.html)
DOCS     := README.md  $(wildcard  $(SRCDIR2)/*.md)
#
# Makefile内で使用するshellを定義
SHELL=/bin/bash
#
help: ## ヘルプを表示する
	@echo "Command list:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(HELPFILE) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
#
# Docker compose 制御ターゲット
#
up: ## コンテナを初期化します
	make down
	if [ $(PACKAGE_USE) -eq 1 ]; then
	  $(DOCKER) pull $(DOCKER_IMAGE)
	  $(DOCKER) run -d -p 8080:80  -v $(PWD)/htdocs:/usr/local/apache2/htdocs/ -v $(PWD):/home/builder/ --name $(DOCKER_NAME) $(DOCKER_IMAGE)
	else
	  $(DOCKER) build . -t $(DOCKER_IMAGE_LOCAL)
	  $(DOCKER) run -d -p 8080:80 -v $(PWD)/htdocs:/usr/local/apache2/htdocs/ -v $(PWD):/home/builder/ --name $(DOCKER_NAME)  $(DOCKER_IMAGE_LOCAL)
	fi
#
up-package: ## コンテナを初期化します（出来合いのパッケージを使います）
	PACKAGE_USE   := 1
	make up
#
stop: ## コンテナを停止します
	@$(DOCKER) stop $(DOCKER_NAME)
#
down: ## コンテナを停止し，upで作成したコンテナ，ネットワーク，ボリューム，イメージを削除
	@$(DOCKER) rm -f  $(DOCKER_NAME)
	make clean
#
ps: ## コンテナを確認します
	@$(DOCKER) ps -a
#
bash: ## コンテナへログインします
	@$(DOCKER) exec -it -u builder $(DOCKER_NAME) /bin/bash
#
# 現在Docker内か外か？を自動判定し分岐します
# Docker内環境からはローカルで実行します
# Docker外環境からはDocker環境を立ち上げ、そちらで実行するようにします
# どちらで実行するか強制したい場合は、ここより下にある、remote***やlocal***などの
# 接頭語がついたターゲットを使用してください
#
build: ## smarty templatesからhtmlにコンパイルします(環境は自動判別)
ifndef CONTAINER_ENV
	make remotebuild # Docker外でbuildといえばDocker環境へbuildを投げる、localでしたい場合はlocalbuildとすること
else
	make localbuild
endif
#
lint: ## latexをLintにかけます(環境は自動判別)
ifndef CONTAINER_ENV
	make remotelint  # Docker外でlintといえばDocker環境へlintを投げる、localでしたい場合はlocal-lintとすること
else
	make local-lint
endif
#
clean: ## データ整理(環境は自動判別)
ifndef CONTAINER_ENV
	make remoteclean # Docker外でcleanといえばDocker環境へbuildを投げる、localでしたい場合はlocalcleanとすること
else
	make localclean
endif
#
distclean: ## データ整理(環境は自動判別)
ifndef CONTAINER_ENV
	make remotedistclean # Docker外でcleanといえばDocker環境へdistcleanを投げる、localでしたい場合はlocaldistcleanとすること
else
	make localdistclean
endif
#
# コンテナ環境下でのビルド関連ターゲット
#
remotebuild: ## コンテナ環境にてlatexからpdfにコンパイルします
	make remoteclean
	@$(DOCKER) exec -it $(DOCKER_NAME) make localbuild
#
remotelint: ## コンテナ環境にてhtmlをLintにかけます
	@$(DOCKER) exec -it $(DOCKER_NAME) make local-lint
#
remoteclean: ## コンテナ上のデータ整理
	@$(DOCKER) exec -it $(DOCKER_NAME) make localclean
#
remotedistclean: ## コンテナ上のデータ整理
	@$(DOCKER) exec -it $(DOCKER_NAME) make localdistclean
#
# ローカルでのビルド関連ターゲット
#
localbuild: ## ローカル環境にてsmarty templatesからhtmlにコンパイルします
	make localclean
	php src/php/smarty.php
#
local-lint: ## ローカル環境下でlatexをlintにかけます
	npx textlint -f pretty-error README.md $(SRCS) $(DOCS)
#
localclean: ## ローカル環境の不要ファイルを消し、再度Up
	mkdir -p htdocs smarty
	rm -rf  htdocs/* .bash_history smarty/*; cp src/main/index.html htdocs ; ln -s ../src/templates smarty
	cp -rL src/css htdocs/
	cp -rL src/images htdocs/
	cp VERSION.txt  htdocs/

localdistclean: ## ローカル環境の不要ファイルを消す
	mkdir -p htdocs smarty
	rm -rf  htdocs/* smarty/* .viminfo .bash_history
