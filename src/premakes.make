#Example for specific pre-processing procedures
p%.wav : sound.wav p%.wav.1 src/p.pre
	@ sh src/p.pre p$*

liao.wav : sound.wav liao.wav.1 src/liao.pre
	@ sh src/liao.pre

#[Do not modify] Generic pre-processing
%.wav : sound.wav %.wav.1
	@ cp $@.1 $@

