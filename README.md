# Hashicorp Consul Container #

![Consul Logo](https://raw.githubusercontent.com/geoffh1977/docker-consul/master/images/logo.png)

## Description ##
This docker image provides the a geoffh1977 container. It includes a simple configuration to allow anybody to get started with the Consul service mesh.

## Starting Consul Server ##
The default setup will create a single bootstrapped server node with the web ui enabled on port 8500. You can start this simple setup with the following command:

`docker run -it --rm --name consul -p 8400:8400 -p 8500:8500 -p 8600:8600/udp geoffh1977/consul`

## Data Persistence And Configs ##
In order to maintain data persistence across service restarts, you can mount a volume or host share on the "/data" path within the container.

You can also override the default config path and provide your own configuration files by mounting over the "/config" path.

## Downloading The Hashicorp Consul Container ##
This repository is connected to Docker Hub - so you will always find the latest builds there. Execute the _docker pull_ command in order to get the required image:

* geoffh1977/consul:latest - The latest build of the application that was completed
* geoffh1977/consul:1.4.4 - An exact version of the application

## Building The Hashicorp Consul Container ##
After cloning the repository, simply execute the _make build_ command while in the repository root path to execute a docker build of the current Dockerfile. The Makefile contains a number of useful commands which perform different actions.

### Getting In Contact ###
If you find any issues with this container or want to recommend some improvements, fell free to get in contact with me or submit pull requests on github.
