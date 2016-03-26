#!/bin/bash
FSWEB=$(dpkg -l | grep fswebcam)
if [ -z "$FSWEB" ]; then
  sudo apt-get install fswebcam
fi
R=('320x240' '640x480' '1024x768')
echo ""
echo "1. ${R[0]}"
echo "2. ${R[1]}"
echo "3. ${R[2]}"
echo ""
echo -n "Select the screen resolution: "; read -n 1 SCREEN
echo ""
echo -n "Enter the number of frames: "; read -n 1 FRAMES
echo ""
echo -n "Enter the delay between frames (sec): "; read -n 1 DELAY
echo ""
F=0
OPT=$(($SCREEN - 1))
RES=$(echo ${R[$OPT]})
while [[ $F < $FRAMES ]]; do
  F=$(($F + 1))
  IMAGE="$(date +"%Y-%m-%d_%H:%M:%S")($F).jpg"
  fswebcam -r $RES $IMAGE
  if [[ $DELAY > 0 ]]; then
    sleep $DELAY
  fi
done
