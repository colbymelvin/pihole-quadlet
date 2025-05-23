# pihole-quadlet

Repository containing everything necessary to run Pi-hole in a rootless Podman Quadlet

## Description

A repository containing everything necessary to run Pi-hole in a [rootless Podman Quadlet](https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html#podman-rootless-unit-search-path).

See also [documentation regarding running Podman in a rootless environment](https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md).

See also [the official Pi-hole docker image](https://hub.docker.com/r/pihole/pihole).

## Requirements

1. A Linux distribution with systemd, git, and internet access.
2. Podman v4.4.0+ is required because Quadlet support shipped with Podman v4.4.0.

### A note about Debian

> [!NOTE]
> It can be difficult to get Podman v4.4.0+ on Debian (stable). You have a few options here: switch to Debian testing or unstable, build Podman from source, install and manage Podman via Homebrew, or install and manage Podman via Nix.
> Personally, I have chosen the latter in favor of Nix's ease of use and broad package support. To install Podman v4.4.0+ via Nix on Debian, run:

```bash
$ sudo apt-get install passt uidmap
$ sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
$ nix-env --install --attr nixpkgs.podman
```

I also had to do the following:

```bash
sudo cp ~/.nix-profile/lib/systemd/system-generators/podman-system-generator /usr/lib/systemd/system-generators/
sudo cp ~/.nix-profile/lib/systemd/user-generators/podman-user-generator /usr/lib/systemd/user-generators/
```

## Instructions

- Clone this repo
- `./install.sh` to move .container, .network, and .volume files into the expected location, and start the systemd services.

## Goals

- Lightweight with minimal bloat / configuration
- Ease of use
- Maintainability
- Set it and forget it (services automatically run on system boot / restart)
