do ($ = jQuery) ->
  page_scripts = {}
  methods = {
    setPage: (page_names, page_function) ->
      page_names = $.makeArray(page_names)
      for name in page_names
        page_scripts[name] = $.makeArray(page_scripts[name])
        page_scripts[name].push(page_function)
      this

    loadPage: (page_name) ->
      body = $("body")
      functions = $.makeArray(page_scripts[page_name])
      for page_function in functions
        page_function.apply(body)
      this
  }

  $.isolatePage = (method) ->
    if ( methods[method] )
      return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ))
    $.error( 'Method ' +  method + ' does not exist on jQuery.isolatePage' )