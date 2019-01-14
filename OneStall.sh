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
        source /etc/profile
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
        #echo "【Tomcat】正在配置Tomcat全局环境变量"
        echo "【Tomcat】Tomcat环境安装成功"
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
        echo "export PATH=PATH=\$M2_HOME/bin:\$PATH" >> /etc/profile
        source /etc/profile
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
        #echo "【MongoDB】正在配置MongoDB全局环境变量"
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
        echo "【ZooKeeper】正在配置ZooKeeper全局环境变量"
        echo "【ZooKeeper】ZooKeeper环境安装成功"
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
        echo "【Node】正在配置Node全局环境变量"
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

