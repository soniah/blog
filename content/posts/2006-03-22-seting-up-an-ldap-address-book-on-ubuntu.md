---
author: sonia
comments: true
date: 2006-03-22 03:28:41+00:00
slug: seting-up-an-ldap-address-book-on-ubuntu
title: Seting up an LDAP address book on Ubuntu
wordpress_id: 24
categories:
- Other-Tech
tags:
- Email
- LDAP
- Ubuntu
---

Quick and dirty on installing OpenLDAP as an addressbook server.



	
  * install



    
     sudo aptitude install slapd ldap-utils





	
  * configure (if needed)



    
     sudo dpkg-reconfigure -plow slapd





	
  * edit /etc/ldap/slapd.conf


<!-- more -->

    
     #include         /etc/ldap/schema/nis.schema
     suffix          "dc=snowfrog, dc=net"
     rootdn          "cn=admin,dc=snowfrog,dc=net"
     rootpw          secret





	
  * edit /etc/ldap/ldap.conf



    
     $ cat ldap.conf
     HOST    127.0.0.1
     BASE    dc=snowfrog,dc=net
     URI     ldap://localhost





	
  * check working



    
     ldapsearch -x





	
  * create a file that creates address book OU, and import



    
     $ cat foo
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
     $ ldapadd -x -W -D 'cn=admin,dc=snowfrog, dc=net' -f foo -H "ldap://sandia.snowfrog.net"





	
  * in Thunderbird, export addresses to addr.ldif, then convert dumped address book to importable format



    
     sed 's/^givenName:/displayName:/; /mozillaAbPersonObsolete/d; /modifytimestamp:/d; /dn:
     cn=/s/mail=.*/ou=addressbook,dc=snowfrog,dc=net/' addr.ldif > addr2.ldif





	
  * convert .muttrc aliases



    
     sed -n '/^alias/p' .muttrc | awk '$2 !~ /^z/ {print "#commentndn: cn=" $2
     ",ou=addressbook,dc=snowfrog,dc=netncn: " $2 "nsn: " $2 "nmail: " $3 "ndisplayName: " $2
     "nobjectClass: topnobjectClass: personnobjectClass: organizationalPersonnobjectClass:
     inetOrgPersonn"  }' > /etc/ldap/addr2.ldif





	
  * import to OpenLDAP server



    
     ldapadd -c -x -W -D 'cn=admin,dc=snowfrog, dc=net' -f addr2.ldif -H "ldap://sandia.snowfrog.net"





	
  * connect to LDAP server using Evolution; Thunderbird doesn't have enough options


