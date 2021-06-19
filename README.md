# stress-test\_raspberry-pi

Scripts for testing the Raspberry-Pi


<!-- ---------------------------------------------------- -->
## Commands

* To check UART pin:

```bash
dtoverlay -h uart0

raspi-gpio get
```


<!-- ---------------------------------------------------- -->
## Note on Setup

* Disable the Agetty that captures /dev/serial0 via the following command,
so that no mutual access on the device.

```bash
sudo systemctl disable serial-getty@ttyAMA0.service
sudo service serial-getty@ttyAMA0 stop
```



<!-- ---------------------------------------------------- -->
## General Initial Setup

It is not requirement but better-to-have.


### Raspi-config

1. Expand partition size fully.
2. 


### Git

1. > apt install git
2. > git config --global credential.helper store
3.


## Terminal

1. > apt install vim xterm
2. > export TERM=xterm --> ~/.profile
3. > xterm package --> _resize_

