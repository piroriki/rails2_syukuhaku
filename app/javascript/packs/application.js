// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//bootstrap新規追加

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require bootstrap/dist/js/bootstrap.min 
//= require jquery/dist/jquery.js //node_modules内にあるこの行を追加

import 'jquery/dist/jquery.js'
import 'popper.js/dist/popper.js'
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap.css'


# 新規追加
function previewImage() {
    const target = this.event.target;
    const file = target.files[0];
    const reader  = new FileReader();
    reader.onloadend = function () {
        const preview = document.querySelector("#preview")
        if(preview) {
            preview.src = reader.result;
        }
    }
    if (file) {
        reader.readAsDataURL(file);
    }
  }