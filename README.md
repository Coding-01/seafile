# docker install

    yum -y install yum-utils device-mapper-persistent-data lvm2	

    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

    yum -y install docker-ce 

    systemctl start docker

    systemctl enable docker

# pull image && Make Container

    docker pull zhangpengzhan456/seafile:6.2.5

    docker run -itd -p 10001:10001 -p 12001:12001 -p 8000:8000 -p 8080:8080 -p 8082:8082 -v /data:/opop zhangpengzhan456/seafile:6.2.5 -- /bin/bash

# download package && install

    mkdir /opop && cd /opop

    wget http://seafile-downloads.oss-cn-shanghai.aliyuncs.com/seafile-server_6.2.5_x86-64.tar.gz

    tar -zxvf seafile-server_6.2.5_x86-64.tar.gz -C /data

    docker exec -it <Container ID> /bin/bash

    cd /opop/seafile-server-6.25/

    ./setup-seafile.sh
            Press [ENTER] to continue         		     //Press enter
            [server name]: ILoveCode001       		     //Custom ServerName
    	    [This server\'s ip or domain]: 192.168.1.202     //example: www.mycompany.com OR 192.168.1.102
    	    [default: /opop/seafile-data ]    		 //Press enter. {Where would you like to store your seafile data?}
    	    [default: 8082 ]                  		 //Press enter


    	    server name:        ILoveCode001
    	    server ip/domain:   192.168.1.202
    	    seafile data dir:   /opop/seafile-data
    	    fileserver port:    8082


    	    run seafile server:     ./seafile.sh { start | stop | restart }
    	    run seahub  server:     ./seahub.sh  { start <port> | stop | restart <port> }

    	    port of seafile fileserver:   8082
    	    port of seahub:               8000

    ./seafile.sh start            //start seafile 

    ./seahub.sh start             //start sseahub
            [ admin email ]      	  <Email>
    	    [ admin password ]   	  <Password>
    	    [ admin password again ]  <Password>


# Access on the host Browser：

    192.168.1.210:8000             		//8000 port is seahub 

	username: <Email>
        password: <Password>
