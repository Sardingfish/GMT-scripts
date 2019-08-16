########################################################################## 
# File Name: pcolor.sh 
# Author: Ding Junsheng 
# mail: 760837268@qq.com 
# Created Time: Mon 12 Aug 2019 06:41:26 PM CST 
######################################################################### 
R=-179.9/179.9/-89.9/89.9 
J=Q15c
datafiles=eveg.prn 
grdfile=hv_re.grd 
cptfile=hv_re.cpt 
PSfile=topo.ps 

gmt surface  $datafiles -G$grdfile -R$R -I10m 

# head 
gmt psxy -J$J -R$R -T -K > $PSfile 

# make cptfile 
gmt makecpt -Crainbow -T0/5300/20 -Z > $cptfile

# http://modules.gmt-china.org/grdimage.html?highlight=grdimage
gmt grdimage $grdfile -R$R -J$J -C$cptfile -B30WSen -K -P -O >> $PSfile

# add coase
gmt pscoast -R$R -J$J -N1/0.25p -W1/0.25p -K -P -O >> $PSfile

# colorbar
gmt psscale -C$cptfile -Ba1000f500/:'(m)': -D15.5/3.7/7.4/0.15 -K -P -O >>$PSfile

# tail
gmt psxy -J$J -R$R -T -O >> $PSfile

# save as pic
gmt psconvert $PSfile -Tjg -P -E300 -A
