#Insert rules below for specific post-processing

#[Do not modify] Generic post-processing
%.rudb : %.rudb.1
	@ cp $*.rudb.1 $@

#Insert rules below for specific rudb generation
shi.rudb.1 : shi.wav
	  genrudb shi.wav -t 8776 -V
	@ mv shi.rudb shi.rudb.1

sao.rudb.1 : sao.wav
	  genrudb sao.wav -V -u 300 -l 230
	@ mv sao.rudb sao.rudb.1

