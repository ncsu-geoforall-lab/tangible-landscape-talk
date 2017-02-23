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

How it works
------------

So how does the system work? In the previous slide you have seen the 3D model of a landscape.
This model is continuously scanned by the kinect, the scanned data are imported into GRASS GIS,
where a 3D digital elevation model is computed and a selected analysis or modeling is performed -
in our case contours are derived and water flow and ponding is simulated. A composite image
of the selected map layers is then projected over the model. In this way the system couples
the digital and physical models in a continuous cycle of scanning, modeling and projection,
providing the user continuous feedback.

Software
------------
So let’s have a look at the software behind Tangible Landscape. Tangible Landscape is built around GRASS GIS platform. GRASS GIS is an open source, multiplatform GIS offering a variety of simple to complex tools for geospatial analysis, but also remote sensing, network analysis or hydrology.
Tangible Landscape has 3 main components. First we have a GRASS GIS add-on module r.in.kinect, which continuously receives point cloud from Kinect and processes this data into a digital elevation model.
Then we have Tangible Landscape plugin integrated into GRASS GIS graphical user interface which serves for controlling Tangible Landscape, specifically the scanning parameters and timing.
The third component is a Python file with geospatial analyses organized in functions called for each new scan. We developed a library of functions you can use right away, but you can also develop your own geospatial workflows using GRASS GIS Python API.

System cost
------------
So, what do you need to actually to build Tangible Landscape?
You already know you need a projector, scanner, physical model and a computer.
The computer needs to have a good graphics card.
Additionally, you need a stand to hold the projector and the scanner.

At the Tangible Landscape wiki we list all the necessary parts with suggestions for particular
products.
The price is about two thousand five hundred and we are always looking for even less expensive parts.
All Tangible Landscape software is open source.

Interactions
------------
You have so far seen only sculpting sand with our hands, where we modify the continuous elevation surface. However some applications require different types of input data, such as objects. To make Tangible Landscape flexible in this regard, we developed multiple ways to interact with the physical models. Here we use a wooden marker to specify point locations on the landscape, for example view points or trailheads. Recently we have started to experiment with using laser pointer to draw objects, such as points, lines or polygons. Another option is to use colored sand to create polygons where the color represents certain attribute of the polygon and the height of the sand can represent intensity of that property. The most recent interaction we are testing now is creating areas using colored felt or paper of different shapes placed on the model. 
These interactions can be combined to achieve intuitive interactions for particular application. Now I will show you some of the applications we developed for different study sites, using different geospatial models and each of them has different type of interaction.

Viewshed
--------
Topography is directly linked to visibility, so here we explore viewsheds at our campus. The physical model from sand represents digital surface model with canopy and we place the markers to specify viewpoints. Once the marker is detected, the viewshed is dynamically computed and visualized, here the visible areas are represented by yellow color.



FUTURES
-------
Here we switch from disease spread to urbanization application. We coupled TL with urban growth model called FUTURES implemented as a GRASS add-on and developed here at North Carolina State University. By placing colored sand we create red zones which attract new development or green zones for conservation. The height of the sand can represent the intensity - how much the zone attracts the development. Then we identify the polygons and rerun the urban growth model with these new conditions. 
Now you can observe the animated growth of the city as predicted by the FUTURES based on the specified interventions.


Coastal
-------
Recently there has been a lot of excitement about serious games and how we can use them to engage public in science. We thought Tangible Landscape would be a great tool for serious gaming, so let’s look at a coastal flooding game. We prepared this game for a public event and people playing the game were trying to protect the homes on the coast when a foredune is breached during a storm surge. With limited sand budget they tried different ways of building barriers and they learned pretty quickly that a breach in one place can cause flooding of houses which are far away from the breach.


Coupling Tangible Landscape with IVE
---------------
### 1. Concept

As you have seen so far, Tangible Landscape represents the landscape as a projection-augmented model which is perceived in a bird’s-eye perspective. We aimed to complete the picture by representing the landscape similar to how we perceive in human-scale. 

So why it is important to include human perception ? 

First, this allows for a more tangible understanding and communicating the implications of landscape change that are important components in decision making and stake-holder participation.  What it means if some areas is flooded ? or how your living environment looks like after some restoration intervention ? 

Second, it allows bringing designers into the table and include attributes that they care about, like composition of landscape, coherence and etc. 

Third, given our growing understanding about the impact of landscapes on individual’s mental and physical health , it is is imperative to find those sweet spots where the ecological functioning and human-perception measures such as aesthetic evaluation and landscape preferences are balanced. 

