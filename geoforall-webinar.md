Narrative for Tangible Landscape GeoForAll webinar
==================================================

3D models
---------

The first question we usually get is how do you build the physical models.
The basic way is building models from sand.
We use polymeric sand or Kinetic sand which nicely sticks together but it doesn't dry out.
You can use projector to project contours and elevation color to guide you as you are
building the model.

Diff
----

More advanced way which actually uses Tangible Landscape.
In this case Tangible Landscape guides you by giving you automated feedback about the
model.
It is scanning the sand on the table, computing difference from the desired digital elevation
model and projecting this difference on the table.
All this happens continuously as you shape the model.
And the blue color tells you where to add sand while the red means that you should remove
sand.
As the shape of the model improves, watch also the histogram integrated with the legend.
At the beginning the histogram was pretty wild but you cat see that as the model gets closer
to the desired shape, the differences are closer to zero and the distribution is a nice
Gaussian curve.
From our experience, it helps a lot to project also contours of the desired elevation model in
addition to blue and red colors, so you know what you are actually building.
Using this method you can build fairly precise model in a short time.
And all you need to build model for Tangible Landscape is Tangible Landscape itself.

3D printing
-----------

You can also use 3D printing to create models but that's relatively expensive and the model
size is quite limited.
Additionally, the models are often fragile.

Router
------

A better option for large models, is CNC routing.
From user point of view, routing works in a similar way as 3D printing ­ you need a dedicated
software to convert your digital 3D model into instructions for the machine.
However, instead of adding material, the router removes or carves out the material.
Routing or carving can be done on wood, dense foam or MDF that's medium dense fiber
board.
The models are robust and can be large.
The largest model we tried was one meter by one meter.

Mold
----

The big issue with the printed and carved models is that they can't be modified.
So, what we do is carving a mold which we use to form the sand.
Using a form you can get very precise model in a short time and the model can be modified
later on.

In the future, we would like to create sand models automatically in our lab using a router or a
robotic arm.

Here you see one of our tests - a CNC router forming a sand model.

Setups
------

At this point you are probably decided to build Tangible Landscape yourself, right?
So, how do you do that?
First, you need to decide on which setup will you use.
You already know you need projector, scanner, physical model and a computer.
Placement of projector and scanner on stands will determine how well the setup will work for
your case.
You have several options.
One option is to hide the projector in the ceiling.
This is good for a lab because you need just one small stand but it is not possible to move it.

With a short-throw projector you need just two short stands but the image will be quite
distorted.

For smaller models, you can use a small pocket projector on a tall stand.

There is of course a lot of variations.
This one uses medium-sized projector mounted on a stand which is able to accommodate
the scanner as well.
This setup is very portable and works well for medium­sized models.
And that's our favorite setup.
For really large models, like this one which was one meter by one meter, we use a special
projector which can be placed in the same place as the scanner close to the model.

Hardware
--------

Here is a list of hardware you need and the good news is that it is not expensive.
At the Tangible Landscape wiki we list all the necessary parts with suggestions for particular
products.

Right now I would just like to emphasize that we try keep the price as low as possible.
And if you can replace one part by something cheaper, you can do it.
Just let us know or edit the wiki, so that everybody can benefit.
Hardware is relatively cheap but it gets even better: You don't need to purchase any
software licenses because it is all open source but I will let Anna to tell you about that.

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


Immersive Virtual environment development 
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










