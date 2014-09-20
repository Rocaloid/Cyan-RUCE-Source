shi.rudb1 : shi.wav
	  genrudb shi.wav -t 8776 -V
	@ mv shi.rudb shi.rudb1

sao.rudb1 : sao.wav
	  genrudb sao.wav -V -u 300 -l 230
	@ mv sao.rudb sao.rudb1

fei.rudb : fei.rudb1
	@ cp fei.rudb1 fei.rudb
	  editrudb param fei.rudb -r 1.048

m%.rudb : m%.rudb1
	@ cp m$*.rudb1 $@
	  editrudb notchnoise $@ -h 0 -s 0.03 -r 0.07

b%.rudb : b%.rudb1
	@ cp b$*.rudb1 $@

d%.rudb : d%.rudb1
	@ cp d$*.rudb1 $@
	  editrudb notchnoise $@ -h 0.3

#[Do not modify] Generic post-processing
%.rudb : %.rudb1
	@ cp $*.rudb1 $@
	  editrudb notchnoise $@ -h 0.1

%.rudb1 : %.wav
	  genrudb $*.wav -V
	@ mv $*.rudb $@

