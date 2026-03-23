# Host requirements:
# Virt stack
#     libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm \
#     virt-install virt-manager virt-viewer virtiofsd
# Podman
FROM registry.fedoraproject.org/fedora-toolbox:43
COPY podman /usr/local/bin/
RUN dnf builddep bootc -y && dnf install -y \
         # run local qemu vms
         libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm \
         virt-install virt-manager virt-viewer \
         # tmt for bootc tests
         testcloud tmt+provision-virtual nu just git \
         # rust-src is needed when you are not using rust-up to install rustc to be able to use rust-analyzer
         rust-src rust-analyzer rustfmt clippy \
         # bcvk and its dependencies
         bcvk virtiofsd go-md2man && \
         chmod +x /usr/local/bin/podman && \
         # Clean up
         dnf clean all

