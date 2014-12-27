make
if [ ! -e text8 ]; then
  wget http://mattmahoney.net/dc/text8.zip -O text8.gz
  gzip -d text8.gz -f
fi
#time ./word2vec -train text8 -output vectors.bin -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 12 -binary 1 -iter 15
time ./word2vec -train text8 -output vectors.bin -cbow 1 -size 200 -window 8 -negative 0 -hs 1 -sample 1e-4 -threads 4 -binary 1 -iter 15 -rebuild 1
./compute-accuracy vectors.bin 30000 < questions-words.txt
#./compute-accuracy vectors.bin < questions-words.txt
# to compute accuracy with the full vocabulary, use: ./compute-accuracy vectors.bin < questions-words.txt
