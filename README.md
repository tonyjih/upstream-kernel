![RetroLX](retrolx-logo.png)

# kernel

This repository provides buildroot-based infrastructure plus configs and patches to build custom Linux kernels.

These kernels are used by RetroLX Linux OS distribution dedicated to retrogaming. 

These kernels target both ARM and x86 architectures used by:
- Embedded devices
- Gaming consoles
- Gaming handhelds
- Generic x86 and x86_64 devices.

Find more information about RetroLX at [retrolx.org](https://retrolx.org).

# Repository Structure
- board: Contains hardware-specific / board-specific files. Mostly kernel configuration and kernel patches.
- buildroot: Submodule infrastructure provided by the [Buildroot project](https://buildroot.org/).
- ci: See [Continuous Integration](#Continuous) for details.
- configs: Contains one config file per available architecture.
- package: Contains custom RetroLX packages not included in Buildroot. These are used to either build the kernel or rootfs.

# Build

The current official build environment is Ubuntu 20.10. Additional packages required are documented on the docker image ``kernel/ci/docker/Dockerfile``.

How to build is documented by the script ``kernel/ci/local/build-kernel-arch.sh`` that will start the build reusing the currently checkout repository.

Given your environment fullfill the requirements you can build locally. Example call:
```
./build-kernel-arch.sh ARCH
```

Alternatively the official Docker environment can be used. Example call:
```
./build-kernel-arch-docker.sh ARCH
```

Where ARCH is one of the available architectures.

The Docker build pipes the output to ``kernel/ci/local/docker-output.log`` by default.

The main artifact of the build can be found at: ``kernel/output/kernel-ARCH/images/kernel.tar.gz``.

# Continuous Integration

For every available architecture config file at ``config`` there is an asociated Microsoft Azure build pipeline defined at ``kernel/ci/azure``.

The current state for the build of every architecture supported by the master branch can be check at [Azure Pipelines](https://dev.azure.com/retrolx/RetroLX%20kernels/_build?view=folders).

The current kernel build of every architecture supported by the master branch can be check at [Retrolx Repository](https://repository.retrolx.org/).