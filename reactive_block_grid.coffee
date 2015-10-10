Template.reactiveBlockGridItem.helpers
  partial: ->
    Template.parentData(1).template

  position: ->
    idMap=Template.parentData(1).cursor.fetch().map (i)-> i._id
    _.indexOf(idMap, @_id)

  childClasses: ->
    Template.parentData(1).childClass

  filterProperties: ->
    filterProperties = Template.parentData(1).filterProperties
    filterProperties.split(',').reduce((obj, property) =>
      obj["data-reactive-block-grid-property-#{property}"] = @[property]
      obj
    , {})

Template.reactiveBlockGridItem.onRendered ->
  $ul=Template.parentData(1).reactiveBlockGrid
  if $ul?.data 'isotope-initialized'
    li=$(this.find('li'))
    $ul.isotope('insert', li)

    setTimeout ->
      $ul.isotope('updateSortData').isotope()
    , 100

    li.imagesLoaded ->
      $ul.isotope('layout')

Template.reactiveBlockGrid.helpers
  cursor: ->
    @cursor

  parentClasses: ->
    @parentClass or @cssClass

Template.reactiveBlockGrid.onRendered ->
  options={
    itemSelector: 'li'
    sortBy: 'reactiveBlockPosition'
    sortAscending: true
    getSortData:
      reactiveBlockPosition: '[data-reactive-block-position] parseInt'
  }

  for opt in ['layoutMode', 'transitionDuration']
    options[opt] = @data[opt] if @data[opt]?

  masonryOptions = {}
  for opt in ['columnWidth', 'gutter', 'isFitWidth', 'percentPosition']
    masonryOptions[opt] = @data[opt] if @data[opt]?
  options.masonry = masonryOptions unless _.isEmpty(masonryOptions)

  $el=$(@find('ul.reactiveBlockGrid'))

  $el.isotope options

  for el in $(@find('.reactiveBlockGridElementContainer'))
    $el.isotope 'insert', el

  $el.attr('data-isotope-initialized', 'true')

  @data.reactiveBlockGrid=$el

  $el.imagesLoaded  ->
    $el.isotope 'layout'

  if @data.cursor.limit? || @data.cursor.skip?

    @data.observer = @data.cursor.observeChanges
      addedBefore: -> null
      movedBefore: -> null

      removed: (id) ->
        selector = "[data-reactive-block-grid-item-id=#{id}]"
        item = $el.find(selector)
        $el.isotope('remove', item).isotope('layout')

  else
    @data.observer = @data.cursor.observe
      removed: (doc) ->
        selector="[data-reactive-block-grid-item-id=#{doc._id}]"
        item=$el.find(selector)
        $el.isotope('remove', item).isotope('layout')

  if @data.filter
    this.autorun =>
      $el.isotope
        filter: @data.filter.get()

Template.reactiveBlockGrid.onDestroyed ->
  @data.observer?.stop()
