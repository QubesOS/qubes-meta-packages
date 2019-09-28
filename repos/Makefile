install-vm-debian:
	install -d $(DESTDIR)/etc/apt/sources.list.d
	sed -e "s/@DIST@/`lsb_release -cs`/" qubes-contrib-r4.0.list.in \
		> $(DESTDIR)/etc/apt/sources.list.d/qubes-contrib-r4.0.list
	install -d $(DESTDIR)/etc/apt/trusted.gpg.d
	gpg --dearmor --output \
		$(DESTDIR)/etc/apt/trusted.gpg.d/qubes-4-contrib-keyring.gpg \
		qubesos-contrib-release-4-debian.asc

install-dom0: install-fedora
	install -d $(DESTDIR)/etc/yum.repos.d
	install -m 0644 qubes-contrib-dom0-r4.0.repo $(DESTDIR)/etc/yum.repos.d

install-vm-fedora: install-fedora
	install -d $(DESTDIR)/etc/yum.repos.d
	install -m 0644 qubes-contrib-vm-r4.0.repo-fedora $(DESTDIR)/etc/yum.repos.d/qubes-contrib-vm-r4.0.repo

install-vm-centos: install-centos
	install -d $(DESTDIR)/etc/yum.repos.d
	install -m 0644 qubes-contrib-vm-r4.0.repo-centos $(DESTDIR)/etc/yum.repos.d/qubes-contrib-vm-r4.0.repo

install-fedora:
	install -d $(DESTDIR)/etc/pki/rpm-gpg/
	install -m 0644 qubesos-contrib-release-4-fedora.asc \
		$(DESTDIR)/etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-4-contrib
	ln -s RPM-GPG-KEY-qubes-4-contrib \
		$(DESTDIR)/etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-4.0-contrib
install-centos:
	install -d $(DESTDIR)/etc/pki/rpm-gpg/
	install -m 0644 qubesos-contrib-release-4-centos.asc \
		$(DESTDIR)/etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-4-contrib
	ln -s RPM-GPG-KEY-qubes-4-contrib \
		$(DESTDIR)/etc/pki/rpm-gpg/RPM-GPG-KEY-qubes-4.0-contrib
