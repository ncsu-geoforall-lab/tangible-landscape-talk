Narrative for GeoForAll webinar
======================================================

Software
--------
Let me give you a brief overview of the software behind Tangible Landscape. Tangible Landscape is built around GRASS GIS platform. GRASS GIS is an open source, multiplatform GIS offering a variety of simple to complex tools for geospatial analysis, but also remote sensing, network analysis or hydrology.
Tangible Landscape has 3 main components. First we have a GRASS GIS add-on module r.in.kinect, which continuously receives point cloud from Kinect and processes this data into a digital elevation model.
Then we have Tangible Landscape plugin integrated into GRASS GIS graphical user interface which serves for controlling Tangible Landscape, specifically the scanning parameters.
The third component is a Python file with geospatial analyses organized in functions called for each new scan. We developed a library of functions you can use right away, but you can also develop your own geospatial workflows using GRASS GIS Python API.


Dependencies
------------
All Tangible Landscape dependencies are open source. We already mentioned GRASS GIS which we use for geospatial modeling and also for visualization. The connection with Kinect is ensured with open source drivers - specifically library libfreenect2. We use Point Cloud library - PCL - for processing of the point cloud.


Interfaces
----------
How do you actually control Tangible Landscape? There are 3 interfaces, first, the tangible user interface is what Tangible Landscape is all about - people with different background and even no expertise can control GIS using their hands.
The Graphical User Interface launches the scanning and controls the scanning parameters which can be different depending on the model and setup. The API  is what makes Tangible Landscape flexible, apart from the prepared functionality, you can develop your own workflows using Python. Some examples are also available in this material we developed for FOSS4 NA workshop this year. 


Interactions
------------
The flexibility of Tangible Landscape is not just in the geospatial workflows, but we also developed multiple ways to interact with the physical models. 
We have so far talked only about sculpting sand with our hands, where we modify the continuous surface. However some applications require different types of input data, such as objects. Here we use a wooden marker to specify point locations on the landscape, for example view points or trailheads. Recently we have started to experiment with using laser pointer to draw objects, such as points, lines or polygons. Another option is to use colored sand to create polygons where the color represents certain attribute of the polygon and the height of the sand can represent intensity of that property. These interactions can be combined to achieve intuitive interactions for particular application.
Now I will show you some of the applications we developed using different algorithms and study sites and each of them has different type of interaction.

Topography
----------
One of our first motivations for building TL was to experiment with how topography drives processes such as erosion and deposition. We were also looking at links between topographic parameters like slope, aspect, or landforms.


Viewshed
--------
Topography is directly linked to visibility, so here we explore viewsheds at our campus. The physical model represents digital surface model with canopy and we place the markers to specify viewpoints. Once the marker is detected, the viewshed is dynamically computed and visualized, here the visible areas are represented by yellow color.


Solar
-----
This application has little bit different scale, we look at how the configuration of buildings 
Influences cast shadows during the day at different times of the year. Also we can look at the changes in solar energy during the year using an animation which can reveal some interesting patterns.


Soils
-----
This is an interesting applications where we use an unusual data type - voxel model, in GRASS GIS terminology 3D raster. We started with three-dimensional points measurements of soil moisture which we interpolated into a continuous 3D raster. We then use TL to interactively explore and visualize the soil moisture.
By digging into the sand with our hands we can look under the ground as if we were at an excavation site. We compute the cross-section of the scan with the 3D raster and project it back on the sand. The colors then represent the soil moisture value at that particular place and depth.  We can extend this concept and combine it with other interactions we talked about, so you can for example use the markers to specify the profile which is then automatically projected next to the model.


Fire
----
In this application we couple TL with a complex wildfire simulation implemented in GRASS GIS. The physical model here represents surface model with canopy and we can watch how the fire spreads without any intervention. Now we can remove part of the sand representing canopy and create a fire break which is then scanned, identified and the input to the simulation is updated. Now the fire stops at the fire break, however due to spotting effect it jumps over the fire break and continues spreading.


FUTURES
-------
Looking again at a completely different scale, regional scale, we coupled TL with urban growth model called FUTURES
implemented as a GRASS add-on and developed here at our Center. By placing colored sand we create red zones
which attract new development or green zones for conservation. The height of the sand can represent
the intensity - how much the zone attracts the development. Then we identify the polygons and
rerun the urban growth model with these new conditions


Coastal
-------
Recently there has been a lot of excitement about serious games and how we can use them to engage public in science. We thought TL would be a great tool for that, so we developed a couple of them, or example the coastal flooding game. People here were trying to protect the homes on the coast when a foredune is breached during a storm surge. With limited sand budget they tried different ways of building barriers and they learned pretty quickly that a breach in one place can affect houses which are far away from it.


Termites
--------
Topic of another game is termite infestation in Florida. People were managing  the spread of termites across a city by treating city blocks. They were testing different configurations of treatments to achieve most efficient solutions and at the same time
they were learning about how the termites actually spread, since we used an actual biological invasion model developed in R language.












