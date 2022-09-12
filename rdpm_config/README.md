# RDPM CONFIG
RDPM Config is a utility that allows you to manage the Runtime Device Power Management of the NVIDIA GPU and the Intel audio and vga controller devices, on NVIDIA Optimus laptops. It provides the management of these devices using the [sysfs](https://man7.org/linux/man-pages/man5/sysfs.5.html) filesystem interface.

# INSTALLATION
Download "rdpm_config" and place in "/usr/local/bin/" directory, to make the executable accessible as a command system wide.
```markdown
sudo wget -O /usr/local/bin/rdpm_config https://raw.githubusercontent.com/malz101/bash_scripting/main/rdpm_config/rdpm_config && sudo chmod 755 /usr/local/bin/rdpm_config
```

Download "90-nvidia-udev-pm-G05.rules" and place in the "/etc/udev/rules.d/" directory, to automatically setup NVIDIA GPU for runtime power management, at boot.
```markdown
sudo wget -O /etc/udev/rules.d/90-nvidia-udev-pm-G05.rules https://raw.githubusercontent.com/malz101/bash_scripting/main/rdpm_config/90-nvidia-udev-pm-G05.rules
```

# UNINSTALL 
```markdown
sudo rm -f /usr/local/bin/rdpm_config 90-nvidia-udev-pm-G05.rules
```

# FUTURE IMPROVEMENTS
1. Add options in the script to display information from the following file:
    
```markdown
    "/proc/driver/nvidia/gpus/0000\:01\:00.0/information"
    "/proc/driver/nvidia/gpus/0000\:01\:00.0/power"
    "/proc/driver/nvidia/gpus/0000\:01\:00.0/registry"
```

2. Include functionality to manage runtime D3 power management can be enabled for each PCI function.
    Currently, it only retrieves information on the status for runtime D3 power management of each device.