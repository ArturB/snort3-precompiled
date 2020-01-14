Name:           snort3
Version:        0.1
Release:        1%{?dist}
Summary:        Snort 3 Beta precompiled binaries.
License:        GPLv2

%description
Snort 3 Beta precompiled binaries.

%prep

%build

%install
cp -r %{_builddir}/* %{buildroot}

%files
/etc/snort/*
/usr/bin/*
/usr/include/*
/usr/share/doc/snort/*
/usr/lib64/*
