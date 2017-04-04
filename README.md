Quick local habitat demo environment with National-Parks

This cookbook sets up Docker Engine and Habitat on a host via kitchen-vagrant.

It is based on the hands-on-habitat set up, but doesn't use the same multistep, multifix methods to get to a running state.

Exported ports:
  guest 8080 => host 8080
  guest 9631 supervisor of the national parks app => host 9631

Commands to launch the components:

In one terminal, to launch MongoDB
* sudo hab pkg export docker nathenharvey/mongodb
* sudo /usr/local/bin/docker-compose -f mongo-compose.yml up

In another terminal, to launch the Java application
* sudo hab start nathenharvey/national-parks --peer 127.0.0.1 --bind database:mongodb.default

