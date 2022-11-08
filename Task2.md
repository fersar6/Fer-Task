	
TASK-2
====

Problem:
----

Imagine a server with the following specs:
- 4 times Intel(R) Xeon(R) CPU E7-4830 v4 @ 2.00GHz
-  64GB of ram
- 2 tb HDD disk space
- 2 x 10Gbit/s nics
The server is used for SSL offloading and proxies around 25000 requests per second.
Please let us know which metrics are interesting to monitor in that specific case and
how would you do that? What are the challenges of monitoring this?

Solution:
----

1- CPU

CPU spec is like that and we can see all things about that CPU from below link;
4 times Intel(R) Xeon(R) CPU E7-4830 v4 @ 2.00GHz
https://www.intel.com/content/www/us/en/products/sku/93811/intel-xeon-processor-e74830-v4-35m-cache-2-00-ghz/specifications.html

Some calculations about our tasks and the metrics that must be monitored are below;
	
Server CPU 	usage: Every request use one thread. Totaly 4 Socket X 28 thread = 	112 Thread. 25.000 request / 112 Thread = 223 simultaneous process 	for one thread. 
Since there will be 25000 rps we should also monitor thread count handling those requests. 
Since there is ssl offloading and proxy tasks we should monitor CPU usage via standalone or tools like Zabbix, nagios etc.

Number of 	web server process: Every request is a process for operating system

*If it is wanted to standalone monitoring it can be used some system command:*

to see cpu usage percentage 
```
top -- with this command, we can see cpu usage percentages and some useful options (us, wa, ni etc) give us opinion about CPU usage.

```
to see number of threds
```
top -- this command gives also total threads number on the server.
ps -efL -- this command gives all threads on the server.
ps -T -p <pid> -- this command gives the threads for specific PIDs. 
```

2- RAM  

Server 	Memory Usage : The 	default HTTP Request Header value is 8190 bytes. 25000 	x 8 kb = 150.000 kb= 150MB Memory. This memory is used only http header. We have 64GB memory 	capacity. There is no bottleneck for the memory except for the https payload. Memory usage change according to the payload data. 	

to see ram usage 

```
free -- we can see all memory statistics.

```

3- DISK 
 	
Disk 	need: For proxy operation we use memory for cache. So we need disk space for only operating system, logs and http payload. 	

to see disk usage 

```
df -h -- This command gives disk usage statistic for human readable

```

4- NETWORK 
 	
Network utilization: 25.000 X 8KB = 200000KB = 195MB = 1562Mb/s = 1.53Gb/s 	

Total active connections: There are 223 momentary connection. So we have 223 	active connection for this case.

to see number of connections

```
netstat -a -- This command gives information of the all conections. 

```
On the other hand, if we want to network bw utilisation we must install some tools like iperf, bmon, iftop etc. 
 

As Conclusion;
For standlone monitoring,
If we use Windows for ssl offload and Proxy application, we must monitor via performans monitoring. We can monitor CPU, RAM, Disk, network, connetion metrics via performance monitoring tool. After we monitor adaquate time interval, we can analyse these data. What is the threshold values for metrics? Which metrics have used as full capacity? We detect all of these. Also we can monitor as live on task manager. 
On the other hand we can use sar command on linux for collecting statistical information such as CPU load, memory paging, memory utilization, swap usage, network I/O, and much more. After collecting data for specific interval time, it can be analyzed. 
For Zabbix or nagios,
If we use Zabbix or nagios (or etc.) monitoring tool. We must add this SSL offload and Proxy server on these. After we added as a host on the monitoring tool, we can describe the items for CPU, RAM, DISK, network and process monitoring options. We can easily monitor this type of centrilized monitoring system.

Challanges;
For standalone monitoring -- We can not constantly monitor the systems. If the bottleneck is happen in a time, we can not see this since we can not monitor constantly. Otherwise, if we want to monitor like this way, we give the monitoring commands constantly and comment to the outputs.
For monitoring tools -- We must install a monitoring server and configure it. After that it must be installed monitoring agents on the server for taking specific metrics via server with specific time intervals.

