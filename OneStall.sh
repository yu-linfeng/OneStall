#!/bin/bash
# author : Okevin
jdk="./env/jdk-8u191-linux-x64.tar.gz"
tomcat="./env/apache-tomcat-8.5.37.tar.gz"
maven="./env/apache-maven-3.6.0-bin.tar.gz"
mongodb="./env/mongodb-linux-x86_64-4.0.5.tgz"
zk="./env/zookeeper-3.4.13.tar.gz"
node="./env/node-v10.15.0-linux-x64.tar.xz"
#安装JDK
installJdk() {
    echo "【Java】正在读取jdk-8u191-linux-x64安装包"
    if [ -f "$jdk" ]
    then
        echo "【Java】正在解压jdk-8u191-linux-x64到/usr/local/jdk"
        tar -zxvf $jdk -C ./env/
        mkdir /usr/local/jdk
        mv ./env/jdk1.8.0_191/* /usr/local/jdk
        echo "【Java】正在配置Java全局环境变量"
        echo "export JAVA_HOME=/usr/local/jdk" >> /etc/profile
        echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /etc/profile
        echo "export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> /etc/profile
        echo "【Java】Java环境安装成功"
    else
        echo "【Java】JDK不存在"
    fi
}

#安装Tomcat
installTomcat() {
    echo "【Tomcat】正在读取apache-tomcat-8.5.37安装包"
    if [ -f "$tomcat" ]
    then 
        echo "【Tomcat】正在解压apache-tomcat-8.5.37到/usr/local/tomcat"
        tar -zxvf $tomcat -C ./env/
        mkdir /usr/local/tomcat
        mv ./env/apache-tomcat-8.5.37/* /usr/local/tomcat
        echo "【Tomcat】正在开启防火墙并打开Tomcat默认端口：8080"
        systemctl start firewalld.service   #开启防火墙
        firewall-cmd --zone=public --add-port=8080/tcp --permanent  #开启8080端口
        firewall-cmd --reload
        echo "【Tomcat】Tomcat默认端口：8080开启成功"
    else 
        echo "【Tomcat】不存在"
    fi
}
#安装Maven
installMaven() {
    echo "【Maven】正在读取apache-maven-3.6.0-bin安装包"
    if [ -f "$maven" ]
    then 
        echo "【Maven】正在解压apache-maven-3.6.0-bin到/usr/local/maven"
        tar -zxvf $maven -C ./env/
        mkdir /usr/local/maven
        mv ./env/apache-maven-3.6.0/* /usr/local/maven
        echo "【Maven】正在配置Maven全局环境变量"
        echo "export M2_HOME=/usr/local/maven" >> /etc/profile
        echo "export PATH=\$M2_HOME/bin:\$PATH" >> /etc/profile
        echo "【Maven】Maven环境安装成功"
    else 
        echo "【Maven】不存在"
    fi
}
#安装MongoDB
installMongoDB() {
    echo "【MongoDB】正在读取mongodb-linux-x86_64-4.0.5安装包"
    if [ -f "$mongodb" ]
    then 
        echo "【MongoDB】正在解压mongodb-linux-x86_64-4.0.5到/usr/local/mongodb"
        tar -zxvf $mongodb -C ./env/
        mkdir /usr/local/mongodb
        mv ./env/mongodb-linux-x86_64-4.0.5/* /usr/local/mongodb
        echo "【MongoDB】MongoDB环境安装成功"
    else 
        echo "【MongoDB】不存在"
    fi    
}
#安装ZooKeeper
installZK() {
    echo "【ZooKeeper】正在读取zookeeper-3.4.13安装包"
    if [ -f "$zk" ]
    then 
        echo "【ZooKeeper】正在解压zookeeper-3.4.13到/usr/local/zookeeper"
        tar -zxvf $zk -C ./env/
        mkdir /usr/local/zookeeper
        mv ./env/zookeeper-3.4.13/* /usr/local/zookeeper
        echo "【ZooKeeper】正在开启防火墙并打开ZooKeeper端口：2181"
        systemctl start firewalld.service   #开启防火墙
        firewall-cmd --zone=public --add-port=2181/tcp --permanent  #开启8080端口
        firewall-cmd --reload
        echo "【ZooKeeper】ZooKeeper端口：2181开启成功"
    else 
        echo "【ZooKeeper】不存在"
    fi
}
#安装Node
installNode() {
    echo "【Node】正在读取node-v10.15.0-linux-x64安装包"
    if [ -f "$node" ]
    then 
        echo "【Node】正在解压node-v10.15.0-linux-x64到/usr/local/zookeeper"
        tar -zxvf $node -C ./env/
        mkdir /usr/local/node
        mv ./env/node-v10.15.0-linux-x64/* /usr/local/node
        echo "【Node】正在配置Node全局环境变量"
        echo "export NODE_HOME=/usr/local/node" >> /etc/profile
        echo "export PATH=\$NODE_HOME/bin:\$PATH" >> /etc/profile
        echo "【Node】Node环境安装成功"
    else 
        echo "【Node】不存在"
    fi
}

echo "欢迎使用OneStall v1.0"
echo -e "OneStall将会在CentOS安装以下程序：
* jdk-8u191-linux-x64 
* apache-tomcat-8.5.37
* apache-maven-3.6.0-bin
* mongodb-linux-x86_64-4.0.5
* zookeeper-3.4.13
* node-v10.15.0-linux-x64
全部安装请输入'y'或者键入'回车'，部分安装请输入'n'："
read IS_ALL
if [ $IS_ALL == "y" ]
then 
    installJdk
    installTomcat
    installMaven
    installMongoDB
    installZK
    installNode
else
    echo "部分安装"
fi
echo "安装成功！请输入“source /etc/profile”命令刷新配置！并请详细阅读config.md文件查看如何配置相关配置文件！"
