dnf update -y 

dnf install -y vim wget man perl gcc attr python python-devel git  \ 
               libacl-devel libblkid-devel  gnutls-devel readline-devel \ 
               python-devel gdb pkgconfig  krb5-workstation zlib-devel \
               setroubleshoot-server libaio-devel  setroubleshoot-plugins \
               policycoreutils-python  libsemanage-python perl-ExtUtils-MakeMaker \
               perl-Parse-Yapp  perl-Test-Base popt-devel libxml2-devel libattr-devel \
               keyutils-libs-devel cups-devel bind-utils libxslt  \
               docbook-style-xsl openldap-devel autoconf pam-devel

git clone git://git.samba.org/samba.git

cd samba

./configure

make 

make install 

rm -rf /etc/krb5.conf

ln -sf /usr/local/samba/private/krb5.conf /etc/krb5.conf
