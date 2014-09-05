#Insert rules below for specific post-processing

#[Do not modify] Generic post-processing
%.rudb : %.rudb.1
	@ cp $*.rudb.1 $@

#Insert rules below for specific rudb generation
shi.rudb.1 : shi.wav | Roto.json
	  genrudb Roto.json -n shi -t 8776 -Vq
	@ mv shi.rudb shi.rudb.1

