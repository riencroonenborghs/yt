Yt.Footer = function(parent, $){
  
  function init(){ 
    push_footer_down();
  }

  function push_footer_down() {
    var doc_height = $(document).height();
    var nav_height = $('.navbar-default').height();
    var jumbotron_height = $('.jumbotron').height();
    var main_height = $('.main').height();
    var footer_height = $('.footer').height() ;

    $('.footer').css('margin-top',
      doc_height - (nav_height + jumbotron_height + main_height) - footer_height - 40
    );
  }

  var return_list =  {
    init: init
  }
  parent.subscribe(return_list);
  
  return return_list;
}(Yt, jQuery);



