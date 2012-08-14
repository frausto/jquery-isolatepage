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