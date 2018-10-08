IP：
192.168.1.103    Host machine
192.168.1.210    VMware 12 PRO 

OS:
$ cat /etc/centos-release
	CentOS Linux release 7.4.1708 (Core) 
$ uname -r
	3.10.0-693.el7.x86_64


$ docker pull jenserat/seafile:lates
$ docker images
	jenserat/seafile     latest     f71ea4af5581     3 weeks ago     297MB
$ sudo mkdir /kpkp
$ cd /kpkp
$ wget http://seafile-downloads.oss-cn-shanghai.aliyuncs.com/seafile-server_6.2.5_x86-64.tar.gz
$ docker run -t -i --rm -p 10001:10001 -p 12001:12001 -p 8000:8000 -p 8080:8080 -p 8082:8082 -v /kpkp:/opop jenserat/seafile -- /bin/bash
	*** Running /etc/my_init.d/00_regen_ssh_host_keys.sh...
	*** Running /etc/my_init.d/10_syslog-ng.init...
	Aug 14 07:24:01 df19d8bd67a2 syslog-ng[10]: syslog-ng starting up; version='3.5.6'
	Aug 14 07:24:01 df19d8bd67a2 syslog-ng[10]: WARNING: you are using the pipe driver, underlying file is not a FIFO, it should be used by file(); filename='/dev/stdout'
	Aug 14 07:24:02 df19d8bd67a2 syslog-ng[10]: EOF on control channel, closing connection;
	*** Running /etc/rc.local...
	*** Booting runit daemon...
	*** Runit started as PID 16
	*** Running /bin/bash...

Config:
Switch to the /opop directory in the container !!!	
$ cd /opop
$ tar -zxvf seafile-server_6.2.5_x86-64.tar.gz
$ cd seafile-server-6.25/
$ ./setup-seafile.sh
    Press [ENTER] to continue         //Press enter
    [server name]: ILoveCode001       //Custom ServerName
    [This server's ip or domain]: 192.168.1.210    //example: www.mycompany.com OR 192.168.1.101
    [default: /opop/seafile-data ]    //Press enter. {Where would you like to store your seafile data?}
    [default: 8082 ]                  //Press enter

    This is your config information:

    server name:        ILoveCode001
    server ip/domain:   192.168.1.210
    seafile data dir:   /opop/seafile-data
    fileserver port:    8082
    //Press enter
    //Press enter

    run seafile server:     ./seafile.sh { start | stop | restart }
    run seahub  server:     ./seahub.sh  { start <port> | stop | restart <port> }

    port of seafile fileserver:   8082
    port of seahub:               8000

$ ./seafile.sh start            //start seafile 
$ ./seahub.sh start             //start sseahub
    [ admin email ] xxxx@126.com
    [ admin password ]  123456
    [ admin password again ] 123456
    ----------------------------------------
    Successfully created seafile admin
    ----------------------------------------

    Seahub is started
    Done.



Access on the host Browser：
$ 192.168.1.210:8000             //8000 port is seahub 
username: xxxx@126.com
password: 123456
