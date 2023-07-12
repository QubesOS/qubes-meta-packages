RPM_SPEC_FILES.dom0 := rpm_spec/qubes-dom0-meta-packages.spec
RPM_SPEC_FILES.vm := rpm_spec/qubes-vm-meta-packages.spec
DEBIAN_BUILD_DIRS.vm := debian
ARCH_BUILD_DIRS.vm := archlinux

RPM_SPEC_FILES := $(RPM_SPEC_FILES.$(PACKAGE_SET))
DEBIAN_BUILD_DIRS := $(DEBIAN_BUILD_DIRS.$(PACKAGE_SET))
ARCH_BUILD_DIRS := $(ARCH_BUILD_DIRS.$(PACKAGE_SET))

ifneq (,$(findstring $(DISTRIBUTION),qubuntu debian))
  SOURCE_COPY_IN := source-debian-quilt-copy-in
endif

# remove Debian dependencies that will not work in Ubuntu focal
source-debian-quilt-copy-in:
	if [[ $(DIST) == focal ]] ; then \
            sed -i /qubes-core-agent-dom0-updates/d $(CHROOT_DIR)/$(DIST_SRC)/debian/control ;\
            sed -i /qubes-mgmt-salt-vm-connector/d $(CHROOT_DIR)/$(DIST_SRC)/debian/control ;\
	fi
	if [[ $(DIST) != bullseye ]] && [[ $(DIST) != focal ]] && [[ $(DIST) != jammy ]]; then \
	        sed -i "s/pulseaudio-qubes,/pipewire-qubes,/" $(CHROOT_DIR)/$(DIST_SRC)/debian/control ;\
	fi

# Support for new packaging
ifneq ($(filter $(DISTRIBUTION), archlinux),)
VERSION := $(file <$(ORIG_SRC)/$(DIST_SRC)/version)
GIT_TARBALL_NAME ?= qubes-vm-dependencies-$(VERSION)-1.tar.gz
SOURCE_COPY_IN := source-archlinux-copy-in

source-archlinux-copy-in: PKGBUILD = $(CHROOT_DIR)/$(DIST_SRC)/$(ARCH_BUILD_DIRS)/PKGBUILD
source-archlinux-copy-in:
	cp $(PKGBUILD).in $(CHROOT_DIR)/$(DIST_SRC)/PKGBUILD
	sed -i "s/@VERSION@/$(VERSION)/g" $(CHROOT_DIR)/$(DIST_SRC)/PKGBUILD
	sed -i "s/@REL@/1/g" $(CHROOT_DIR)/$(DIST_SRC)/PKGBUILD
endif


# vim: filetype=make
