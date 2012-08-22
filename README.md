IsolatePage JQuery Plugin
================================

A plugin for managing what javascript gets loaded per page, so your code can remain nice and isolated not being loaded where it's not wanted. Get rid of nasty collisions and wasted time spent loading javascript you dont need, and still be able to have all your javascript cached and loaded in one request!

Installation
-------------------------

Just include the source file. All examples are in coffeescript, but you can install the plugin using either the coffeescript or the javascript file depending on your preference. Obviously this plugin depends on JQuery.

```html
<script type="text/javascript" src="yourfiles/jquery.isolatepage.min.js"></script>
```

Usage
-------------------------

1. You can set the javascript for a page:

  ```coffeescript
  $.isolatePage('setPage', 'testpage', ->
    #PAGE SPECIFIC CODE GOES HERE
  )
  ```

2. You load the javascript for a page you have setup using:

  ```coffeescript
  $.isolatePage('loadPage', 'testpage')
  ```

3. You can set the javascript for multiple pages:

  ```coffeescript
  $.isolatePage('setPage', ['testpage', 'onemore'], ->
    #PAGE SPECIFIC CODE GOES HERE
  )
  ```

4. You load the javascript for multiple pages:

  ```coffeescript
  $.isolatePage('loadPage', ['testpage','onemore','idontexistyet'])
  ```

Examples (coffeescript)
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

Check out the specs for more coffeescript examples

Examples (javascript)
-------------------------------
Here are similar examples in javascript

```javascript
$.isolatePage('setPage', "page_id", function() {
  $(".dontseeme").hide();
});
```

```javascript
$.isolatePage('setPage', ["testpageone", "testpagetwo"], function() {
  $(".dontseeme").fadeOut();
});
```

```javascript
$.isolatePage('setPage', "testpagetwo", function() {
  $(".hidemore").hide();
});
```

```javascript
$(document).ready(function() {
  var body, page_name;
  body = $("body");
  page_name = $.trim(body.prop("id"));
  $.isolatePage('loadPage', page_name);
});
```

In the above example, on pages with the body id set to "page_id", the elements with the "dontseeme" class are immediatly hidden. On pages with the id "testpageone" or "testpagetwo" they fade away. Pages with the id "testpagetwo" also hide things with class "hidemore", you can set the javascript for any given "page" multiple times if you want.

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
