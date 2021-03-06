# Consul Service Mesh Container #

![Consul Logo](https://raw.githubusercontent.com/geoffh1977/docker-consul/master/images/consul-logo.png)

## Description ##
This docker image provides the Hashicorp Consul service mesh. It includes a simple configuration to allow anybody to get started with Consul.

## Starting Consul Server ##
The default setup will create a single bootstrapped server node with the web ui enabled on port 8500. You can start this simple setup with the following command:

`docker run -it --rm --name consul -p 8400:8400 -p 8500:8500 -p 8600:8600/udp geoffh1977/consul`

## Data Persistence And Configs ##
In order to maintain data persistence across service restarts, you can mount a volume or host share on the "/data" path within the container.

You can also override the default config path and provide your own configuration files by mounting over the "/config" path.

### Getting In Contact ###
If you find any issues with this container or want to recommend some improvements, fell free to get in contact with me or submit pull requests on github.
