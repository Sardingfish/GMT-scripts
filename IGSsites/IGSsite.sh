#!/bin/bash
# Purpose:Plot IGS sites in World
# Author :  Ding Junsheng
# Date   :  2019-08-01

sitefile=IGSNetwork.txt
gmt begin IGSsites png 
gmt coast -R-180/180/-90/90 -JQ180/10i -Gseashell -Sskyblue -Wthinnest -Dc -Ba30f15 
awk '{print $3,$2,0.2}' $sitefile | gmt plot -Sc -Gblue
gmt end
