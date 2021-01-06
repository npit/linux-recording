#!/usr/bin/env bash
pasuspender qjackctl &
sleep 1
while [ -z $(pgrep jackd) ]; do
    echo "Waiting to enable the jack daemon..."
    sleep 1
done
echo "Found jack daemon: $(pgrep -a jackd)"

# create jack sink (need to execute only once), required for system audio play while jack is active:
# apt : pulseaudio-module-jack
# pacman: pulseaudio-jack

# pacmd load-module module-null-sink sink_name=jack_out
# pacmd update-sink-proplist MySink device.description=jack_out
# pacmd load-module module-loopback sink=jack_out
pactl load-module module-jack-sink channels=2; pactl load-module module-jack-source channels=2; pacmd set-default-sink jack_out

# guitarix &
# disown
# tuxguitar &
# disown
