#Example for specific pre-processing procedures
p%.wav : sound.wav p%.wav.1 src/p.pre
	@ sh src/p.pre p$*

#[Do not modify] Generic pre-processing
%.wav : sound.wav %.wav.1
	@ cp $@.1 $@

