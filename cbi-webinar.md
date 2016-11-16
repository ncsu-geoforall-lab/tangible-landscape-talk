Narrative for Tangible Landscape CBI webinar
============================================

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
