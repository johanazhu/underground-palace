// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import $ from 'jquery'
import {} from 'jquery-ujs'

// for view/articles/feed.html.erb
$(function() {
    $(".nav-link").on('click', function () {
      $(".nav-link").removeClass("active");
      $(this).addClass("active");
    })

});