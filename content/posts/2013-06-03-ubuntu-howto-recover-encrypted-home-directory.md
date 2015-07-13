---
author: sonia
date: 2013-06-03
url: /2013/06/03/ubuntu-howto-recover-encrypted-home-directory/
title: Ubuntu - HowTo Recover Encrypted Home Directory
categories:
- Linux
tags:
- Ubuntu
---

There are many pages out there discussing how to recover an Ubuntu encrypted home directory (see also below).

<!--more-->

These are merely notes for my future reference; they need tidying at there may be errors/mis-attributions in it.

Start by booting from an Ubuntu Live CD.

## Passwords

Three different "passwords" are referred to when recovering:

* boot password ie the password used when your laptop is first booted and the partitions are decrypted
* user password ie your unix account password
* mount password - will look something like f0bddb4c533fddb2c89e890098ed65d1. The one that you didn't write down when prompted to do so... See [Recovering Your Mount Passphrase](https://help.ubuntu.com/community/EncryptedPrivateDirectory#Recovering_Your_Mount_Passphrase)

## Partitions and Disk Layout

If you selected the default Ubuntu encryption setup, the partitions will
be laid out like this:

{{< highlight bash >}}
/dev/sda1 * 2048 499711 248832 83 Linux
/dev/sda2 501758 976771071 488134657 5 Extended
/dev/sda5 501760 976771071 488134656 83 Linux
{{< /highlight >}}

* /dev/sda1 contains /boot ie kernel and grub
* /dev/sda5 is an encrypted partition (`crypto_LUKS`) that contains
    LVM. The Logical Volumes will be for /root, /home and swap. /home
    will be encrypted with a second level of encryption if you chose
    "encrypt home directory" during installation.

## Mounting Encrypted LVM Partition

* confirm /dev/sda5 is the correct partition [1]:

{{< highlight bash >}}
cryptsetup -v luksDump /dev/sda5
{{< /highlight >}}

* mount the encrypted partition containing the LVM volumes:

{{< highlight bash >}}
cryptsetup -v luksOpen /dev/sda5 sda5_crypt
vgdisplay
{{< /highlight >}}

(you may need to rename the volume group using vgchange if it conflicts with an existing one. A good motivation for using different VG names on each machine)

{{< highlight bash >}}
lvdisplay | less
mkdir /mnt/home
mount -t ext4 /dev/vg/home /mnt/home
{{< /highlight >}}

## Mounting Encrypted Home, LUKS vs eCryptfs

The partition was encrypted with LUKS, and /home will be encrypted with a second level of encryption (eCryptfs) if you chose "encrypt home directory" during installation.

Note for future installs: you'd only want to have both if multiple people were using the same machine. Otherwise use only LUKS especially for laptops; eCryptfs is an extra hurdle during recovery and doesn't give extra security. Also, using only LUKS is more secure than only encrypting your home directory using eCryptfs:

* it will encrypt other things beside /home eg swap, /tmp
* you'll only type in your long LUKS passphrase occasionally (ie at reboot), whereas the eCryptfs password will be typed in every time you login or unlock the screen ie will be more vulnerable to shoulder-surfing, and more likely to be too short

However, eCryptfs does have some advantages (http://www.privacydusk.com/tag/ecryptfs-vs-luks/):

* All the cryptographic metadata is stored in the header of the file. This means that the encrypted file can be copied and moved from one location to another not leaving any metadata behind
* Files can be encrypted with multiple keys so that multiple different users can have access to encrypted but shared files. You can have different files encrypted by different users and each user can access only his files


## Automated Approach [2]


* "remount" /mnt/home on home:
{{< highlight bash >}}
umount /mnt/home
mount -t ext4 /dev/vg/home /home
# add a user with the same name as the broken system
adduser --no-create-home sonia
su sonia
ecryptfs-mount-private
{{< /highlight >}}

## Manual Approach [3]

The Ubuntu documentation on EncryptedPrivateDirectory has lots of
information [4]. These commands are copied from there, in case the page
moves or disappears.

{{< highlight bash >}}
sudo ecryptfs-add-passphrase --fnek
{{< /highlight >}}

Passphrase: (Enter the mount passphrase you recorded when you setup the mount--this passphrase is different from your login passphrase.)

You should now get two lines looking like this:

Inserted auth tok with sig [9986ad986f986af7] into the user session keyring

Inserted auth tok with sig [76a9f69af69a86fa] into the user session keyring (write down the second value in the square brackets)

{{< highlight bash >}}
mkdir /mnt/Private
mount -t ecryptfs /mnt/home/sonia/.Private /mnt/Private
{{< /highlight >}}

Selection: 3 (use a passphrase key type)

Passphrase: (Enter the mount passphrase you recorded when you setup the mount--this passphrase is different from your login passphrase.)

Selection: aes (use the aes cipher)

Selection: 16 (use a 16 byte key)

Enable plaintext passthrough: n

Enable filename encryption: y (This and the following options only apply if you are using filename encryption)

Filename Encryption Key (FNEK) Signature: (the value you wrote down from
the second line above)


## See Also

* [1] http://blog.miketoscano.com/?p=72
* [2] http://goshawknest.wordpress.com/2010/04/16/how-to-recover-crypted-home-directory-in-ubuntu/
* [3] https://help.ubuntu.com/community/EncryptedPrivateDirectory
* [4] https://help.ubuntu.com/community/EncryptedPrivateDirectory#Recovering_Your_Data_Manually
