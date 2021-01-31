# DockerStack - https://www.facebook.com/groups/205764024543769/?ref=share
My docker container definitions (docker compose) that I run. Plus a few other little bits.

Just update the values in the .env file and run "docker-compose up -d". I normally persist my local docker files to /home/user/docker/appName, but put them where you like. 
  
Once everything is installed, you will still have to configure each app.
  
Dont forget to create directories under your docker folder for the volumes mapped in the yaml
  
Note: I generally organise my media under one top-level directory and all lower case. I find this makes it easier with container references.
   e.g.
        media - with the following as sub-direcories: 
          - movies
          - 4k
          - pictures
          - 3d
          - tv
          - audiobooks
          - ebooks
          - music
          - anime

This yaml will run on Synology NAS, Ubuntu, 95% on Windows (with WSL 2), and at least 70% on a Raspberry Pi (but not all at once).

Join me and others on the Dockerholics fb group.

https://www.facebook.com/groups/205764024543769/?ref=share
