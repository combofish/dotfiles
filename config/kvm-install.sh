#!/bin/sh
# author:combofish
# email:combofish49@gmail.com 
# Filename: kvm-install.sh

qemu-img create -f qcow2 /var/lib/libvirt/images/win10_2.qcow2 120G

virt-install --virt-type kvm  \
	     --name windwos10-node2   \
	     --memory 4096  \
	     --vcpus 1  \
	     --disk path=/var/lib/libvirt/images/win10_2.qcow2 \
	     --cdrom /home/larry/Share/Windows.iso \
	     --boot cdrom \
	     --network=default \
	     --os-type=windows \
	     --noautoconsole
