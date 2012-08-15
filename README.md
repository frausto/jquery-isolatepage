IsolatePage JQuery Plugin
================================

A plugin for managing what javascript gets loaded per page, so your code can remain nice and isolated not being loaded where it's not wanted.

Usage
-------------------------

1. you can set the javascript for a page:

  ```coffeescript
  $.isolatePage('setPage', 'testpage', ->
    #PAGE SPECIFIC CODE GOES HERE
  )
  ```

2. You load the javascript for a page you have setup using:

  ```coffeescript
  $.isolatePage('loadPage', 'testpage')
  ```





Examples
-------------------------------

An example of how it can be used in coffeescript. You can take the id of the body of a page set the code you want to run for that page and load the javascript for it on every page load:

```coffeescript
$.isolatePage('setPage', 'page_id', ->
  $(".dontseeme").hide()
)
```

```coffeescript
$(document).ready -> 
  body = $("body")
  page_name = $.trim(body.prop("id"))
  $.isolatePage('loadPage', page_name)
```

In this example any page body with the id "page_id", will hide everything of the class "dontseeme". This wont happen for pages with different body ids.