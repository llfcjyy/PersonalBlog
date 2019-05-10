# PersonalBlog
个人博客（php）
1. 配置支持php的nginx（mysql/mariadb+php+nginx）
1. 创建用户yi密码1，恢复数据库typecho（mysql -uyi -p'1' < typecho_bak.sql）
1. 把网站放到nginx目录下面
1. 备份typecho数据库mysqldump -uyi -p'1' -B typecho > typecho_bak.sql
