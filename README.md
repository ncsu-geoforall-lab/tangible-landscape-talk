NCSU GeoForAll Lab Tangible Landscape talks
===========================================

 * https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/geoforall-webinar.html
 * https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/cbi-webinar.html
 * https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/ncgis2017.html
 * https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/EDRA_2017.html
 * https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/worldbank2017.html
 * https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/ICC_2017.html
 * https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/FOSS4G_2017.html

Building and publishing pages for this repository
-------------------------------------------------

Clone the repository::

    git clone ...

Navigate to the first clone and build pages::

    ./build.sh

To add new presentation, create new HTML file and edit `./build-slides.py`.

To publish your changes, do:

    git add ...
    git commit -am "new slides explaining the project"
    git push
    ./publish.sh

About the slides
----------------

Presentation is using on Reveal.js HTML Presentation Framework.

 * http://lab.hakim.se/reveal-js/#/
 * https://github.com/hakimel/reveal.js/

License
-------

The presentation text and images are under the CC BY-SA 4.0 license.

Note that many things are linked material, logos, data, fonts, styles
from different sources which may have different licenses.
