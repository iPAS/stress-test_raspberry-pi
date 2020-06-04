# stress-test\_raspberry-pi

Scripts for testing the Raspberry-Pi


# Commands

* To check UART pin:

```bash
dtoverlay -h uart0

raspi-gpio get
```


# Note on Setup

* Disable the Agetty that captures /dev/serial0 via command:

```bash
sudo systemctl disable serial-getty@ttyAMA0.service
```
