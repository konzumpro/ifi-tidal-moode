# Tidal connect service raspberry/ARM based on ppy2/ifi-tidal-release

The repository includes dynamic libraries which were scraped from debian packages to facilitate the installation process.
The application has been tested on Moode audio OS, but it should also work on other distros.

## Prerequirements on current Moode (8.3.2 32 bit) install
``` 
sudo apt-get install libncursesw5 python3-pyaudio screen
```

## Test run
1. SSH to rPI:
``` 
ssh pi@moode.local
```

2. Download and unzip repository content:
```
wget -c "https://github.com/vcucek/ifi-tidal-moode/archive/refs/heads/master.zip" -O - | busybox unzip -
```

3. Navigate to folder:
```
cd ifi-tidal-moode-master
```

3. Configure playback audio device:
```
make
```

4. Run Tidal connect as sudo. For some reason the application is unable to open ALSA device stream as a reguar user.
```
sudo ./start.sh
```

## Install (run application as a service)
1. Configure playback output device:
```
sudo make
```
3. Copy repository content to the "/opt/tidal-connect" folder, configure systemd unit and start a Tidal connect service:
```
sudo make install
```

## TODO:
Remove duplicated libraries from 'lib' folder.  
Testing with DAC w hardware volume control.  
Software volume with asound.conf softvol workaround if possible.  
