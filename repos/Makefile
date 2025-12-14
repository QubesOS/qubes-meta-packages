SHELL = /bin/bash

ifneq (,$(wildcard /etc/fedora-release))
DIST = fc$(shell rpm --eval %{fedora})
else ifneq (,$(wildcard /etc/os-release))
DIST = $(shell grep VERSION_CODENAME= /etc/os-release | cut -d'=' -f2)
endif

ifeq (,$(DIST))
# On debian if previous attempt failed
# it means we are on sid
ifneq (,$(wildcard /etc/debian_version))
DIST = $(shell cut -d'/' -f1 /etc/debian_version)
endif
endif

DIST ?= fc31

install-vm-debian:
	install -d $(DESTDIR)/etc/apt/sources.list.d
	sed "s/@DIST@/$(DIST)/" qubes-contrib-r4.3.list.in \
		> $(DESTDIR)/etc/apt/sources.list.d/qubes-contrib-r4.3.list
	install -d $(DESTDIR)/etc/apt/trusted.gpg.d
	gpg --dearmor --output \
		$(DESTDIR)/etc/apt/trusted.gpg.d/qubesos-contrib-release-4.3-debian.gpg \
		qubesos-contrib-release-4.3-debian.asc

install-dom0:
	install -d $(DESTDIR)/etc/yum.repos.d
	install -m 0644 qubes-contrib-dom0-r4.3.repo.in $(DESTDIR)/etc/yum.repos.d/qubes-contrib-dom0-r4.3.repo
	sed -i "s/@DIST@/$(DIST)/g" $(DESTDIR)/etc/yum.repos.d/qubes-contrib-dom0-r4.3.repo
	install -d $(DESTDIR)/etc/pki/rpm-gpg/
	install -m 0644 qubesos-contrib-release-4.3-host.asc $(DESTDIR)/etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-4.3-contrib-host

install-vm-fedora:
	install -d $(DESTDIR)/etc/yum.repos.d
	install -m 0644 qubes-contrib-vm-r4.3.repo-fedora $(DESTDIR)/etc/yum.repos.d/qubes-contrib-vm-r4.3.repo
	install -d $(DESTDIR)/etc/pki/rpm-gpg/
	install -m 0644 qubesos-contrib-release-4.3-fedora.asc $(DESTDIR)/etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-4.3-contrib-fedora
