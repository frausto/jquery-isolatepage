// Generated by CoffeeScript 1.3.3
(function() {

  (function($) {
    var methods, page_scripts;
    page_scripts = {};
    methods = {
      setPage: function(page_names, page_function) {
        var name, _i, _len;
        page_names = $.makeArray(page_names);
        for (_i = 0, _len = page_names.length; _i < _len; _i++) {
          name = page_names[_i];
          page_scripts[name] = $.makeArray(page_scripts[name]);
          page_scripts[name].push(page_function);
        }
        return this;
      },
      loadPage: function(page_names) {
        var body, functions, page_function, page_name, _i, _j, _len, _len1;
        body = $("body");
        page_names = $.makeArray(page_names);
        for (_i = 0, _len = page_names.length; _i < _len; _i++) {
          page_name = page_names[_i];
          functions = $.makeArray(page_scripts[page_name]);
          for (_j = 0, _len1 = functions.length; _j < _len1; _j++) {
            page_function = functions[_j];
            page_function.apply(body);
          }
        }
        return this;
      }
    };
    return $.isolatePage = function(method) {
      if (methods[method]) {
        return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
      }
      return $.error('Method ' + method + ' does not exist on jQuery.isolatePage');
    };
  })(jQuery);

}).call(this);
