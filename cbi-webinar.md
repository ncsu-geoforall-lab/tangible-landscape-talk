Narrative for Tangible Landscape CBI webinar
============================================

NCSU CGA
--------

The webinar is presented from the CGA, by the members of NC State Geoforall laboratory.
Our center is a university-wide hub for research and education in geospatial computing, 
analytics and geovisualization - and you will see some examples of these efforts in our presentation.
In terms of education, our center offers a professional master degree in geospatial information 
science and technology, and we are getting ready for a new PhD in Geospatial Analytics 
to start in Fall 2017.

Presenters
----------

The seminar was prepared by the GeoForAll lab team - Helena Mitasova - thats me, a professor 
in MEAS and assoc. director for geovisualization at the center, then you will hear from My 
graduate students - vaclav explaining the 3D modelis and TL setups, Anna, the lead developer
of TL will explain the software and will show you some cool applications, Paym from the college of 
design will showcase some of the latest development with immersive virtual environment.
You won't hear from Brendan - the creative lead for the TL project as he is in London at a conference,
but you will see him on some slides and finally...

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

How it works
------------

So how does the system work? In the previous slide you have seen the 3D model of a landscape.
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

Topography
----------
One of our first motivations for building TL was to experiment with how topography drives processes such as erosion and deposition. We were also looking at links between topographic parameters like slope, aspect, or landforms.

Viewshed
--------
Topography is directly linked to visibility, so here we explore viewsheds at our campus. The physical model from sand represents digital surface model with canopy and we place the markers to specify viewpoints. Once the marker is detected, the viewshed is dynamically computed and visualized, here the visible areas are represented by yellow color.

Solar
-----
This application has little bit different scale, we look at how the configuration of buildings Influences cast shadows during the day at different times of the year. Also we can look at the changes in solar energy during the year using an animation which can reveal some interesting patterns emerging from that configuration.

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

SOD
---
One of our ongoing projects is using Tangible Landscape as a decision making tool to bring participants around the model and discuss the management of Sudden Oak Death disease in California. I am sure, many of you are familiar with this urgent problem. What we are doing, is we coupled Tangible Landscape with a stochastic, spatially-explicit model projecting the spread of Sudden Oak Death and we let people interact with it by specifying treatments. The model runs in R and is available on Github.
This video captures us as we are testing the application. We can see the simulated spread of the disease without any interventions projected on the model, so we define the polygons of treatment by placing markers, which are then interpreted as treated areas. We can project different layers, such as density of oaks or cost of treatment in that particular pixel. Once the treatments are placed, participants can see the cost of the treated areas and adjust them if needed. When we rerun the model with the new conditions, we can visualize and evaluate the results projected on the model, such as number of oaks saved, price per saved oaks, which helps you to compare the different configurations of treatment.

FUTURES
-------
Here we switch from disease spread to urbanization application. We coupled TL with urban growth model called FUTURES implemented as a GRASS add-on and developed here at North Carolina State University. By placing colored sand we create red zones which attract new development or green zones for conservation. The height of the sand can represent the intensity - how much the zone attracts the development. Then we identify the polygons and rerun the urban growth model with these new conditions. 
Now you can observe the animated growth of the city as predicted by the FUTURES based on the specified interventions.

Erosion + felt
--------------
One of the first applications I mentioned was erosion modeling. Erosion can be controlled by modifying the topography, in this case by adding a checkdam. Then, land cover is an important factor for erosion control and that’s what the next example shows. Here, we use the felt to modify the landcover to reduce the erosion in the channel. We cut out different pieces of felt, light green felt represents grass, dark green forest patches and black can be a dirt road. Based on the color, the felt is then interpreted as landcover and reclassified to c-factor influencing the erosion. This is before and after the change. You can easily try different configurations in this way and people seems to find this interaction very accessible and intuitive.


Coastal
-------

