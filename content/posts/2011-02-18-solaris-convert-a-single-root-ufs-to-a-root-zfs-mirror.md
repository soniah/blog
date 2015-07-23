---
title: Solaris – convert a single root UFS to a root ZFS mirror
author: Sonia Hamilton
date: 2011-02-18
url: /2011/02/18/solaris-convert-a-single-root-ufs-to-a-root-zfs-mirror/
categories:
  - Other-Tech
tags:
  - Solaris
---
**Scenario**: the current Solaris Sparc system is booting off a single UFS disk (eg when cloned from an image).

<!--more-->

You want to convert to a ZFS mirror**.** Assumes that ZFS is already supported; if not install the ZFS package first. See also:

  * Managing ZFS Boot Environments with Solaris Live Upgrade, in [Solaris 10 ZFS Essentials][1]
  * [Notes on OpenSolaris: ZFS boot mirror][2]
  * [HOWTO: Migrate a UFS Root Filesystem to ZFS][3]

**Connect** to the console, login, examine the disk layout:

<pre>-&gt; start /SP/console

root@foo # uname -a
SunOS foo 5.10 Generic_142900-11 sun4v sparc SUNW,Sun-Blade-T6320

root@foo # mount | fgrep '/dev/dsk'
/ on /dev/dsk/c0t0d0s0 read/write/setuid/devices/intr/largefiles/logging/xattr/onerr
or=panic/dev=800008 on Thu Feb 17 12:04:28 2011

root@foo # echo | format
Searching for disks...done
AVAILABLE DISK SELECTIONS:
       0. c0t0d0
          /pci@0/pci@0/pci@2/LSILogic,sas@0/sd@0,0
       1. c0t1d0
          /pci@0/pci@0/pci@2/LSILogic,sas@0/sd@1,0
Specify disk (enter its number): Specify disk (enter its number):</pre>

So on this system, / is currently mounted on target 0 (c0t0d0). We want to zfs mirror onto target 1 (c0t1d0), and allow booting from both drives.

**Clear** the current partition table on target 1, and create partition 0 covering the whole disk. **Label **the disk as SMI (ie traditional Solaris VTOC. EFI labels are not supported for boot disks).

<pre>format -e
Specify disk (enter its number): 1
selecting c0t1d0
format&gt; p
(etc)
format&gt; label
[0] SMI Label
[1] EFI Label
Specify Label type[1]: 0
format&gt;</pre>

**Create ** the new zfs pool:

<pre>root@foo # zpool create rpool c0t1d0s0</pre>

**Create ** the zfs boot environment:

<pre>root@foo # lucreate -n zfsBE -p rpool
Analyzing system configuration.
...
Populating contents of mount point .
Copying.</pre>

**Check **the results:

<pre>root@foo # lustatus
Boot Environment           Is       Active Active    Can    Copy
Name                       Complete Now    On Reboot Delete Status
-------------------------- -------- ------ --------- ------ ----------
be0                        yes      yes    yes       no     -
be3                        yes      no     no        yes    -
zfsBE                      yes      no     no        yes    -</pre>

**Activate **the environment and reboot:

<pre>root@foo # luactivate zfsBE
A Live Upgrade Sync operation will be performed on startup of boot environment .
**********************************************************************
The target boot environment has been activated. It will be used when you
reboot. NOTE: You MUST NOT USE the reboot, halt, or uadmin commands. You
MUST USE either the init or the shutdown command when you reboot. If you
do not use either init or shutdown, the system will not boot using the
target BE.
**********************************************************************

In case of a failure while booting to the target BE, the following process
needs to be followed to fallback to the currently working boot environment:

1. Enter the PROM monitor (ok prompt).

2. Change the boot device back to the original boot environment by typing:

     setenv boot-device /pci@0/pci@0/pci@2/LSILogic,sas@0/disk@0,0:a

3. Boot to the original boot environment by typing:

     boot

**********************************************************************

Modifying boot archive service
Activation of boot environment  successful.

root@foo # init 6</pre>

After rebooting, you should see your new zfs root environment:

