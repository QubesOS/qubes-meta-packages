RPM_SPEC_FILES.vm := rpm_spec/qubes-vm-meta-packages.spec
DEBIAN_BUILD_DIRS.vm := debian

RPM_SPEC_FILES := $(RPM_SPEC_FILES.$(PACKAGE_SET))
DEBIAN_BUILD_DIRS := $(DEBIAN_BUILD_DIRS.$(PACKAGE_SET))

# vim: filetype=make
