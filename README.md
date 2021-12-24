# Supported tags and respective `Dockerfile` links
  -	[`steam` (*buster/Dockerfile*)](https://github.com/crutonjohn/steamcmd-autopilot/blob/main/steamcmd/Dockerfile)
  -	[`root` (*buster-root/Dockerfile*)](https://github.com/crutonjohn/steamcmd-autopilot/blob/main/steamcmd-root/Dockerfile)

# What is SteamCMD-Autopilot?

This container image is built on the work done by [CM2Walki](https://github.com/CM2Walki/steamcmd) to establish an easy way to spin up game servers for popular [Steam](https://steampowered.com) games.

## Why the additions to SteamCMD?

From my use with Kubernetes and containers, the original SteamCMD container was not built with the use in mind for a single-touch deployment. When running the original SteamCMD container the user is expected to `exec` into the container to intialize the game server. With the addition of a few scripts we are able to enable users to specify credentials, application install directory, and application ID, so that servers can be programmatically defined using environment variables. While we cannot simply automate every possible action that may need to be taken when spinning up and starting a game server this provides a relatively sane starting point to get through the bootstrapping process.

# How to use this image

This image was specifially designed for use inside a Kubernetes cluster. More specifically using a Helm chart to deploy the game server. However, it is possible to run this container ad-hoc as well.

## Image Tags

Following upstream, there are two different images:

### `steamcmd-autopilot:latest`
This is the defacto image. If you are unsure about what your needs are, you probably want to use this one. It is designed to be used as the base to build other images off of. This image's default user is `steam`, any command executed in a higher layer `Dockerfile` will therefor be executed as that user.<br/>

### `steamcmd-autopilot:root`
This is a specialized image. This image's default user is `root`. If you need to install additional packages for you game server and do not want to create excess layers, then this is the right choice.
