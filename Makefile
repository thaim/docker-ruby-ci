IMAGE=thaim/ruby-ci

.PHONY: help build push save

help: ## このヘルプメッセージを表示
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Dockerイメージを生成する
	DOCKER_TAG=latest DOCKERFILE_PATH=Dockerfile IMAGE_NAME=thaim/ruby:latest sh hooks/build

push: ## 生成したDockerイメージをRegistryに保存する
	docker push $(IMAGE):latest

save: ## 生成したDockerイメージをファイルに保存する
	docker save $(IMAGE) > $(GROUP)_$(NAME)_latest.tar
