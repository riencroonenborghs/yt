var Yt = function($) {
  var modules = [];
  function subscribe(module) {
    modules.push(module);
  }

  function init() { $(modules).each(function(i,e) { e.init(); }); }

  return {
    init: init,
    subscribe: subscribe
  }
}(jQuery);

jQuery(document).ready(function(event){
  Yt.init();
});