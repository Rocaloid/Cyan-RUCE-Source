shi.rudb1 : shi.wav
	  genrudb shi.wav -t 0.2 -V
	@ mv shi.rudb shi.rudb1

sao.rudb1 : sao.wav
	  genrudb sao.wav -V -u 300 -l 230
	@ mv sao.rudb sao.rudb1

qie.rudb1 : qie.wav
	  genrudb qie.wav -V -t 0.152
	@ mv qie.rudb qie.rudb1

ka.rudb1 : ka.wav
	  genrudb ka.wav -t 0.088 -V
	@ mv ka.rudb ka.rudb1

zhe.rudb1 : zhe.wav
	  genrudb zhe.wav -a 0 -V
	@ mv zhe.rudb zhe.rudb1

zhi.rudb1 : zhi.wav
	  genrudb zhi.wav -a 0 -V
	@ mv zhi.rudb zhi.rudb1

fei.rudb : fei.rudb1
	@ cp fei.rudb1 fei.rudb
	  editrudb param fei.rudb -r 1.048
	  editrudb gainnoise fei.rudb -g 0.5

shou.rudb : shou.rudb1
	@ cp shou.rudb1 shou.rudb
	  editrudb param shou.rudb -r 0.9
	  editrudb gainnoise shou.rudb -g 0.5

gan.rudb : gan.rudb1
	@ cp gan.rudb1 gan.rudb
	  editrudb param gan.rudb -r 0.607
	  editrudb gainnoise gan.rudb -g 0.5

hao.rudb : hao.rudb1
	@ cp hao.rudb1 hao.rudb
	  editrudb param hao.rudb -r 0.64
	  editrudb gainnoise hao.rudb -g 0.5

hei.rudb : hei.rudb1
	@ cp hei.rudb1 hei.rudb
	  editrudb gainnoise hei.rudb -g 0.5

hui.rudb : hui.rudb1
	@ cp hui.rudb1 hui.rudb
	  editrudb gainnoise hui.rudb -g 0.5
	  editrudb param hui.rudb -r 0.69

wei.rudb : wei.rudb1
	@ cp wei.rudb1 wei.rudb
	  editrudb param wei.rudb -r 0.7 -l 0.126
	  editrudb gainnoise wei.rudb -g 0.5

m%.rudb : m%.rudb1
	@ cp m$*.rudb1 $@
	  editrudb notchnoise $@ -h 0.3 -s 0.03 -r 0.07
	  editrudb gainnoise $@ -g 0.5

b%.rudb : b%.rudb1
	@ cp b$*.rudb1 $@
	  editrudb gainnoise $@ -g 0.5

d%.rudb : d%.rudb1
	@ cp d$*.rudb1 $@
	  editrudb notchnoise $@ -h 0.5
	  editrudb gainnoise $@ -g 0.5

#[Do not modify] Generic post-processing
%.rudb : %.rudb1
	@ cp $*.rudb1 $@
	  editrudb notchnoise $@ -h 0.3
	  editrudb gainnoise $@ -g 0.5

%.rudb1 : %.wav
	  genrudb $*.wav -V
	@ mv $*.rudb $@

