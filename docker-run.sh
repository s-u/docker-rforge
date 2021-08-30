## 80 = RForge.net website
## 81 = svn.RForge.net (svn DAV)
## 3690 = svnserve
docker run -d --rm --name RForge -p 127.0.0.1:8080:80 -p 127.0.0.1:8081:81 -p 3690:3690 --mount type=bind,source=/www/rforge,target=/www/rforge --mount type=bind,source=/var/svnroot,target=/var/svnroot rforge:v2
