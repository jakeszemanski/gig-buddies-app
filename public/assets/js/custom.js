/**
 * Custom JS
 */

/*** Navbar active links ***/

$(function() {

  function getPageName(url) {
    url = url.split("/");
    url = url[url.length - 1];
    url = url.split("#");
    url = url[0];
    return url;
  }

  var currentUrl = window.location.href;
  var pageName = getPageName(currentUrl);

  $(".navbar-nav li > a[href$='" + pageName + "']").parent("li").first()
    .addClass("active");

  $(".navbar-nav > li").has(".active").first()
    .addClass("active");

});


/*** Sticky footer ***/

$(function() {
  function stickyFooter() {
    var footer = $("footer");
    var footerHeight = footer.outerHeight(true);
    $("body").css("margin-bottom", footerHeight);
  };

  setTimeout(stickyFooter,200);

  $(window).resize(function() {
    setTimeout(stickyFooter, 200);
  });
});


/*** Showcase carousel animations ***/

$(function() {

  function addAnimation(parent) {
    var elements = $(parent).find("[data-animation]");

    elements.each(function() {
      var animation = $(this).data("animation");
      $(this).addClass(animation);
    });
  };

  function removeAnimation(parent) {
    var elements = $(parent).find("[data-animation]");

    elements.each(function() {
      var animation = $(this).data("animation");
      $(this).removeClass(animation);
    });
  };

  $('#showcase-carousel').on({
    "slid.bs.carousel": function () {
      addAnimation("#showcase-carousel .item.active");
    },
    "slide.bs.carousel": function () {
      setTimeout(function() {
        removeAnimation("#showcase-carousel .item.active");
      }, 600);
    }
  });

});


/*** Smooth scroll to anchor ***/

$(function() {
  $('a[href*=#]').not('[href=#], [data-toggle], [data-slide]').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) +']');

      if (target.length) {
        $('html,body').animate({
          scrollTop: (target.offset().top - 20)
        }, 1000);

        return false;
      }
    }
  });
});


/*** UI Elements: Affix ***/

$(function() {

  $("#ui-categories").affix({
    offset: {
      top: function() {
        var elem = $("#ui-categories");
        return (this.top = elem.offset().top - 20);
      },
      bottom: function () {
        return (this.bottom = $('footer').outerHeight(true))
      }
    }
  }).on("affix.bs.affix", function() {
    var blockWidth = $(this).width();
    $(this).css("width", blockWidth);
  });

});


/*** Gallery filtering ***/

/* Requires isotope.pkgd.min.js & imagesloaded.pkgd.min.js */

/**
 * Isotope filtering
 */

$(function() {

  if( $(".isotope-container").length ) {

    // Init Isotope
    var $container = $('.isotope-container').imagesLoaded( function() {
      $container.isotope({
        itemSelector: '.isotope-item',
        layoutMode: 'fitRows'
      });
    });

    // Filter items on click
    $(".gallery__nav > li").click(function() {

      // Filter items
      var filterValue = $(this).children("a").attr('data-filter');
      $container.isotope({ filter: filterValue });

      // Change active links in navigation
      $(this).addClass("active").siblings("li").removeClass("active");

      return false;
    });

  }

});


/*** Comments ***/

/* New comment */

$(function() {

  // Expand textarea on focus, enable submit button on input

  $("form[name='comments__new'] textarea").on({
    focus: function() {
      if (!$(this).val()) {
        $(this).data("original-height", $(this).outerHeight());
      }
      $(this).animate({ "height": "68px" }, 300);
    },
    blur: function() {
      if (!$(this).val()) {
        $(this).animate({ "height": $(this).data("original-height") }, 300);
        $(this).parents("form").find("button[type='submit']").attr("disabled", "disabled");
      }
    },
    input: function() {
      $(this).parents("form").find("button[type='submit']").removeAttr("disabled");
    }
  });
});


/**
 * Setup (for preview only, remove on a production website)
 */

/* 

$(function() {

  function getPageName(url) {
    url = url.split("/");
    url = url[url.length - 1];
    url = url.split("#");
    url = url[0];
    return url;
  }

  var currentUrl = window.location.href;
  var pageName = getPageName(currentUrl);

  var isActive = "";

  pageName == "index.html" ? isActive = "active" : isActive = "";


  // Create & append setup block

  var setupBlock = '<div class="setup ' + isActive + '"> <div class="setup__trigger"> <i class="fa fa-gear"></i> </div> <div class="setup__container"> <div class="setup__block"> <h3 class="setup__heading">Layout</h3> <a href="#" class="setup__layout active" data-layout-boxed="false">Fullsize</a> <a href="#" class="setup__layout" data-layout-boxed="true">Boxed</a> </div> <div class="setup__block"> <h3 class="setup__heading">Navbar</h3> <a href="#" class="setup__navbar active" data-navbar-fixed="false">Static</a> <a href="#" class="setup__navbar" data-navbar-fixed="true">Fixed</a> </div> <div class="setup__block"> <h3 class="setup__heading">Color scheme</h3> <a href="#" class="setup__color setup__color_blue active" data-color="blue"> <span>Blue</span> </a> <a href="#" class="setup__color setup__color_green" data-color="green"> <span>Green</span> </a> <a href="#" class="setup__color setup__color_orange" data-color="orange"> <span>Orange</span> </a> <a href="#" class="setup__color setup__color_brown" data-color="brown"> <span>Brown</span> </a> </div> </div> </div>';
  $("body").append(setupBlock);


  // Trigger setup block on click

  $(".setup__trigger").click(function() {
    $(".setup").toggleClass("active");
  });


  // Close setup block on click outside

  $(document).click(function(e) {

    if ( $(".setup").hasClass("active") ) {
      var target = $(e.target);

      if (!target.closest(".setup").length)
        $(".setup").toggleClass("active");
    }

  });


  // Change layout mode

  $(".setup__layout").click(function() {

    // Change button styles
    $(".setup__layout").removeClass("active");
    $(this).addClass("active");

    // Change layout
    if ( $(this).data("layout-boxed") ) {
      $("html").addClass("html_boxed");
    } else {
      $("html").removeClass("html_boxed");
    }

  });


  // Change navbar type

  $(".setup__navbar").click(function() {

    // Change button styles
    $(".setup__navbar").removeClass("active");
    $(this).addClass("active");

    // Change navbar type
    if ( $(this).data("navbar-fixed") ) {
      $("body").addClass("body_navbar-fixed-top");
      $(".navbar").addClass("navbar-fixed-top");
    } else {
      $("body").removeClass("body_navbar-fixed-top");
      $(".navbar").removeClass("navbar-fixed-top");
    }

  });


  // Change color scheme
  $(".setup__color").click(function() {

    // Change button styles
    $(".setup__color").removeClass("active");
    $(this).addClass("active");

    //Change color scheme
    var newStylesheet = "styles_" + $(this).data("color") + ".css";
    var newStylesheetTag = '<link href="assets/css/' + newStylesheet + '" rel="stylesheet">';
    $("body").append(newStylesheetTag);

  });

});

*/