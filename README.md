

# FT_SERVER
### by fde-capu

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

    sudo groupadd docker
    sudo usermod -aG docker ${USER}
    su -s ${USER}
    docker run hello-world

Check and disable in case ports 80 and 443 are already in use (`service nginx stop` or any other running server).


Usage:
------

Change directory: `cd srcs/docker-controls`.
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

---

*this project is part of the 42 São Paulo cursus*

[![fde-capu's 42Project Score](https://badge42.herokuapp.com/api/project/fde-capu/ft_server)](https://github.com/JaeSeoKim/badge42)

---

Copyright 2020 fde-capu

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
