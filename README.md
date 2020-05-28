fde-capu
========
FT_SERVER
=========

42 São Paulo
------------

This project is a Dockerfile that builds a debian:buster container...
...containing:

- nginx
- SSL
- PHP
- MariaDB
- phpMyAdmin
- WordPress

Before Usage:
-------------

Create a docker group and add your user to the docker group:
`
sudo groupadd docker
sudo usermod -aG docker ${USER}
su -s ${USER}
docker run hello-world
`

Check and disable in case ports 80 and 443 are already in use;
Linux VM 42 usually has nginx running by default, so:
`service nginx stop`


Usage:
------

Goto: `cd srcs/docker-controls`
Build: `run.sh`.

-----

Other docker-controls commands:

- autoindex (x|on|off) : swich autoindex inside the container
- clean.sh : removes ft_server container and ft_server image
- o-clean-container.sh : force remove ft_container
- fclean(...).sh : erases all images and container (caution)
- it.sh : logs into ft_server container shell
- n-snap.sh : creates a snapshot of the container under the name of fde-capu_ft_server
- g-retake.sh : retakes the snapshot created above

Autoindex can be enabled and disabled by script. 
