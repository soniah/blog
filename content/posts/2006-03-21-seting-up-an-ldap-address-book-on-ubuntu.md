---
title: Seting up an LDAP address book on Ubuntu
author: Sonia Hamilton
date: 2006-03-22
url: /2006/03/21/seting-up-an-ldap-address-book-on-ubuntu/
categories:
  - Other-Tech
tags:
  - Email
  - LDAP
  - Ubuntu
---
Quick and dirty on installing OpenLDAP as an addressbook server.

  * install

<pre>sudo aptitude install slapd ldap-utils</pre>

  * configure (if needed)

<pre>sudo dpkg-reconfigure -plow slapd</pre>

  * edit /etc/ldap/slapd.conf

<!--more-->

<pre>#include         /etc/ldap/schema/nis.schema
 suffix          "dc=snowfrog, dc=net"
 rootdn          "cn=admin,dc=snowfrog,dc=net"
 rootpw          secret</pre>

  * edit /etc/ldap/ldap.conf

<pre>$ cat ldap.conf
 HOST    127.0.0.1
 BASE    dc=snowfrog,dc=net
 URI     ldap://localhost</pre>

  * check working

<pre>ldapsearch -x</pre>

  * create a file that creates address book OU, and import

<pre>$ cat foo
 dn: dc=snowfrog, dc=net
 objectclass: top
 objectclass: dcObject
 objectclass: organization
 o: snowfrog
 dc: snowfrog
 dn: ou=addressbook, dc=snowfrog, dc=net
 objectclass: top
 objectclass: organizationalUnit
 ou: addressbook
 $ ldapadd -x -W -D 'cn=admin,dc=snowfrog, dc=net' -f foo -H "ldap://sandia.snowfrog.net"</pre>

  * in Thunderbird, export addresses to addr.ldif, then convert dumped address book to importable format

<pre>sed 's/^givenName:/displayName:/; /mozillaAbPersonObsolete/d; /modifytimestamp:/d; /dn:
 cn=/s/mail=.*/ou=addressbook,dc=snowfrog,dc=net/' addr.ldif &gt; addr2.ldif</pre>

  * convert .muttrc aliases

<pre>sed -n '/^alias/p' .muttrc | awk '$2 !~ /^z/ {print "#commentndn: cn=" $2
 ",ou=addressbook,dc=snowfrog,dc=netncn: " $2 "nsn: " $2 "nmail: " $3 "ndisplayName: " $2
 "nobjectClass: topnobjectClass: personnobjectClass: organizationalPersonnobjectClass:
 inetOrgPersonn"  }' &gt; /etc/ldap/addr2.ldif</pre>

  * import to OpenLDAP server

<pre>ldapadd -c -x -W -D 'cn=admin,dc=snowfrog, dc=net' -f addr2.ldif -H "ldap://sandia.snowfrog.net"</pre>

  * connect to LDAP server using Evolution; Thunderbird doesn&#8217;t have enough options