Recently there has been a lot of excitement about serious games and how we can use them to engage public in science. We thought Tangible Landscape would be a great tool for serious gaming, so let’s look at a coastal flooding game. We prepared this game for a public event and people playing the game were trying to protect the homes on the coast when a foredune is breached during a storm surge. With limited sand budget they tried different ways of building barriers and they learned pretty quickly that a breach in one place can cause flooding of houses which are far away from the breach.

Termites
--------

Topic of another game we did is termite infestation in Florida. People were managing the spread of termites across a city by treating city blocks. They were testing different configurations of treatments to achieve most efficient solutions and at the same time
they were learning about how the termites actually spread since we used an actual biological invasion model developed in the R language by our colleague.

System setup
------------

So, what do you need to actually to build Tangible Landscape?
You already know you need a projector, scanner, physical model and a computer.
The computer needs to have a good graphics card.
Additionally, you need a stand to hold the projector and the scanner.

At the Tangible Landscape wiki we list all the necessary parts with suggestions for particular
products.
The price is about two thousand five hundred and we are always looking for even less expensive parts.
Actually, if you already have a computer with graphics card, you build the stand from wood in your garage and take the sand from your yard, you can bring the price down to 600 dollars.
If you find a way to make the system setup even less expensive, it would be great if you let us know or edit the wiki, so that everybody can benefit from it.
Software
And about the software, all Tangible Landscape software is open source. This means that you don’t need to worry about paying any license fees, not now, and not in the following years.

So let’s have a look at the software behind Tangible Landscape. Tangible Landscape is built around GRASS GIS platform. GRASS GIS is an open source, multiplatform GIS offering a variety of simple to complex tools for geospatial analysis, but also remote sensing, network analysis or hydrology.
Tangible Landscape has 3 main components. First we have a GRASS GIS add-on module r.in.kinect, which continuously receives point cloud from Kinect and processes this data into a digital elevation model.
Then we have Tangible Landscape plugin integrated into GRASS GIS graphical user interface which serves for controlling Tangible Landscape, specifically the scanning parameters and timing.
The third component is a Python file with geospatial analyses organized in functions called for each new scan. We developed a library of functions you can use right away, but you can also develop your own geospatial workflows using GRASS GIS Python API.

How do you actually control Tangible Landscape? Here you can see three people - a user, operator, and researcher. Each of them is interacting with the software and Tangible Landscape itself in a different way. So, let’s look at these ways in more detail.

Interfaces
----------

There are three ways, three interfaces. First, the tangible user interface is what Tangible Landscape is all about - people with different backgrounds and even no professional experience can control GIS using their hands. The the tangible interface is what a user, stakeholder, public representative or visitor at your institution would use.
The graphical user interface, GUI for short, launches the scanning and controls the scanning parameters which can be different depending on the model and setup. This is what an operator with some basic GIS knowledge would use to prepare Tangible Landscape for the others and to support them further as they are working with the tangible interface.
The API, application programming interface, is what makes Tangible Landscape flexible, apart from the prepared functionality you have seen in the presentation, you can develop your own workflows using Python. This serves researches who are linking new models to Tangible Landscape and really anybody who wants to add some specific functionality with few lines of Python code.

Building physical 3D models
---------------------------
So how do you build the physical model you need for Tangible Landscape?

Hand sculpting from polymeric sand
----------
We typically build the models out of polymer enriched sand because it is very easy to sculpt, sticks together nicely, and doesn’t dry out. You can easily build a polymeric sand model by hand.  Project the contours and color map of the elevation you want to built onto the sand and use this as a guide for modeling. 

Hand sculpting with difference feedback
----------
You can also build polymeric sand models by hand using Tangible Landscape for real-time feedback. As you build your model, it will be continuously scanned, and the difference between the landscape you want to build and the landscape you have built will be projected back onto the model. The blue color shows you where to add sand, while the red shows you need to remove sand. Note the histogram beside the legend. When you begin sculpting the model, the histogram will be pretty wild, but as you progress the differences should get smaller and the distribution should form a nice gaussian curve. It is also helpful to project the contours of the landscape  you want to build. With this method you can build a relatively precise model quickly - in less than ten minutes in this example. All you need is polymeric sand and Tangible Landscape. 

