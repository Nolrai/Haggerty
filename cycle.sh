cabal run && \
arduino-cli compile --build-cache-path Uno/BuildCache/ --build-path Uno/Build \
  -b arduino:renesas_uno:minima -p COM4 -u --warnings all .
