#Example for specific pre-processing procedures
p%.wav : sound.wav p%.wav.1 src/p.pre
	@ sh src/p.pre p$*

liao.wav : sound.wav liao.wav.1 src/liao.pre
	@ sh src/liao.pre

mei.wav : sound.wav mei.wav.1 src/mei.pre
	@ sh src/mei.pre

#[Do not modify] Generic pre-processing
%.wav : sound.wav %.wav.1
	@ cp $@.1 $@

