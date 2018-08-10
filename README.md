# Docker for Packagist Mirror
这是一个Packagist Mirror的Docker镜像，服务于中国。

## Usage

用下面的命令可以快速创建一个Packagist Mirror:

```bash
docker run --name mirror -d -v /root/packagist-mirror/code:/public \
	-e MAINTAINER_REPO='php.composer.jinfeijie.cn' \
	-e DATA_MIRROR='https://packagist.org' \
	-e MAIN_MIRROR='https://packagist.org' \
	-e SLEEP=60 \
	-e TZ=Asia/Shanghai \
	-e APP_COUNTRY_NAME='China' \
	-e APP_COUNTRY_CODE='cn' \
	-e MAINTAINER_MIRROR='JIMCY' \
	-e MAINTAINER_PROFILE='https://github.com/jinfeijie' \
	-e MAINTAINER_REPO='https://github.com/jinfeijie/' \
	-e MAINTAINER_LICENSE='MIT License' 
	mrjin/mirror
```

其他环境变量存放于 `.env` 
