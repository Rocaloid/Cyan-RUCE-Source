#Secondaries
hua.wav2 : hua.wav1
	@ cp hua.wav1 hua.wav2
	@ wavnorm hua.wav2 -g 1.5 -i -40 -t -s 0.005 -e 0.01
qi.wav2 : qi.wav1
	@ cp qi.wav1 qi.wav2
	@ wavnorm qi.wav2 -g 1.5 -i -40 -t -s 0.005 -e 0.01

#Final
p%.wav : p%.wav2 src/p.pre
	@ sh src/p.pre p$*

liao.wav : liao.wav2
	@ sox liao.wav2 liao.wav trim 0 0.922

mei.wav : mei.wav2
	@ sox mei.wav2 mei.wav trim 0.150

#[Do not modify] Generic pre-processing
%.wav2 : %.wav1
	@ cp $*.wav1 $@
	@ wavnorm $@ -g 1.5 -i -40 -t -s 0.01 -e 0.01

%.wav1 : sound.wav
	@

%.wav : %.wav2
	@ cp $*.wav2 $@

