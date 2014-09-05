RecList = $(shell cat src/reclist)
WavList = $(RecList:%=%.wav)
RUDBList = $(RecList:%=%.rudb)

.SECONDARY:

.PHONY : soundbank
soundbank : $(RUDBList) Roto.json oto.ini
	@ echo "Soundbank successfully built."

include src/postmakes.make

%.rudb.1 : %.wav | Roto.json
	  genrudb Roto.json -V -q -n $*
	@ mv $*.rudb $@

include src/premakes.make

oto.ini : Roto.json $(WavList)
	@ if [ -f src/oto.ini ]; then	\
		echo "Oto found under src/"; \
		cp src/oto.ini oto.ini; \
	else \
		echo "roto2oto Roto.json"; \
		roto2oto Roto.json; \
	fi

src/%.pre :
	@ touch $@

%.wav.1 :
	@ echo ""

sound.wav : | src/sound.ogg Roto.json
	sox src/sound.ogg sound.wav
	rsegment sound.wav src/label src/reclist
	wavnorm Roto.json -g 1.5 -i -40 -t -s 0.01 -e 0.01
	@ mv sound.wav sound.wxx
	@ for i in *.wav; do mv $$i $$i.1; done
	@ mv sound.wxx sound.wav

Roto.json : src/reclist
	genroto src/reclist

.PHONY : install
install:
	@ echo "Moving files..."
	@ mkdir build
	@ cp Roto.json build/Roto.json
	@ cp oto.ini build/
	@ cp *.rudb build/
	@ cp *.wav build/
	@ echo "Soundbank generated in 'build' directory."

.PHONY : clean
clean :
	@ -rm -f *.wav*
	@ -rm -f *.ini*
	@ -rm -f *.rudb*
	@ -rm -f *.json*
	@ -rm -f *~
	@ -rm -rf build
	@ echo "All target and intermediate files are removed."

