# J_Kiosk
## How To Use
```bash
j_kiosk enable
j_kiosk start
#if necessary, sudo reboot
```


## About This File & Directory
This file and directory contains what I have configured on the Raspberry Pi OS. It includes files and aliases to other system files. This file describes the usage of each file.


### kiosk.service
Kiosk service file (kiosk.service) has information about kiosk mode such as the environment as well as where the kiosk.sh file is
There is also an alias in this directory.

### kiosk.sh
Kiosk shell file has configuration about the 

### ~/.bashrc
Calls the j_rc.sh

### j_rc.sh
Has custom commands to make command line kiosk management easier such as `j_kiosk`
