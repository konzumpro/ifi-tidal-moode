#!/bin/bash

export LD_LIBRARY_PATH=$PWD/lib
DEVICE="USB Audio DAC: - (hw:1,0)"
./bin/tidal_connect_application \
	--tc-certificate-path "./id_certificate/IfiAudio_ZenStream.dat" \
	--netif-for-deviceid eth0 \
	-f "DAC" \
	--codec-mpegh true \
	--codec-mqa false \
	--model-name "iFi Streamer" \
	--disable-app-security false \
	--disable-web-security false \
	--enable-mqa-passthrough false \
	--playback-device "$DEVICE" \
	--log-level 1 
