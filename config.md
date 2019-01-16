```
 _____            _____ _        _ _ 
|  _  |          /  ___| |      | | |
| | | |_ __   ___\ `--.| |_ __ _| | |
| | | | '_ \ / _ \`--. \ __/ _` | | |
\ \_/ / | | |  __/\__/ / || (_| | | |
 \___/|_| |_|\___\____/ \__\__,_|_|_|
```
# 【OneStall】安装环境配置说明
**在执行成功OneStall.sh后，请务必执行“source /etc/profile”命令，以使全局环境变量刷新成功**

---
## 【Java】
此环境所使用的JDK版本为```jdk-8u191```，安装路径为```/usr/local/jdk```，安装成功后无需配置，可通过```java -version```查看是否安装成功。
## 【Tomcat】
此环境所使用的Tomcat版本为```apache-tomcat-8.5.37```，安装路径为```/usr/loca/tomcat```，安装成功后可进入```/usr/local/tomcat/bin```目录执行```./startup.sh ```命令启动Tomcat。
## 【Maven】
此环境所使用的Maven版本为```apache-maven-3.6.0```，安装路径为```/usr/local/maven```，安装成功无需配置，可通过```mvn -v```查看是否安装成功。
Maven默认访问中央仓库由于网络的原因速度会比较慢，可加入阿里云的镜像访问中央仓库。将以下代码加入到可在```/usr/local/maven/conf/settings.xml```配置文件中的```mirrors```节点里：
```xml
<mirror>
    <id>alimaven</id>
    <name>aliyun maven</name>
    <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
    <mirrorOf>central</mirrorOf>        
</mirror>
```
## 【MongoDB】
此环境所使用的MongoDB版本为```mongodb-4.0.5```，安装路径```/usr/local/mongodb```。如果使用MongoDB默认配置，则需要创建数据库的存储路径```/data/db```，所以在这我们可直接新建一个配置文件在```/usr/local/mongodb/mongod.conf```如下：
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
继续在```/usr/local/mongodb/bin```目录下执行```./mongo```进入MongoDB命令行交互模式，如下所示：
```
MongoDB shell version v4.0.5
connecting to: mongodb://127.0.0.1:27017/?gssapiServiceName=mongodb
Implicit session: session { "id" : UUID("5673e588-75ca-4cf8-897c-71a8e31415f3") }
MongoDB server version: 4.0.5
>
```
用于在配置文件中配置了```auth=true```，也就是开启了认证，现在需要在admin数据库中创建一个超级账号，创建过程如下（“<-”表示回车）：
```
use admin  <-   //切换至admin数据库
回显：switched to db admin
db.createUser({user: "root",pwd: "root",roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]})  <-  //创建超级用户
回显：
Successfully added user: {
	"user" : "root",
	"roles" : [
		{
			"role" : "userAdminAnyDatabase",
			"db" : "admin"
		}
	]
}
db.auth('root','root')  <-  //root认证
回显：1
db.createUser({user: "okevin",pwd: "123456",roles: [ { role: "readWrite", db: "mydb" } ]})  <-  //创建一个普通账号，对应的数据库是“mydb”，MongoDB的数据库和账号是对应的，就算是超级账号也不能对其他数据库进行写入
回显：
Successfully added user: {
	"user" : "okevin",
	"roles" : [
		{
			"role" : "readWrite",
			"db" : "mydb"
		}
	]
}
db.auth('okevin','123456')  <-  //使用“okevin”账号认证
回显：1
use mydb  <-    //切换至mydb数据库
回显：switched to db mydb
db.repo.insert({"name":"kevin"})  <-    //向数据库插入一条数据，collection为repo
回显：WriteResult({ "nInserted" : 1 })
show collections  <-    //查看mydb下的collection，验证是否创建repo
回显：repo
db.repo.find().pretty()  <- //查看repo下的数据
回显：{ "_id" : ObjectId("5c3f48ad259c266fbe1f1051"), "name" : "kevin" }
```
以上就配置好了MongoDB
## 【ZooKeeper】
此环境所使用的JDK版本为```zookeeper-3.4.13```，安装路径为```/usr/local/zookeeper```。
安装成功后进入```/usr/local/zookeeper/conf```目录，执行```mv zoo_sample.cfg zoo.cfg```拷贝一份ZooKeeper的配置文件。修改```zoo.cfg```配置文件中ZooKeeper的数据存储路径为```dataDir=/home/zk```（当然你需要在该home下创建zk目录）。

进入```/usr/local/zookeeper/bin```，执行```./zkServer.sh start```，如下显示：
```
Using config: /usr/local/zookeeper/bin/../conf/zoo.cfg
Starting zookeeper ... STARTED
```
仍然在```/usr/local/zookeeper/bin```执行```./zkServer.sh status```，如下显示：
```
ZooKeeper JMX enabled by default
Using config: /usr/local/zookeeper/bin/../conf/zoo.cfg
Mode: standalone
```
ZooKeeper启动成功。
## 【Node】
此环境所使用的JDK版本为```node-v10.15.0```，安装路径为```/usr/local/node```，安装成功后无需配置，可通过```node -v```、```npm -v```查看是否安装成功。




