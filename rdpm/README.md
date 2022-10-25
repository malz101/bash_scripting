# RDPM
RDPM is a utility that allows you to manage the Runtime Device Power Management of the NVIDIA GPU and the Intel audio and vga controller devices, on NVIDIA Optimus laptops. It provides the management of these devices using the [sysfs](https://man7.org/linux/man-pages/man5/sysfs.5.html) filesystem interface.
<br>
<br>

# INSTALLATION
IMPORTANT: Please make sure you have the NVIDIA proprietary drivers installed.

Download "rdpm_config" and place in "/usr/local/bin/" directory, to make the executable accessible as a command system wide.
```console
sudo wget -O /usr/local/bin/rdpm https://raw.githubusercontent.com/malz101/bash_scripting/main/rdpm/rdpm && sudo chmod 755 /usr/local/bin/rdpm
```

Download "90-nvidia-udev-pm-G05.rules" and place in the "/etc/udev/rules.d/" directory, to automatically setup NVIDIA GPU for runtime power management, at boot.
```console
sudo wget -O /etc/udev/rules.d/90-nvidia-udev-pm-G05.rules https://raw.githubusercontent.com/malz101/bash_scripting/main/rdpm/90-nvidia-udev-pm-G05.rules
```
<br>

# CONFIGURATION
Run the command below to get the domain, bus number, device number and function number for each PCI device:
```console
sudo lspci -D
```
Edit the following lines in the "rdpm" script located in /usr/local/bin to include the domain bus number, device number and function number corresponds to the devices on your laptop. The domain should be the same as in the script


```console
nvidia_vga_controller_pci_device="<domain>:<bus number>:<device number>.function_number"     #NVIDIA VGA Controller device
nvidia_audio_device_pci_device="<domain>:<bus number>:<device number>.function_number"       #NVIDIA Audio device
intel_vga_controller_pci_device="<domain>:<bus number>:<device number>.function_number"      #Intel VGA Controller device
intel_audio_device_pci_device="<domain>:<bus number>:<device number>.function_number"        #Intel Audio device device

```
<br> 

# UNINSTALL 
```console
sudo rm -f /usr/local/bin/rdpm 90-nvidia-udev-pm-G05.rules
```
<br>

# DISCLAIMER
1. Proprietary NVIDIA driver was downloaded from the openSUSE official repo.
2. Only tested on openSUSE LEAP 5.14.21-150400.24.18-default.  
<br>

# FUTURE IMPROVEMENTS
1. Add options in the script to display information from the following file:
    
    ```console
        "/proc/driver/nvidia/gpus/0000\:01\:00.0/information"
        "/proc/driver/nvidia/gpus/0000\:01\:00.0/power"
        "/proc/driver/nvidia/gpus/0000\:01\:00.0/registry"
    ```

2. Include functionality to manage runtime D3 power management can be enabled for each PCI function.
    Currently, it only retrieves information on the status for runtime D3 power management of each device.  

3. Expand script so that it includes capabilties to manage the runtime D3 power management of all compatible PCI device.