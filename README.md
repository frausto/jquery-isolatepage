IsolatePage JQuery Plugin
================================

A plugin for managing what javascript gets loaded per page, so your code can remain nice and isolated not being loaded where it's not wanted.

Installation
-------------------------

Just include the source file. All examples are in coffeescript, but you can install the plugin using either the coffeescript or the javascript file depending on your preference. Obviously this plugin depends on JQuery.

```html
<script type="text/javascript" src="yourfiles/jquery.isolatepage.js"></script>
```

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

Want to have some javascript run on multiple pages? Easy peasy:

```coffeescript
$.isolatePage('setPage', ["testpageone", "testpagetwo"], ->
  $(".dontseeme").hide()
)
```

Contribute
-------------------------------

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* You can run tests using jasmine and node.js. To run specs, go into the projects root directory then:

        npm install -g coffee-script
        npm install -g jasmine-node
        npm install jquery
        jasmine-node --coffee spec/jquery.isolatepage.spec.coffee
