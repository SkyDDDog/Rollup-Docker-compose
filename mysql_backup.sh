#!/bin/bash
#设置mysql的登录用户名和密码
mysql_user="root"
mysql_password="123456"
mysql_host="localhost"
mysql_port="3306"
 
# 需要备份的数据库
database="rollup"
# mysql容器名称
docker_name="rollup-compose-mysql-1"
# 备份文件存放地址
backup_location=/home/lyd/rollup-compose/backup
 
# 是否删除过期数据
expire_backup_delete="ON"
expire_days=7
backup_time=`date +%Y%m%d%H%M`
backup_dir=$backup_location
 
# 备份指定数据库中数据(数据库为ry-vue)
docker exec -it ${docker_name} mysqldump -h$mysql_host -P$mysql_port -u$mysql_user -p$mysql_password -B $database > $backup_dir/$backup_time.sql
 
 
# 删除过期数据
if [ "$expire_backup_delete" == "ON" -a  "$backup_location" != "" ];then
        `find $backup_location -name "*.sql" -type f -mmin +1 -exec rm -rf {} \; > /dev/null 2>&1`
        echo "Expired backup data delete complete!"
fi


tar zcf /home/lyd/rollup-compose/backup/databackup.sql.tar.gz ./backup/*.sql
echo $(date +%F)"数据库备份"|mail -s $(date +%F)"数据库备份" -a /home/lyd/rollup-compose/backup/databackup.sql.tar.gz 362664609@qq.com
