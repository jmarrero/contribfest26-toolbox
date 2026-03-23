# Issues to Work On

## Good First Issues

| Issue | Type | Title | Notes | Assignee |
|---|---|---|---|---|
| [bootc#1424](https://github.com/bootc-dev/bootc/issues/1424) | Rust | Start using GetRawBlob | Use the new `get_raw_blob` API from `containers-image-proxy` | Unassigned |
| [bootc#475](https://github.com/bootc-dev/bootc/issues/475) | Rust | Add debug output option | Log exact external commands (sgdisk, systemd-cryptenroll, etc.) for debugging | Unassigned |
| [bootc#192](https://github.com/bootc-dev/bootc/issues/192) | Rust | Verify target OS compatibility with `install-to-filesystem` | Sanity-check filesystem kernel module support before install | Unassigned |
| [bootc#1276](https://github.com/bootc-dev/bootc/issues/1276) | Rust | Add explicit mechanism to remove rollback deployment | Equivalent of `rpm-ostree cleanup` for bootc | Unassigned |
| [bootc#1891](https://github.com/bootc-dev/bootc/issues/1891) | CI | Gate on `update-generated` | Ensure `just update-generated` is a no-op in CI | Unassigned |
| [bootc#1419](https://github.com/bootc-dev/bootc/issues/1419) | Testing | Add tests which cover `--apply` | Similar test coverage needed in the upstream repo | Unassigned |
| [bootc#1481](https://github.com/bootc-dev/bootc/issues/1481) | Rust | Bootc container lint fails on ARM64 via QEMU emulation | Maybe make it a warning instead of a hard error | Unassigned |
| [bootc#1770](https://github.com/bootc-dev/bootc/issues/1770) | Rust/CI | Add release binaries that bundle deps | More complex but maybe not super hard | Unassigned |
| [bootc#1300](https://github.com/bootc-dev/bootc/issues/1300) | Rust | Add support for default image from `/usr/lib/os-release` | Default image for `system-reinstall-bootc` | Unassigned |
| [bootc#1270](https://github.com/bootc-dev/bootc/issues/1270) | Rust | Add progress indication to `system-reinstall-bootc` | Show spinner/progress during layer download and deploy | Unassigned |
| [bootc#960](https://github.com/bootc-dev/bootc/issues/960) | Rust | Make some install lints default fatal | Probably just re-use the lint code in the install module | Unassigned |
| [bootc#1229](https://github.com/bootc-dev/bootc/issues/1229) | Rust | install: Add `--karg-delete` | Look for the passed key during karg processing at install time | Unassigned |

## Documentation

| Issue | Type | Title | Notes | Assignee |
|---|---|---|---|---|
| [bootc#671](https://github.com/bootc-dev/bootc/issues/671) | Docs | Add a "migrating from rpm-ostree" doc | Document the expected migration path | Unassigned |
| [bootc#1987](https://github.com/bootc-dev/bootc/issues/1987) | Docs | Expand on dualboot possibilities and what we can assure | Document support status for dual booting (Windows, Asahi Linux, etc.) | Unassigned |

## Website

| Issue | Type | Title | Notes | Assignee |
|---|---|---|---|---|
| [bootc-dev.github.io#6](https://github.com/bootc-dev/bootc-dev.github.io/issues/6) | Docs | Mass-patch outstanding references | Update old `containers.github.io/bootc` URLs to the new `bootc-dev.github.io` | Unassigned |

## bcvk

| Issue | Type | Title | Notes | Assignee |
|---|---|---|---|---|
| [bcvk#200](https://github.com/bootc-dev/bcvk/issues/200) | Rust | Ephemeral VMs use a small `/var` partition size | Expose an option to increase `/var` size for ephemeral VMs | Unassigned |
| [bcvk#158](https://github.com/bootc-dev/bcvk/issues/158) | Rust | `bcvk libvirt ssh` should auto-start stopped VMs | Auto-start VMs on SSH, pair with auto-stop on idle | Unassigned |
| [bcvk#233](https://github.com/bootc-dev/bcvk/issues/233) | Rust | Auto-pull missing images | bcvk errors out instead of pulling the image if it isn't already present locally | Unassigned |
