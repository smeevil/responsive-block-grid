# Reactive Block Grid

### What does it do ?

This plugin will create a reactive [Isotope](http://isotope.metafizzy.co) masonry for you. If you update or filter your collection/cursor it will be automatically reflected in the layout. 

### Block grid preview:
![img](https://s3.amazonaws.com/f.cl.ly/items/0R3N3M0q0N3i2P1E0L2B/Screen%20Recording%202015-01-07%20at%2008.07%20pm.gif)

### Pinterest like preview:
![img](https://s3.amazonaws.com/f.cl.ly/items/111d3l2Y2H1S191W1g1G/Screen%20Recording%202015-01-07%20at%2008.10%20pm.gif)

### Why?

I was looking for a solution that would help me animate newly inserted templates in a block grid that was ordered by newest first. Using the default options of just rendering your collection in an each block made for a jarring user experience when a **new item** would be **added** or **removed** in this way. For example you are looking at an item and all of the sudden you see something flicker and you are looking at a different item. Using an animation makes for a more **natural transition** and understanding of what happend. As I could not find any **_easy_** solution yet, I started to make one myself.

### Usage

**Installation:**

~~~js
meteor add smeevil:reactive-block-grid
~~~

**Basic usage:**

The most basic option to use it in your templates is as follows :
~~~js
{{> reactiveBlockGrid cursor=myCursor template='myTemplate'}}
~~~

To add classes to the generated &lt;ul/&gt; you can pass them using the cssClass option like so :
~~~js
{{> reactiveBlockGrid cursor=myCursor template='myTemplate' cssClass='small-block-grid-3 medium-block-grid-6'}}
~~~



**Options:**

You can pass the following isotope options to the template:  transitionDuration, layoutMode, gutter, columnWidth. Please look at the [isotope read me](http://isotope.metafizzy.co) for more information on these options.

**Full example:**
~~~js
{{> reactiveBlockGrid cursor=myCursor template='myTemplate' transitionDuration='1.5s' layoutMode='fitRows' gutter=20 columnWidth='.gutter-width'}}
~~~

Licensed under the WTFPL License. See the `LICENSE` file for details.
