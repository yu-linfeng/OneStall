```
 _____            _____ _        _ _ 
|  _  |          /  ___| |      | | |
| | | |_ __   ___\ `--.| |_ __ _| | |
| | | | '_ \ / _ \`--. \ __/ _` | | |
\ \_/ / | | |  __/\__/ / || (_| | | |
 \___/|_| |_|\___\____/ \__\__,_|_|_|
```
# 【OneStall】安装环境配置说明
**在执行成功OneStall.sh后，请务必执行“source /etc/profile”命令，以使全局环境变量刷新成功**

---
## 【Java】
此环境所使用的JDK版本为```jdk-8u191```，安装路径为```/usr/local/jdk```，安装成功后无需配置，可通过```java -version```查看是否安装成功。
## 【Tomcat】
此环境所使用的Tomcat版本为```apache-tomcat-8.5.37```，安装路径为```/usr/loca/tomcat```，安装成功后可进入```/usr/local/tomcat/bin```目录执行```./startup.sh ```命令启动Tomcat。
## 【Maven】
此环境所使用的Maven版本为```apache-maven-3.6.0```，安装路径为```/usr/local/maven```，安装成功无需配置，可通过```mvn -v```查看是否安装成功。
Maven默认访问中央仓库由于网络的原因速度会比较慢，可加入阿里云的镜像访问中央仓库。将以下代码加入到可在```/usr/local/maven/conf/settings.xml```配置文件中的```mirrors```节点里：
```xml
<mirror>
    <id>alimaven</id>
    <name>aliyun maven</name>
    <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
    <mirrorOf>central</mirrorOf>        
</mirror>
```
## 【MongoDB】
此环境所使用的MongoDB版本为```mongodb-4.0.5```，安装路径```/usr/local/mongodb```。如果使用MongoDB默认配置，则需要创建数据库的存储路径```/data/db```，所以在这我们可直接新建一个配置文件在```/usr/local/mongodb/mongod.conf```如下：
```properties
dbpath=/home/mongo/data     #数据文件存储地址
logpath=/home/mongo/mongod.log  #mongo日志存储地址
logappend=true  #写日志的模式为“追加模式”，true-追加
fork=true   #是否后台运行，true-后台运行
auth=true   #是否开启认证
```
进入```/usr/local/mongodb/bin```目录，执行```./mongod --config ../mongod.conf```命令，回显以下信息表示启动成功：
```
about to fork child process, waiting until server is ready for connections.
forked process: 15704
child process started successfully, parent exiting
```
继续在```/usr/local/mongodb/bin```目录下执行```./mongo```进入MongoDB命令行交互模式。
关于MongoDB的用户权限配置请参考【···】





