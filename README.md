# Rollup-Docker-compose
卷吧前后端服务器部署(使用docker-compose)

* 使用docker容器运行各个项目，保证项目运行环境独立
* 使用Dockerfile生成镜像，便于一站式的交付并运行容器
* 使用docker-compose 一件管理和运行容器
* 将数据目录和部分文件挂载出来，便于备份和防止重要数据丢失
* 编写linux脚本并添加至定时任务中，定时备份数据库信息
* 使用nginx部署前端项目
* ~py项目由于依赖下载不来(本地都不行)只好暂时作罢~
