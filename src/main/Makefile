#
# Github pages を検証する環境を作成する Makefile
#
.ONESHELL:
#
# ターゲット一覧
#
.PHONY: help up up-package stop down ps bash lint remotelint local-lint
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
lint: ## latexをLintにかけます(環境は自動判別)
ifndef CONTAINER_ENV
	make remotelint
else
	make local-lint
endif
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
#
ps: ## コンテナを確認します
	@$(DOCKER) ps -a
#
bash: ## コンテナへログインします
	@$(DOCKER) exec -it -u builder $(DOCKER_NAME) /bin/bash
#
remotelint: ## コンテナ環境にてhtmlをLintにかけます
	@$(DOCKER) exec -it -u builder $(DOCKER_NAME) make lint
#
local-lint: ## ローカル環境下でhtmlをlintにかけます
	npx textlint -f pretty-error $(SRCS) $(DOCS)
#
# ローカルでのビルド関連ターゲット
#
localclean: ## ローカル環境の不要ファイルを消す
	rm -rf  htdocs/* .bash_history; cp src/main/index.html htdocs
#
localup:
	cp -rL src/css htdocs/
	cp -rL src/images htdocs/
