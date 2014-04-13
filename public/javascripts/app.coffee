App= ()->
  this.init()

App::actions= ()->
  $('.nav>.ul-wrap>ul>li').unbind('hover').hover(
    ()->
      $(this).addClass 'hovered'
      return
    ()->
      $(this).removeClass 'hovered'
      return
  )

  $('.left.btn')
    .unbind('click')
    .click (e)->
      e.preventDefault()
      $('div.slider').slickPrev()

  $('.right.btn')
    .unbind('click')
    .click (e)->
      e.preventDefault()
      $('div.slider').slickNext()

  return

App::init= ()->
  $(window).scroll ()->
    if $(this).scrollTop() > 450
      if !$('body').hasClass 'fixed-header'
        $('body').addClass 'fixed-header'
    else
      $('body').removeClass 'fixed-header'

  window.slideShow = $('div.slider').slick(
    autoplaySpeed: 6000
    autoplay: true
    arrows: false
    onAfterChange: (el,index)->
      slideClass = $('.slide:not(.slick-cloned)').eq(index).attr('data-slideshow-class')
      $('.slideshow')
        .removeClass('home blue red')
        .addClass(slideClass)
      null
  )

  @actions()
  this


app = new App()

