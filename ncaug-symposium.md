Narrative for Tangible Landscape NCGIS 2017
============================================


NCSU CGA
--------
Payam and I present this talk as members of NC State Geoforall laboratory which is part of the
CGA - Center for Geospatial Analytics. CGA is a university-wide hub for research
 and education in geospatial computing, 
analytics and geovisualization - and you will see some examples of these efforts in our presentation.


Motivation
----------

So why are we interested in Tangible interfaces? I am sure this photo shows a familiar setting -
we often get together around a screen to solve a geospatial problem or use mouse or touch 
to manipulate 3D data on 2D screen. Such manipulation of data often requires knowledge of a specific,
often complex software, usually only single person can access the data 
creating barriers to collaboration and creativity. 

History
-------
Couple years ago, researchers at the MIT Media Lab tried to adddress this issue and developed
first prototypes of environments that coupled 3D physical models with their analysis.
The systems were Sandscape and Illuminating clay and they were limited by the 3D scanning and computating
capabilities available at that time.

We were fortunate to collaborate with the Illuminated Clay developers and thanks to the grant from Army Research Office
we developed a similar system and linked it with GIS to support modeling and analysis 
of real world landscapes based on GIS data. The system used laboratory lidar and it was very expensive,
limiting its broader use.

The breakthrough for this approach came with a new generation of low cost 3D sensors,
specifically Kinect. Several systems were devloped using Kinect, the best known among them
is probably the Augumented sandbox by Keckcaves developed at UC Davis.
You might have seen this systems at museums or conferences where it often generates a lot of excitement.

Tangible Landscape
------------------

We were able to take advatage of the fast and relatively accurate 3D scanning by Kinect
and developed the first system with real-time coupling of a 3D physical model, with GIS.
This video should give you a basic idea of the interaction - using a model of a real landscape,
we can modify the topography and get instant feedback on how our changes impact water flow and ponding.

So how does the system work? 
This model is continuously scanned by the kinect, the scanned data are imported into GRASS GIS,
where a 3D digital elevation model is computed and a selected analysis or modeling is performed -
in our case contours are derived and water flow and ponding is simulated. A composite image
of the selected map layers is then projected over the model. In this way the system couples
the digital and physical models in a continuous cycle of scanning, modeling and projection,
providing the user continuous feedback.


Interactions
------------
You have so far seen only sculpting sand with our hands, where we modify the continuous elevation surface. However some applications require different types of input data, such as objects. To make Tangible Landscape flexible in this regard, we developed multiple ways to interact with the physical models. Here we use a wooden marker to specify point locations on the landscape, for example view points or trailheads. Recently we have started to experiment with using laser pointer to draw objects, such as points, lines or polygons. Another option is to use colored sand to create polygons where the color represents certain attribute of the polygon and the height of the sand can represent intensity of that property. The most recent interaction we are testing now is creating areas using colored felt or paper of different shapes placed on the model. 
These interactions can be combined to achieve intuitive interactions for particular application. Now I will show you some of the applications we developed for different study sites, using different geospatial models and each of them has different type of interaction.


Software
------------
So let’s have a look at the software behind Tangible Landscape. Tangible Landscape is built around GRASS GIS platform. GRASS GIS is an open source, multiplatform GIS offering a variety of simple to complex tools for geospatial analysis, but also remote sensing, network analysis or hydrology.
Tangible Landscape has 3 main components. First we have a GRASS GIS add-on module r.in.kinect, which continuously receives point cloud from Kinect and processes this data into a digital elevation model.
Then we have Tangible Landscape plugin integrated into GRASS GIS graphical user interface which serves for controlling Tangible Landscape, specifically the scanning parameters and timing.
The third component is a Python file with geospatial analyses organized in functions called for each new scan. We developed a library of functions you can use right away, but you can also develop your own geospatial workflows using GRASS GIS Python API.


GRASS GIS
----------


Interfaces
----------
How do you actually control Tangible Landscape? There are 3 interfaces, first, the tangible user interface is what Tangible Landscape is all about - people with different background and even no expertise can control GIS using their hands.
The Graphical User Interface launches the scanning and controls the scanning parameters which can be different depending on the model and setup. The API  is what makes Tangible Landscape flexible, apart from the prepared functionality, you can develop your own workflows using Python. Some examples are also available in this material we developed for FOSS4 NA workshop this year. 

Applications
------------

Topography
----------
One of our first motivations for building TL was to experiment with how topography drives processes such as erosion and deposition. We were also looking at links between topographic parameters like slope, aspect, or landforms.



Viewshed
--------
Topography is directly linked to visibility, so here we explore viewsheds at our campus. The physical model from sand represents digital surface model with canopy and we place the markers to specify viewpoints. Once the marker is detected, the viewshed is dynamically computed and visualized, here the visible areas are represented by yellow color.


Solar
-----
This application has little bit different scale, we look at how the configuration of buildings 
Influences cast shadows during the day at different times of the year. Also we can look at the changes in solar energy during the year using an animation which can reveal some interesting patterns.

