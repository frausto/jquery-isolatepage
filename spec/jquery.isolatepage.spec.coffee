global.jQuery = require("jquery");
$ = jQuery
require '../src/jquery.isolatepage'

describe "isolatePage", ->
  describe "loadPage", ->
    it "loads the javascript for a given page", ->
      result = 1
      $.isolatePage('setPage', "testpage", ->
        result = 2
      )
      $.isolatePage('loadPage', "testpage")
      expect(result).toEqual 2

    it "does not load the javascript for different pages", ->
      result = 1
      $.isolatePage('setPage', "testpage", ->
        result = 2
      )
      $.isolatePage('loadPage', "another")
      expect(result).toEqual 1

    it "takes arrays of different page names", ->
      result = 1
      $.isolatePage('setPage', ["testpage", "another"], ->
        result = 2
      )
      $.isolatePage('loadPage', "another")
      expect(result).toEqual 2
      result = 1
      $.isolatePage('loadPage', "testpage")
      expect(result).toEqual 2

    it "works when trying to load a page that has not been set", ->
      result = 1
      $.isolatePage('loadPage', "notset")
      expect(result).toEqual 1

    it "pages can be set mulitple times", ->
      result = 1
      second = 5
      $.isolatePage('setPage', "testpage", ->
        result = 2
      )
      $.isolatePage('setPage', "testpage", ->
        second = 9
      )
      $.isolatePage('loadPage', "testpage")
      expect(result).toEqual 2
      expect(second).toEqual 9

    it "can load multiple pages", ->
      result = 1
      second = 5
      $.isolatePage('setPage', "testpage", ->
        result = 3
      )
      $.isolatePage('setPage', "testpagetwo", ->
        second = 8
      )
      $.isolatePage('loadPage', ["testpage","testpagetwo"])
      expect(result).toEqual 3
      expect(second).toEqual 8