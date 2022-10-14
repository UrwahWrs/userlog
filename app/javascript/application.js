// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false

import "controllers"
import "trix"
import "@rails/actiontext"
import "bootstrap"
// import "@popperjs/core"
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require social-share-button
//= require_tree .
//= require bootstrap-sprockets
//= require bootstrap