<pre>root@foo # zfs list
NAME               USED  AVAIL  REFER  MOUNTPOINT
rpool             16.1G   258G    98K  /rpool
rpool/ROOT        10.0G   258G    21K  /rpool/ROOT
rpool/ROOT/zfsBE  10.0G   258G  10.0G  /
rpool/dump        2.00G   258G  2.00G  -
rpool/swap        4.01G   262G    16K  -

root@foo # zpool status
  pool: rpool
 state: ONLINE
 scrub: none requested
config:

        NAME        STATE     READ WRITE CKSUM
        rpool       ONLINE       0     0     0
          c0t1d0s0  ONLINE       0     0     0

errors: No known data errors</pre>

As you can see, rpool only contains one hard disk (c0t1d0s0).** Delete **the old boot environments, otherwise format will complain:

<pre>root@foo # lustatus
Boot Environment           Is       Active Active    Can    Copy
Name                       Complete Now    On Reboot Delete Status
-------------------------- -------- ------ --------- ------ ----------
be0                        yes      no     no        yes    -
be3                        yes      no     no        yes    -
zfsBE                      yes      yes    yes       no     -
root@foo # ludelete be0
...
root@foo # ludelete be3
Determining the devices to be marked free.
Updating boot environment configuration database.
Updating boot environment description database on all BEs.
Updating all boot environment configuration databases.
Boot environment  deleted.</pre>

**Repartition **and mirror onto the original hard disk. Notice that the current ZFS root disk is the first argument in the attach command, and the old boot disk is the second argument. Use -f when it complains about an existing UFS filesystem:

<pre>root@foo # format -e
(repartition, relabel as SMI, etc)

root@foo # zpool status
  pool: rpool
 state: ONLINE
 scrub: none requested
config:

        NAME        STATE     READ WRITE CKSUM
        rpool       ONLINE       0     0     0
          c0t1d0s0  ONLINE       0     0     0

errors: No known data errors

root@foo # zpool attach -f rpool c0t1d0s0 c0t0d0s0
Please be sure to invoke installboot(1M) to make 'c0t0d0s0' bootable.
Make sure to wait until resilver is done before rebooting.

root@foo # zpool status rpool
  pool: rpool
 state: ONLINE
status: One or more devices is currently being resilvered.  The pool will
        continue to function, possibly in a degraded state.
action: Wait for the resilver to complete.
 scrub: resilver in progress for 0h1m, 11.50% done, 0h11m to go
config:

        NAME          STATE     READ WRITE CKSUM
        rpool         ONLINE       0     0     0
          mirror      ONLINE       0     0     0
            c0t1d0s0  ONLINE       0     0     0
            c0t0d0s0  ONLINE       0     0     0  1.38G resilvered

errors: No known data errors

root@foo # zpool status rpool
...
 scrub: resilver completed after 0h11m with 0 errors on Fri Feb 18 14:31:09 2011
...
            c0t0d0s0  ONLINE       0     0     0  12.0G resilvered</pre>

**Make bootable** off target 0, and confirm:

<pre>root@foo # installboot /usr/platform/`uname -i`/lib/fs/zfs/bootblk /dev/rdsk/c0t0d0s0
root@foo # init 0
...
svc.startd: 104 system services are now being stopped.
...
{0} ok devalias
...
disk1                    /pci@0/pci@0/pci@2/@/disk@1
disk0                    /pci@0/pci@0/pci@2/@/disk@0
disk                     /pci@0/pci@0/pci@2/@/disk@0
...

{0} ok boot disk0
Boot device: /pci@0/pci@0/pci@2/@/disk@0  File and args:
SunOS Release 5.10 Version Generic_142900-11 64-bit
...
root@foo # init 0
...
svc.startd: 104 system services are now being stopped.
...
{0} ok boot disk1
...
Boot device: /pci@0/pci@0/pci@2/@/disk@1  File and args:
SunOS Release 5.10 Version Generic_142900-11 64-bit
...
</pre>

 [1]: http://www.amazon.com/Solaris-ZFS-Essentials-Scott-Watanabe/dp/0137000103/ref=sr_1_1?ie=UTF8&s=books&qid=1297915131&sr=1-1
 [2]: http://www.castro.aus.net/~maurice/opensolaris/zfsbootmirror.html
 [3]: http://lildude.co.uk/howto-migrate-a-ufs-root-filesystem-to-zfs
