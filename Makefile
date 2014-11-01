RecList = $(shell cat src/reclist.txt)
WavList = $(RecList:%=%.wav)
RUDBList = $(RecList:%=%.rudb)

.SECONDARY:

.PHONY : soundbank
soundbank : $(RUDBList)
	@ echo "Soundbank successfully built."

.PHONY : soundbank.utau
soundbank.utau : $(RUDBList) oto.ini
	@ echo "Soundbank successfully built."

include src/postmakes.make

include src/premakes.make

oto.ini : $(WavList)
	@ if [ -f src/oto.ini ]; then \
		echo "Oto found under src/"; \
		cp src/oto.ini oto.ini; \
	else \
		if [ -f oto.ini ]; then rm oto.ini; fi; \
		echo "Generating oto.ini..."; \
		for i in *.rudb; do \
	    	proberudb -u $$i >> oto.ini; \
		done; \
	fi

src/%.pre :
	@ touch $@

sound.wav : | src/sound.ogg
	sox src/sound.ogg sound.wav
	rsegment sound.wav src/label.txt src/reclist.txt
	@ mv sound.wav sound.wxx
	@ for i in *.wav; do \
		mv $$i $$i'1'; \
	  done
	@ mv sound.wxx sound.wav

.PHONY : install
install : $(RUDBList)
	@ echo "Moving files..."
	@ mkdir build -p
	@ cp *.rudb build/ -u
	@ cp src/PitchModel.json build/ -u
	@ echo "Soundbank generated in 'build' directory."

.PHONY : install.utau
install.utau : $(RUDBList) oto.ini
	@ echo "Moving files..."
	@ mkdir build -p
	@ cp oto.ini build/ -u
	@ cp *.rudb build/ -u
	@ cp src/PitchModel.json build/ -u
	@ echo "UTAU Soundbank generated in 'build' directory."

.PHONY : install.utauall
install.utauall : $(RUDBList) oto.ini
	@ echo "Moving files..."
	@ mkdir build -p
	@ cp oto.ini build/ -u
	@ cp *.rudb build/ -u
	@ cp *.wav build/ -u
	@ cp src/PitchModel.json build/ -u
	@ echo "Complete UTAU Soundbank generated in 'build' directory."

.PHONY : clean
clean :
	@ -rm -f *.wav*
	@ -rm -f *.ini*
	@ -rm -f *.rudb*
	@ -rm -f *.json*
	@ -rm -f *~
	@ -rm -rf build
	@ echo "All target and intermediate files are removed."

