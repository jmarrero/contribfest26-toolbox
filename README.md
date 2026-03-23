# Bootc Contribfest

**KubeCon + CloudNativeCon EU 2026 -- Tuesday, March 23, 2026**

This repository provides a [Fedora Toolbox](https://containertoolbx.org/) development environment for contributing to [bootc](https://github.com/bootc-dev/bootc) and [bcvk](https://github.com/bootc-dev/bcvk). Toolbox is a tool for creating development containers that seamlessly integrate with your host system (similar to dev containers, but tightly integrated with your Linux desktop -- your home directory, networking, and display are shared automatically).

- **bootc** -- Transactional, in-place operating system updates using OCI/Docker container images. The container image includes a Linux kernel and full userspace; bootc manages deploying and upgrading the host system from these images. Written primarily in Rust.
- **bcvk** (bootc virtualization kit) -- Helps launch ephemeral VMs from bootc containers and create disk images for other virtualization frameworks. Written in Rust.

## Host Requirements

**You need a Linux host with KVM support.** macOS and Windows users will need to set up a Linux VM with nested virtualization enabled first.

The virtualization stack and Podman must be installed **on the host** (not just inside the toolbox). bcvk reuses the host's virt stack to launch VMs.

On Fedora, install the following:

```bash
sudo dnf install -y \
    libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm \
    virt-install virt-manager virt-viewer virtiofsd \
    podman
```

Enable libvirt and add your user to the libvirt group:

```bash
sudo systemctl enable --now libvirtd
sudo usermod -a -G libvirt $USER
```

If you need to do this on another Linux distribution, you can use the package list above to find the relevant packages for your distribution.

## Getting Started

Build the toolbox image:

```bash
podman build -t contrib-fest -f toolbox.Containerfile .
```

Create a toolbox from the image:

```bash
toolbox create --image contrib-fest contrib-fest
```

Enter the toolbox:

```bash
toolbox enter contrib-fest
```

You now have a complete development environment ready to build and test bootc and bcvk.

## Building and Testing

Once inside the toolbox, clone the project you want to work on:

```bash
# For bootc
git clone https://github.com/bootc-dev/bootc.git
cd bootc
just build            # Build a container image from source (localhost/bootc)
cargo test            # Run unit tests
just test-container   # Run container integration tests
```

```bash
# For bcvk
git clone https://github.com/bootc-dev/bcvk.git
cd bcvk
cargo build           # Build from source
just test             # Run unit tests
just test-integration # Run integration tests (requires QEMU/KVM on the host)
```

Both projects use [Justfiles](https://github.com/casey/just) as the primary build interface. Run `just --list` in either repo to see all available targets.

## Before Submitting a PR

Both projects require:

- **Run `cargo fmt`** before committing -- CI gates on formatting.
- **Run `cargo clippy`** -- CI gates on lints (bootc uses `make validate`).
- **Sign your commits** -- bootc requires a [Developer Certificate of Origin](https://developercertificate.org/) sign-off. Use `git commit -s` to add the `Signed-off-by` line automatically.

See [bootc CONTRIBUTING.md](https://github.com/bootc-dev/bootc/blob/main/CONTRIBUTING.md) and [bcvk HACKING.md](https://github.com/bootc-dev/bcvk/blob/main/docs/HACKING.md) for full details.

## What's Inside the Toolbox

| Category | Packages | Purpose |
|---|---|---|
| bootc build deps | `dnf builddep bootc` | All RPM build dependencies for bootc |
| Rust toolchain | `rust-src`, `rust-analyzer`, `rustfmt`, `clippy` | IDE support and linting (system-packaged Rust) |
| Virtualization | `libvirt-daemon-*`, `qemu-kvm`, `virt-install`, `virt-manager`, `virt-viewer` | CLI tools to manage VMs from inside the toolbox |
| Testing | `testcloud`, `tmt+provision-virtual` | tmt test framework for bootc integration tests |
| Dev tools | `just`, `git`, `nu` (Nushell) | Command runner, version control, shell scripting |
| bcvk | `bcvk`, `virtiofsd`, `go-md2man` | Bootc virtualization kit and its dependencies |

## How the Podman Wrapper Works

Inside the toolbox, Podman commands are transparently delegated to the host's Podman via `flatpak-spawn --host`. This is necessary because container operations need to run on the host, not inside the toolbox container. The wrapper script is installed at `/usr/local/bin/podman` and handles this automatically.

## Issues to Work On

See [ISSUES.md](ISSUES.md) for the full list of issues to work on, organized by category.

## Useful Links

- [bootc project documentation](https://bootc-dev.github.io/bootc/)
- [bootc CONTRIBUTING.md](https://github.com/bootc-dev/bootc/blob/main/CONTRIBUTING.md)
- [bcvk HACKING.md](https://github.com/bootc-dev/bcvk/blob/main/docs/HACKING.md)
- [bcvk installation docs](https://github.com/bootc-dev/bcvk/blob/main/docs/src/installation.md)
- [#bootc-dev on CNCF Slack](https://cloud-native.slack.com/archives/C08SKSQKG1L)
