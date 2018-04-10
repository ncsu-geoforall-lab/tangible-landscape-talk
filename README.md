NCSU GeoForAll Lab Tangible Landscape talks
===========================================
 * [USIALE_conference, April 2018, Chicago, Il](https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/USIALE_2018.html#/)
 * [GeoForAll Webinar](https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/geoforall-webinar.html)
 * [Conservation Biology Institute Webinar](https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/cbi-webinar.html)
 * [ACADIA, Nov 2017, Cambridge, MA](https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/ACADIA_2017.html)
 * [Foss4G, Aug 2016, Boston, MA](https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/FOSS4G_2017.html)
 * [World bank watershed symposium, June 2017, Washington D.C](https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/worldbank2017.html)
 * [ICC, Jul 2017, Washington D.C](https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/ICC_2017.html)
 * [EDRA conference, May 2017, Madison](https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/EDRA_2017.html)
 * [NCGIS conference, Feb 2017, Raleigh, NC](https://ncsu-geoforall-lab.github.io/tangible-landscape-talk/ncgis2017.html)
 
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
