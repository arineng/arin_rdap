# arin_rdap
A very simple vagrant machine that currently uses either Ubuntu or CentOS designed to successfully build the [ARIN rdap development server](http://projects.arin.net/rdapbootstrap). Feel free to customize to suit your needs.

Instructions: 

```
git clone https://github.com/champain/arin_rdap.git
cd arin_rdap
vagrant up
```

If you'd like to use CentOS or Ubuntu you simply need to uncomment the relevant config line for your preferred OS:

```ruby
# Pick your preferred flavor to build on
BOX = "smbambling/centos66-64" # This one for CentOS
#BOX="ubuntu/trusty64" # This one for Ubuntu
```

This box also now deploys the .war on tomcat and rolls nicinfo at `/opt/nicinfo/bin/nicinfo`. You can either access the service from inside the vagrant machine
```
vagrant@arin-rdap:/opt/nicinfo/bin$ ./nicinfo -V -b http://127.0.0.1:8080/rdap_bootstrap_server-1000.0-SNAPSHOT ns1.verisign.com
# NicInfo v.1000.0.0-SNAPSHOT
## Using configuration found in /home/vagrant/.NicInfo
## Evicted 0 files from the cache
## Assuming query value is NAMESERVER
## Issuing GET for http://127.0.0.1:8080/rdap_bootstrap_server-1000.0-SNAPSHOT/nameserver/ns1.verisign.com
## Issuing GET for http://tlab.verisign.com/COM/nameserver/ns1.verisign.com
```

Or using the host machine on port 8080.
```
user@host# curl -v http://127.0.0.1:8080/rdap_bootstrap_server-1000.0-SNAPSHOT/ip/8.8.8.0
*   Trying 127.0.0.1...
* Connected to 127.0.0.1 (127.0.0.1) port 8080 (#0)
> GET /rdap_bootstrap_server-1000.0-SNAPSHOT/ip/8.8.8.0 HTTP/1.1
> User-Agent: curl/7.41.0
> Host: 127.0.0.1:8080
> Accept: */*
> 
< HTTP/1.1 302 Found
< Server: Apache-Coyote/1.1
< Location: http://rdappilot.arin.net/restfulwhois/rdap/ip/8.8.8.0
< Content-Length: 0
< Date: Wed, 22 Apr 2015 16:59:50 GMT
< 
* Connection #0 to host 127.0.0.1 left intact
```
