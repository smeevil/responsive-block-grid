# Reactive Block Grid

### What does it do ?

This plugin will create a reactive [Isotope](http://isotope.metafizzy.co) masonry for you. If you update or filter your collection/cursor it will be automatically reflected in the layout.
### Live demo
You can find a live demo here : [http://smeevil-responsive-block-grid.meteor.com](http://smeevil-responsive-block-grid.meteor.com)

And the source of it here : [https://github.com/smeevil/responsive-block-grid-example](https://github.com/smeevil/responsive-block-grid-example)

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

To add classes to the generated `<ul>` and `<li>`; you can pass them using the parentClass and childClass options like so :
~~~js
{{> reactiveBlockGrid cursor=myCursor template='myTemplate' parentClass='medium-block-grid-12' childClass='medium-block-grid-3'}}
~~~



Meteor produces a new cursor when a helper is updated reactively, so any collection filtering on the frontend must use Isotope's filtering functionality, and not Meteor's.

Reactivity can still be taken advantage of, however, if a reactive var containing an object containing the properties and values to be filtered by, in the local template instance context. This can be passed to this plugin via a helper. Be sure to return a reference to the same reactive var, and not a reference to a new one in the helper.

~~~js
var reactiveFilter = new ReactiveVar({
  property1: true,
  property2: 'value'
});

Template.myParentTemplate.helpers({
  myCursor: function () {
    return Collection.find({});
  },
  myFilter: function () {
    return reactiveFilter;
  }
});

Template.myParentTemplate.events({
  'click button': function () {
    reactiveFilter.set({
      property1: !reactiveFilter.get().property1,
      property2: 'value'
    });
  }
});
~~~

~~~js
<button>Filter toggle</button>

{{> reactiveBlockGrid
  cursor=myCursor
  template='myTemplate'
  filterProperties="property1,property2"
  filter=myFilter
}}
~~~

**Options:**

You can pass the following isotope options to the template:  transitionDuration, layoutMode, gutter, columnWidth, and percentPosition. Please look at the [isotope read me](http://isotope.metafizzy.co) for more information on these options.

**Full example:**
~~~js
{{> reactiveBlockGrid cursor=myCursor template='myTemplate' transitionDuration='1.5s' layoutMode='fitRows' gutter=20 columnWidth='.gutter-width'}}
~~~

Licensed under the WTFPL License. See the `LICENSE` file for details.
