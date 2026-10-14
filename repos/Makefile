SHELL = /bin/bash

ifneq (,$(wildcard /etc/fedora-release))
DIST = fc$(shell rpm --eval %{fedora})
else ifneq (,$(wildcard /etc/os-release))
DIST = $(shell grep VERSION_CODENAME= /etc/os-release | cut -d'=' -f2)
DIST_NAME = $(shell grep ^ID= /etc/os-release | cut -d'=' -f2)
endif

ifeq (,$(DIST))
# On debian if previous attempt failed
# it means we are on sid
ifneq (,$(wildcard /etc/debian_version))
DIST = $(shell cut -d'/' -f1 /etc/debian_version)
DIST_NAME = debian
endif
endif

DIST ?= fc31

install-vm-debian:
	install -d $(DESTDIR)/etc/apt/sources.list.d $(DESTDIR)/usr/share/qubes/keys
	sed "s/@DIST@/$(DIST)/" qubes-contrib-devel.sources.in \
		> $(DESTDIR)/etc/apt/sources.list.d/qubes-contrib-devel.sources
	sed "s/@DIST@/$(DIST)/" qubes-devel-$(DIST_NAME).sources.in \
		> $(DESTDIR)/etc/apt/sources.list.d/qubes-devel.sources
	install -d $(DESTDIR)/usr/share/keyrings
	gpg --dearmor --output \
		$(DESTDIR)/usr/share/keyrings/qubesos-contrib-release-devel-debian.pgp \
		qubesos-contrib-release-devel-debian.asc
	gpg --dearmor --output \
		$(DESTDIR)/usr/share/keyrings/qubes-devel-debian.pgp \
		qubes-devel-debian.asc
	ln -s qubes-devel-debian.pgp \
		$(DESTDIR)/usr/share/keyrings/qubes-devel-debian.gpg
	gpg --dearmor --output \
		$(DESTDIR)/usr/share/keyrings/qubes-devel-ubuntu.pgp \
		qubes-devel-ubuntu.asc

install-keys:
	install -m 0644 qubes-master-key.asc 3mdeb-master-key.asc $(DESTDIR)/usr/share/qubes/keys

install-dom0:
	install -d $(DESTDIR)/etc/yum.repos.d $(DESTDIR)/usr/share/qubes/keys
	sed "s/@DIST@/$(DIST)/g" qubes-contrib-dom0-devel.repo.in \
		> $(DESTDIR)/etc/yum.repos.d/qubes-contrib-dom0-devel.repo
	sed "s/@DIST@/$(DIST)/g" qubes-devel-host.repo.in \
		> $(DESTDIR)/etc/yum.repos.d/qubes-devel-host.repo
	install -d $(DESTDIR)/etc/pki/rpm-gpg/
	install -m 0644 qubesos-contrib-release-devel-host.asc $(DESTDIR)/etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-devel-contrib-host
	install -m 0644 qubes-devel-host.asc $(DESTDIR)/etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-devel-primary

install-vm-fedora:
	install -d $(DESTDIR)/etc/yum.repos.d $(DESTDIR)/usr/share/qubes/keys
	install -m 0644 qubes-contrib-vm-devel.repo-fedora $(DESTDIR)/etc/yum.repos.d/qubes-contrib-vm-devel.repo
	sed "s/@DIST@/$(DIST)/g" qubes-devel-vm.repo-fedora \
		> $(DESTDIR)/etc/yum.repos.d/qubes-devel-vm.repo
	install -d $(DESTDIR)/etc/pki/rpm-gpg/
	install -m 0644 qubesos-contrib-release-devel-fedora.asc $(DESTDIR)/etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-devel-contrib-fedora
	install -m 0644 qubes-devel-fedora.asc $(DESTDIR)/etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-devel-fedora