### 2. What is IVE and why IVE? 

IVE’s surround user with continous stream of stimuli, tied to the users head or body movement , creating a feeling being physically present in a virtual world. 

They are shown to elicit a high degree of presence and immersion, and very robust tools for assessing perceptions. 

### 3. The coupling rationale 

The coupling concept is based on adaptive 3d modelling framework. The idea was to generate a georeferenced 3D world of the under-study landscape, in which all the features and behavior of 3D elements like trees, buildings and surfaces are linked to their corresponding tangible object in tangible landscape. In this way, as users manipulate the tangible model and pieces, they can see, in real time, the changing landscape rendered on display or through virtual reality headsets like oculus. 

In addition to the automation adaptation aspect, we wanted to allow users to control the camera and animation so they can step into and navigate in their desired location in the landscape. 


### 4. The physical setup 

For implementing the concept, we added a 3D modeling and game engine software, called blender,  to the tangible landscape setup with outputs to a display and an immersive virtual reality headset.

### 5. Blender 

Blender is a free and open source program for modeling, rendering, simulation, animation, and game design. The software has an internal python-based IDE and add-ons for importing GIS data to georeference the scene, and displaying the viewport in HMDs. It also allows realtime high-quality rendering and shading. 

### 6. Software architecture

Briefly describing the workflow, GRASS GIS and Blender are loosely coupled through file-based communication. As user interacts with the tangible model or objects, GRASS GIS sends a copy of the geo-coordinated information or simulation to a specified system directory. 

We implemented a monitoring module in blender scripting environment that constantly watches the directory, identifies the type of incoming information, and apply relevant operations needed to update the 3d model. The input data can range from geospatial features like a raster or a point cloud, simple coordinates as a text file, or signals that prompt a command such as removing an object from the scene. 

### 7. Hand interaction 
For example, when landscape is manipulated with hand a geotiff raster and a polygon related to water is processed.
 
### 8. Vantage point.

While anytime during the interaction user can freely navigate in the environment using the mouse, they can also use a laser pointer to delineate their prefered vantage point. 
Lines created with laser pointer can be transferred as a line feature denoting user’s desired viewpoint and direction of view. The scene camera is then relocated to the line’s starting point and the direction of view is aligned to the line’s endpoint. 

### 9. Tree
Aslo, Polygon features drwan with laser-pointer can be defined as patches of trees to populate predefined diversity and density of vegetation. 

### 10. Views and oculus
The viewport is continuously displayed in both viewport and headmounted display, so users can pick up the headset and get immersed in their prefered views.

### 11. Video

For demonstration of the application in action, we will go through a small video of our first prototype where our colleague, Vatslav, and Anna collaboratively design a landscape. Through the design process, please note that how the developments enables the dialogue between ecological assessment and aesthetic evaluation. 

#### Ponding and Landscape design

Vatslav starts by sculpting the topography to create retention ponds to address stormwater management requirements of the site .  As as he carves the landscape, Water flow and accumulation simulations are continuously projected onto the physical model. In the same time, point-cloud and water polygon is transferred to update the tangible model. 

Then he collaboratively works with anna to place the excavated soil on-site to create artificial mounds that provide overviews to the site.  

For showing human-scale views we took benefit of the laser pointer interaction. You can delineate the desired view-point and orientation in the landscape which is processed as a line feature as sent to blender to update the camera location and orientation.  Additionally, Users can explore the landscape with the mouse or with the immersive headset.

#### Vegetation design.

Aslo, Polygon features delineated with laser-pointer can be defined as patches of trees to populate predefined diversity and density of vegetation. In this demonstration, only one type of tree is used. However, the blender script can be adjusted to detect various types of plant species. In our current current revisions we have added shading and textures  improve the realism of the scene. 

#### Trail Design 

Tangible objects are also processed in the application. For instance here, wooden cubes represent checkpoints that denote a recreational trail. Grass GIS, simulates the optimal route using an algorithm that simulates the least cost walking path. But Vatslav want to complement the trail experience and adjusts it to meander within the new forested patches.

The trail line feature not only represent the trail but also processed in Blender as a walktrough simulation that can viewed on screen or in HMD. 
#### 12. Future work

The video you saw was our first prototype of the application, we now have considerably improved the realism and rendering quality and working to improve it even further. We are intending to test it in landscape design and decision making scenarios, where users can plant a variety of vegetation,design surfaces, and decide on both ecological relevance (like erosion, waterflow) and aesthetic aspects of their design in real time. 



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
