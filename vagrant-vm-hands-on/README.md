```
vagrant up --provider virtualbox
```

```
cat <<EOF > /etc/yum.repos.d/local.repo
[InstallMedia]
name=Red Hat Enterprise Linux 8.6.0
mediaid=None
metadata_expire=-1
gpgcheck=0
cost=500
enable=1
cost=500
baseurl=file:///mnt/BaseOS/

gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
[InstallMedia-AppStream]
name=Redhat Enterprise Linux 8-AppStream
metadata_expire=-1
gpgcheck=0
enable=1
baseurl=file:///mnt/AppStream/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release
EOF

mount /dev/cdrom /mnt

```