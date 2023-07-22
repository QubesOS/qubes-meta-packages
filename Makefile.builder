RPM_SPEC_FILES.dom0 := rpm_spec/qubes-dom0-meta-packages.spec
RPM_SPEC_FILES.vm := rpm_spec/qubes-vm-meta-packages.spec
DEBIAN_BUILD_DIRS.vm := debian
ARCH_BUILD_DIRS.vm := archlinux

RPM_SPEC_FILES := $(RPM_SPEC_FILES.$(PACKAGE_SET))
DEBIAN_BUILD_DIRS := $(DEBIAN_BUILD_DIRS.$(PACKAGE_SET))
ARCH_BUILD_DIRS := $(ARCH_BUILD_DIRS.$(PACKAGE_SET))

# vim: filetype=make
