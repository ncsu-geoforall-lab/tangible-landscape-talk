
<p align="center"><br/>
    <img src="images/UAS_modeling/insolation_time.png" alt="my alt text">
</p><br/>

Contents:
=================

[I. Introduction](#i-introduction)<br>
[II. Importing Agisoft wavefront object](#ii-draping-the-satellite-imagery) <br>
[III. Decimating the obj](#iii-creating-the-earth-surface-roughness)<br>
[IV. Refining the surface](#iv-illuminating-the-earth-at-night) <br>
[V. Refining the texture](#v-creating-the-day-night-division) <br>
[VI. Adding materials](#vi-creating-the-clouds) <br>


Required software and materials
=================
* Download and install latest version of Blender from [here](https://www.blender.org/download/).
* Download and unpack sample_data folder from [here](https://github.com/ptabriz/geodesign_with_blender/blob/master/shading/sample_data.zip)
--------------------
|![Blender Viewport](images/shading/texture_maps.jpg) NASA satellite imagery used in this tutorial: daytime imager (above left), elevation (above right), nightime imagery (bottom left), and cloud imagery (bottom right)|
|:---:|

## I. Introduction
In the tutorial, we will get familiar with techniques for importing, processing and rendering UAS data. The sample data at hand consist of mesh, digital surface model (DSM) and series of analysis maps created from UAV nadir and NSWE oblique imagery (250ft). Mesh and Digital surface models has been generated with AGISoft and analysis has been performed in GRASS GIS. Get the full report of the flight survey [here](/images/UAS_modeling/report_UAV_survey.pdf).    


|![Blender Viewport](images/UAS_modeling/ortho_uas.png) adding a new node|![Blender Viewport](images/UAS_modeling/irradiance.png) linking two nodes|![Blender Viewport](images/UAS_modeling/insolation_time.png) changing node parameters|
|:---:|:---:|:---:|

----------------------
## I. Preparing the Blender scene

* Run Blender and open the file "shading_earth.blend".
* Set ``render engine`` to "Cycles". You can find it in the top header, the default is "Blender Render"
* Select the Earth_sphere object (using right_click).
* Go to ``Properties tab`` > ``Material`` > press `` + New`` button to create a new Material. Rename the Material to *Globe*.
* Upon material creation a Diffuse Shader is automatically added which can be seen in the ``Node_editor`` (see figure below, left).

----------------
## I. Importing Agisoft wavefront object
Wavefront objects (.obj) is perhaps the most common 3D mesh format. While Obj files contain only geometry,
they can be accompanied by a material (.mtl) file and texture images such as Jpg and Png to save materials and textures.
When exporting UAS files to wavefront, Agisoft creates Obj and material files so that they can be conveniently used in 3D modeling software.
The only drawback of Obj files is loss of georeferencing, meaning that when imported in other software they will be located in an arbitrary location in the 3D space.  

* Go to File > Import > Wavefront objects (.obj) and browse to the sample_data folder
* Select the centennial_uav.obj
* In the import options (bottom left side of the import):
  * Change the direction to Z up and X forward (see figure import_obj_option.PNG). These parameters are adjusted to the axis direction of the 3D space.
  For example, Z up means that the height axes is defined as Z with positive up.   
  * Press enter to finalize the import.

## II. Decimating the objects

3D meshes exported from Agisoft or similar structure from motion (SFM)
solutions are usually very dense and contain millions of faces.
It is possible to decimate them without loosing the surface details. In Blender, decimation is done using Decimate modifier.

* Select the imported object (centennial_UAV)
* Change the viewport shading mode
* Go to ``Properties Editor`` > ``Modifiers`` tab > ``Add Modifier`` > from the dropdown select ``Decimate``. You will see the decimate panel show up in the properties editor. Notice that the current face count of the object is indicated as 1371299.
* Click on the ``Ratio`` slider and type in *0.5*. Wait for the process to finish, it may take several seconds depending on your system's computation power.
note: Do not drag the Ratio slider to avoid freezing and crashes. Use keyboard input instead.  
* You will notice that the face count is reduced to half (685645) and the wireframe shows that the polygons are spaced out.
* Switch the viewport shading to ``Material`` to examine the quality loss.
* In Decimate modifier's panel click on ``Apply`` to finalize the modification. This process may also take several seconds.

## II. Global smoothing

It is possible to use blender to smooth the entire mesh and enhance the mesh representation.

* Select the *centennial_UAV* object.
* Change the viewport shading mode to *Solid*.
* Go to ``Properties Editor`` > ``Modifiers`` tab > ``Add Modifier`` > from the dropdown select ``Smooth``. You will see the decimate panel show up in the properties editor. Notice that the current face count of the object is indicated as *1371299*.
* Change ``Factor`` parameter to *0.5* and repeat to *3*.
* See how the mesh is changing in the viewport.
* Now change the viewport shading mode to *Material* to see how the smoothing has affected the texture placement.

## II. Refining the mesh.
Blender comes with comprehensive sculpting tools that can be used to make local mesh refinements such as flattening a surface, filling a whole, removing the dents, etc.
Note: Sculpting tools are useful for treating existing faces, thus they cannot be used to fill large wholes or reconstruct big chunks of missing data.

* Select the *centennial_UAV* object.
* From the viewport's bottom header > swith from ``Object Mode`` to `` Sculpt Mode``. The sculpting panel will show up in viewport's left toolbar in the ``Tools`` tab.
* Pick an area of your choosing that needs treatment to start experimenting with different brushes.
* General procedure for using sculpting brushes is as following:
  * In the scultping toolbar, click on the Brush thumbnail to see the list of Brushes > select a brush.
  * hover the mouse over the treatment area in 3D view and click to apply the brush. You can click and drag to continuously apply the treatment.  
* Brush options:
    * To change the brush stroke parameters:
      * In the sculpting toolbar, click on ``Stroke`` section to expand it:
      * Adjust the ``Radius`` parameter to increase/decrease the brush size.
      * Adjust the ``Strength`` parameter to increase/decrease the magnitude of the effect.
    * To snap the brush stroke to a specific direction:
      * Collapse ``Symmetry/Lock`` section and select *X*, *Y* or *Z* parameters.
* Some useful brushes:
  * ``Inflate/Deflate`` for extruding depressions or decompressing bumps. You can switch between Inflate and Deflate in the toolbox.
  * ``Smooth`` for leveling and smoothing surfaces.
  * ``Snake Hook`` for dragging the vertices to and close the gaps.
* Switch back the object interaction mode to ``Object Mode``(viewport bottom header).

## III. refining the texture.
The UAV derived textures often include small imperfections such as black wholes. These errors can be treated using ``Texture paint`` tool. Consider Texture Paint as a small photo editing software that allows you to edit the textures draped onto the 3D mesh. While texture paint has also variety of brush types, In this tutorial we will only use ``Clone tool``. As the name suggest, Clone tool copies color information from one area (reference) and applies it to another area. The procedure is as follows:

* Select the *centennial_UAV* object.
 viewport's left toolbar in the ``Tools`` tab (figure).
* Zoom-in on an area of your choosing that needs treatment.
* From the viewport's bottom header > switch from ``Object Mode`` to ``Texture Paint``. The texture paint panel will show up in
* In the texture paint toolbar, click on the Brush thumbnail to see the list of Brushes > select *Clone*.
* Adjust the size of the Brush using the *Radius* parameter ((keyboard shortcuts ``[`` ``]`` for increasing and decreasing)
* Hold ``Ctrl`` key and click on the area that the reference color needs to be picked.
* Hover the mouse to the area that needs treatment and left-click to paint.
Note: Texture paint can be only applied to areas that have geometry but miss color information. Don't expect to fill-in the mesh voids with this tool.  

## IV. Draping the GIS analysis
In this step, we drape various analysis maps on the obj surface.
These include Solar analysis, Water flow simulation, and viewshed simulation. The process is simple. We remove the existing material and assign a Diffuse shader with Image texture to drape the images.

* To remove the existing materials:
  * Select the object
  * Go to ``Properties editor`` > ``Material`` > select the material in the material slot > Press ``-`` button to remove the material from the slot.
  * If there are more than one material in the slot, remove all of them to clear the slot.
* To create new material.
  * Create a new material using the ``+`` button and rename it (e.g., water flow)
  * Go to ``Node Editor`` and reconstruct the node network based on the figures below.

Some general tips for adding nodes:

* Make sure that your render engine is set to ``Cycles`` render.
* If you don't have a fast processing computer, do not attempt to change node options, while in ``viewport rendering`` mode. Finalize your modifications in ``Material mode`` and then switch to render.
* Nodes can be added in ``Node Editor`` using ``Add`` menu. For easier access to the nodes use node search.
* Detailed instruction for adding nodes can be found [here](https://github.com/ptabriz/geodesign_with_blender/blob/master/img/hero_shading.jpg).


## V. Importing GIS textures
1. What are the benefits and drawbacks of using DSM vs. Obj ?



Add water flow
Add hillshade
Add solar analysis (day 100)
Animation


## VI. Animation
In this step, we  






1. What are the benefits and drawbacks of using DSM vs. Obj ?
2. How do you think 3D modeling, rendering, animation and Web3D can help your work ?
3. What additional types of textures, animations, GIS data, or interactions you can think of ?
4. Whether and how you would use blender in your project if you knew about it earlier in the semester (maybe we can help you)?
