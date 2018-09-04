# tboot
Trusted Boot (tboot) is an open source, pre- kernel/VMM module that uses Intel(R) Trusted Execution Technology (Intel(R) TXT) to perform a measured and verified launch of an OS kernel/VMM. 

Upstream: <http://sourceforge.net/projects/tboot>    
Source code mercurial repo: <http://hg.code.sf.net/p/tboot/code>

To use tboot on Intel TXT supported platforms, you need to:
1. Install tboot
2. Download SINIT.bin (ONLY needed for clients, NOT needed on server platforms)
3. Update grub
4. Reboot, choose booting through tboot
5. Verify tboot works or not

If no tboot package is available for installation, please try to build from source code by referring to wiki:
https://sourceforge.net/p/tboot/wiki/Home/    

## 1. Install tboot    
tboot can be installed through command line on RHEL/Fedora/Ubuntu/SUSE:    
RHEL: # yum install tboot    
Fedora: # dnf install tboot    
Ubuntu: # apt install tboot    
SUSE: # zipper in tboot    

## 2. Download SINIT.bin (ONLY needed for clients, NOT needed on server platforms)    
a) Find the right SINIT zip for your CPU: https://software.intel.com/en-us/articles/intel-trusted-execution-technology/    
b) Unzip it and put the SINIT.bin to /boot    

## 3. Update grub    
Way of updating grub is different depending on OS and its boot mode(legacy or EFI).

* Under Legacy mode, updating grub is simple:    
	"# grub2-mkconfig -o /boot/grub2/grub.cfg"

* Under EFI mode, updating grub is more complicated. 
Below are examples of updating EFI grub for RHEL/Fedora/Ubuntu/SUSE.    
    
    For Ubuntu:     
    "# grub2-mkconfig -o /boot/efi/EFI/ubuntu/grub.cfg"    
  
    For RHEL:      
    "# yum install grub2-efi-x64-modules"  
    download file create-grub-efi-RHEL.sh from here, then:    
    "# chmod 777 create-grub-efi-RHEL.sh"  
    "# ./create-grub-efi-RHEL.sh"    
    "# mv /boot/efi/EFI/redhat/grubx64.efi /boot/efi/EFI/redhat/grubx64.efi.bk"    
    "# cp grubx64.efi.new /boot/efi/EFI/redhat/grubx64.efi"   

    For Fedora:
    "# dnf install grub2-efi-x64-modules"    
    download file create-grub-efi-Fedora.sh from here, then:    
    "# chmod 777 create-grub-efi-Fedora.sh"    
    "# ./create-grub-efi-Fedora.sh"    
    "# mv /boot/efi/EFI/fedora/grubx64.efi /boot/efi/EFI/fedora/grubx64.efi.bk"    
    "# cp grubx64.efi.new /boot/efi/EFI/fedora/grubx64.efi"    

    For SUSE(SUSE Linux Enterprise Server, SLES):    
    "# zypper install grub2-efi-x64-modules"    
    download file create-grub-efi-SLES.sh from here, then:    
    "# chmod 777 create-grub-efi-SLES.sh"    
    "# ./create-grub-efi-SLES.sh"    
    "# mv /boot/efi/EFI/sles/grubx64.efi /boot/efi/EFI/sles/grubx64.efi.bk"    
    "# cp grubx64.efi.new /boot/efi/EFI/sles/grubx64.efi"    

## 4. Reboot, and choose "tboot 1.9.x" from grub.

## 5. Verify tboot works or not    
    After system booting up, run command below as root to show tboot status:    
    "# txt-stat"    

    tboot works fine if message below is there in txt-stat output:    
    "***********************************************************    
             TXT measured launch: TRUE    
             secrets flag set: TRUE    
    ***********************************************************"    

    tboot version could also be found:    
    "TBOOT: ******************* TBOOT *******************    
    TBOOT:    2018-08-30 18:00 +0800 1.9.7    
    TBOOT: *********************************************"    