3D printing
----------
With 3D printing you can digitally fabricate very precise models, but they will be relatively small and very expensive.

CNC routing large, complex models and molds
----------
With Computer numerical control (CNC) routing you can digitally fabricate much larger models. While 3D printing is an additive process - built up layer by layer - CNC routing is a subtractive process - the material is cut away with a drill bit.  You can route or mill a wide range of materials. There are low cost materials such as  low density polystyrene foams and medium density fiberboard (MDF). There are more expensive materials that you can route in finer detail such as high density urethane foams. 

Casting polymeric sand
----------
3D printed and CNC routed models are hard and rigid - you can not easily change them. Because we want to have malleable models for Tangible Landscape, we typically use 3D printed and CNC routed models as molds for casting polymeric sand. With a mold we can quickly cast a very precise, but malleable model with a complicated shape. The mold is also our “reset button.” When you want to restore you model to its original condition, just re-cast it!

IVE development 
---------------
### Concept
As you have seen so far, Tangible Landscape represents the landscape as a projection-augmented model which is perceived in a bird’s-eye perspective. We coupled Tangible Landscape with an immersive virtual environment so that human-scale views can be rendered on devices like head-mounted displays (HMD). This allowed us to integrate the ecological analysis with human-perception measures such as aesthetic evaluation and landscape preferences.
### Hardware Setup 
You just need to add two components to the Tangible Landscape setup : a 3D modeling and simulation software, and an immersive virtual reality headset.For 3D modeling  we use Blender, a free and open source program for modeling, rendering, simulation, animation, and game design. Blender has an internal python-based IDE and add-ons for importing GIS data. Also, it has add-ons for integrating immersive virtual environments such as HMDs.Briefly describing the automation process, GRASS GIS and Blender are loosely coupled through file-based communication. As user manipulates the tangible model, GRASS GIS sends a copy of the geo-coordinated information or simulation to a specified system directory. Blender constantly monitors the directory to update 3d model of the landscape . In this way, user can simultaneously interact with large-scale tangible model and its 3d-clone that represent human-scale fine-grained elements , such as trees, waterbodies, roads, buildings and etc. For demonstration of how the extension works we prepared a small video where Vatslav and Anna collaboratively design a landscape. Through design process, please note that how the application affords the interplay between ecological assessment and aesthetic evaluation. 
### Ponding and Landscape design
Vatslav starts by sculpting the topography to create retention ponds to address stormwater management requirements of the site .  As as he carves the landscape, Water flow and accumulation simulations are continuously projected onto the physical model. In the same time, point-cloud and water polygon is transferred to update the  tangible model. Then he collaboratively works with anna to place the excavated soil on-site to create artificial mounds that provide overviews to the site.  For showing human-scale views took benefit of laser pointer interaction. You delineate the desired view-point and orientation in the landscape which is processed as a line feature as sent to blender to update the camera location and orientation.  Users can explore the landscape with the mouse or with the immersive headset.
### Vegetation design.
Polygon features delineated with lazer-pointer can be defined as patches of trees to populate predefined diversity and density of vegetation. In this demonstration, only one type of tree is used. However, the blender script can be adjusted to detect various types of plant species. Shading and textures can be included to add to the realism of the scene. 
### Trail Design 
Tangible objects are also processed in the application. For instance here, wooden cubes represent checkpoints that denote a recreational trail. Grass GIS, simulates the optimal route using an algorithm that simulates the least cost walking path. But Vatslav want to complement the trail experience and adjusts it to   pass through the new forested patches. The trail line feature not only represent the trail but also processed in Blender as a walktrough simulation that can viewed on screen or in HMD. With this extension, we hope to explore how Tangible Landscape can further closen the disciplinary gaps where we can decision-makers, stakeholders, scientists and architects can perceive and understand landscape processes and implications of future scenarios. 


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
