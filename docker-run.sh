docker run -d --rm --name RForge -p 8080:80 -p 3690:3690 --mount type=bind,source=/www/rforge,target=/www/rforge --mount type=bind,source=/var/svnroot,target=/var/svnroot 709b5fd6261c
