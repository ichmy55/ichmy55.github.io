#
# Github pages を検証する環境を作成する Makefile
#
.ONESHELL:
#
# ターゲット一覧
#
.PHONY: help up up-package stop down ps bash build lint clean remotebuild remotelint remoteclean localbuild local-lint localclean distclean name localup diff
.DEFAULT_GOAL := help
#
# Docker コマンドマクロ
#
DOCKER := docker
# 
# Makefileのファイル名
HELPFILE := $(MAKEFILE_LIST)
#
# Docker コマンドマクロ
#
DOCKER_IMAGE  := httpd
DOCKER_NAME   := httpd
PACKAGE_USE   := 1              # 出来合いパッケージを使用するには"1"をセット
#
# ソースファイル一覧
#
#SRCDIR  := src/$(DEST_PDF)
#SRCDIR2 := src/commons1
#SRCS    := $(wildcard  $(SRCDIR)/*.tex)  $(wildcard  $(SRCDIR)/*.bst)  $(wildcard  $(SRCDIR)/*.bib)
#SRCS2   := $(wildcard  $(SRCDIR)/images/*)
#SRCS3   := $(wildcard  $(SRCDIR2)/*.tex)
#SRCS4   := $(wildcard  $(SRCDIR2)/images/*)
#SRCS5   := $(SRCS) $(SRCS2) $(SRCS3) $(SRCS4)
#DOCS    := $(wildcard  $(SRCDIR2)/docs/*.md)
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
	$(DOCKER) pull $(DOCKER_IMAGE)
	$(DOCKER) run -d -p 8080:80  -v $(PWD):/usr/local/apache2/htdocs/ --name $(DOCKER_NAME) $(DOCKER_IMAGE)
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
	@$(DOCKER) exec -it $(DOCKER_NAME) /bin/bash
#
#
#remotelint: ## コンテナ環境にてlatexをLintにかけます
#	make remoteclean
#	@$(DOCKER) exec -it $(DOCKER_NAME) make local-lint
#
# ローカルでのビルド関連ターゲット
#
#local-lint: ## ローカル環境下でlatexをlintにかけます
#	npx textlint -f pretty-error README.md $(SRCS) $(DOCS)
