#!/bin/bash
# Purpose:Plot Satellite Tracks of BDS
# Author :  Ding Junsheng
# Date   :  2019-08-02

sitefile=tracks.dat
gmt begin SatTracks png 
gmt coast -R-180/180/-90/90 -JQ180/10i -Gseashell -Sskyblue -Wthinnest -Dc -Ba30f15 

# IGSO
awk '{print $1+118.5,$2,0.05}' $sitefile | gmt plot -Sc -Gblue
awk '{print $1+119,$2,0.05}' $sitefile | gmt plot -Sc -Gblue
awk '{print $1+117,$2,0.05}' $sitefile | gmt plot -Sc -Gblue
awk '{print $1+94,$2,0.05}' $sitefile | gmt plot -Sc -Gblue
awk '{print $1+96,$2,0.05}' $sitefile | gmt plot -Sc -Gblue

# GEO
gmt plot -Ss0.2c -W0.5p,red,solid -Gred << EOF
140.00 0.00 30 0.2 0.4
80.00 0.00
110.50 0.00
160.00 0.00
58.75 .0.00
EOF

# add text
gmt text -F+f12p,1,black+jTL -D-0.15c/-0.15c << EOF
140.00 0.00 G1
80.00 0.00 G2
110.50 0.00 G3
160.00 0.00 G4
58.75 .0.00 G5
EOF

gmt end