Trail planning
--------------
Tangible Landscape can be also used for designing optimal trails. By placing the markers, we specify waypoints, through which the trail should pass, and the trail network is automatically computed using least cost path algorithm, which can take multiple factors as input, such as land cover and walking energetics, so it can avoid high slopes. On top of that, you can use network analysis to find the optimal combination of trails. You can compute some analytics, for example the slope along the path, if that’s your concern.

Soils
-----
This is an interesting applications where we use an unusual data type - voxel model, in GRASS GIS terminology 3D raster. We started with three-dimensional points measurements of soil moisture which we interpolated into a continuous 3D raster. We then use TL to interactively explore and visualize the soil moisture.
By digging into the sand with our hands we can look under the ground as if we were at an excavation site. We compute the cross-section of the scan with the 3D raster and project it back on the sand. The colors then represent the soil moisture value at that particular place and depth.  We can extend this concept and combine it with other interactions we talked about, so you can for example use the markers to specify the profile which is then automatically projected next to the model.

Fire
----
In this application we couple TL with a complex wildfire simulation implemented in GRASS GIS. The physical model here represents surface model with canopy and we can watch how the fire spreads without any intervention. Now we can remove part of the sand representing canopy and create a fire break which is then scanned, identified and the input to the simulation is updated. Now the fire stops at the fire break, however due to spotting effect it jumps over the fire break and continues spreading.

Coastal
-------
Recently there has been a lot of excitement about serious games and how we can use them to engage public in science. We thought Tangible Landscape would be a great tool for serious gaming, so let’s look at a coastal flooding game. We prepared this game for a public event and people playing the game were trying to protect the homes on the coast when a foredune is breached during a storm surge. With limited sand budget they tried different ways of building barriers and they learned pretty quickly that a breach in one place can cause flooding of houses which are far away from the breach.


Termites
--------

Topic of another game we did is termite infestation in Florida. People were managing the spread of termites across a city by treating city blocks. They were testing different configurations of treatments to achieve most efficient solutions and at the same time
they were learning about how the termites actually spread since we used an actual biological invasion model developed in the R language by our colleague.

FUTURES
-------
Here we switch from disease spread to urbanization application. We coupled TL with urban growth model called FUTURES implemented as a GRASS add-on and developed here at North Carolina State University. By placing colored sand we create red zones which attract new development or green zones for conservation. The height of the sand can represent the intensity - how much the zone attracts the development. Then we identify the polygons and rerun the urban growth model with these new conditions. 
Now you can observe the animated growth of the city as predicted by the FUTURES based on the specified interventions.


SOD
---
One of our ongoing projects is using Tangible Landscape as a decision making tool to bring participants around the model and discuss the management of Sudden Oak Death disease in California. I am sure, many of you are familiar with this urgent problem. What we are doing, is we coupled Tangible Landscape with a stochastic, spatially-explicit model projecting the spread of Sudden Oak Death and we let people interact with it by specifying treatments. The model runs in R and is available on Github.
This video captures us as we are testing the application. We can see the simulated spread of the disease without any interventions projected on the model, so we define the polygons of treatment by placing markers, which are then interpreted as treated areas. We can project different layers, such as density of oaks or cost of treatment in that particular pixel. Once the treatments are placed, participants can see the cost of the treated areas and adjust them if needed. When we rerun the model with the new conditions, we can visualize and evaluate the results projected on the model, such as number of oaks saved, price per saved oaks, which helps you to compare the different configurations of treatment.


Coupling Tangible Landscape with IVE


As you have seen so far, Tangible Landscape represents the landscape as a projection-augmented model which is perceived in a bird’s-eye perspective. We aimed to complete the picture by representing the landscape similar to how we perceive in human-scale. 
First, this allows for a more tangible understanding and communicating the implications of landscape change that are important components in decision making and stake-holder participation.  What it means if some areas is flooded ? or how your living environment looks like after some restoration intervention ?

Blender is a free and open source program for modeling, rendering, simulation, animation, and game design. The software has an internal python-based IDE and add-ons for importing GIS data to georeference the scene, and displaying the viewport in HMDs. It also allows realtime high-quality rendering and shading. 


For designers
-------------

So where do we use TL? there are many ways - we will show just few examples.
TL can transform the way how designers work by providing creative, collaborative environment
for landscape design with real time feedback on the design imapcts - indeed our College of design
has used in some of their research and courses and is installing their own system.

For education
-------------

We use TL in our GIS courses to explain surface analysis algorithms and for student projects,
but the system is not restricted to college level education. We have brough it to events
where kids can explore the landscapes and out middle school has started exploring it as well.

For communities
---------------

We also have projects where we explore TL as a platform to support decision making and to
communicate science to public and decision makers with different background.
in accordance with the geoforall mission making the geospatial data and tools accessigble to all.

For researchers and developers
------------------------------

And we found aout that TL allowed us to improve and extend many modeling and analysis
tools and it is great for testing new algorithms and tools, as it allows us to generate various
landscape configurations in a controlled environment to test how the algorithms behave and how robust they are.
Here Vaclav used it to generate a seuquence of dune positions to develop visualization tool
for gradients of landform migration.

Open source
-----------

As we have mentioned, all tools are open source, managed in a public GitHub repository.
We have also created a TL repository in OSF to manage the project.

Resources
---------

Finally here are the resources which you can use to build, use, and further develop Tangible Landscape.
