RPM_SPEC_FILES.dom0 := rpm_spec/qubes-dom0-meta-packages.spec
RPM_SPEC_FILES.vm := rpm_spec/qubes-vm-meta-packages.spec
DEBIAN_BUILD_DIRS.vm := debian
ARCH_BUILD_DIRS.vm := archlinux

RPM_SPEC_FILES := $(RPM_SPEC_FILES.$(PACKAGE_SET))
DEBIAN_BUILD_DIRS := $(DEBIAN_BUILD_DIRS.$(PACKAGE_SET))
ARCH_BUILD_DIRS := $(ARCH_BUILD_DIRS.$(PACKAGE_SET))

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
