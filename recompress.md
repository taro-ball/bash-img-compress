# prereq
- imagemagic `scoop install imagemagick`

# ideas:
- pass the desired eg month as a parameter: 2012.05
- don't do conversion if folder already exists

# imagemagic
//resize image to width 25, keeping aspect ratio
convert -geometry 25x src/image1.png out/image1.png