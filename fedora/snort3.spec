Name:           snort3
Version:        0.1
Release:        1%{?dist}
Summary:        Snort 3 Beta precompiled binaries. 
License:        GPLv2

#BuildRequires:  autoconf

%description
Snort 3 Beta precompiled binaries. 

%prep

%build

%install
cp -r %{_builddir}/usr %{buildroot}

%files
/usr/bin/*
/usr/etc/snort/*
/usr/include/snort/*
/usr/lib64/*
/usr/share/doc/snort/*
