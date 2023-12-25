// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'flowbite';
//import { initFlowbite } from "flowbite";

addEventListener("turbo:before-stream-render", (event) => {
  const originalRender = event.detail.render
  console.log("turbo:before-stream-render")
  event.detail.render = function (streamElement) {
    originalRender(streamElement)    
    initFlowbite();
  }
})

