# prereq
- imagemagic `scoop install imagemagick`

# ideas:
[ ] pass the desired eg month as a parameter: 2012.05  
[x] don't do conversion if folder already exists

# benchmark
 magick -bench 8 TEST.JPG -resize 2222x2222 -sampling-factor 4:2:0 -strip -quality 85 -interlace JPEG -colorspace RGB null: