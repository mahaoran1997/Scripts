#! /bin/bash


## Close ramdisk
sudo swapoff /dev/ram0


## Remove ramdisk module
sudo modprobe -r brd

