./copy-common-files.py --dst-dir=build

./build-slides.py --outdir=build \
    --outfile=foss4g-na-2016.html \
    foss4g-na-2016.html

./build-slides.py --outdir=build \
    --outfile=geoforall-webinar.html \
    geoforall-webinar.html

# make this presentation primary for convenience
cp build/geoforall-webinar.html build/index.html
