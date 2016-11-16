Narrative for Tangible Landscape for CBI
========================================

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
