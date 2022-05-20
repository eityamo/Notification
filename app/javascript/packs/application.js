// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import '../css/application.scss'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// window.addEventListener('load', (event) => {
//     document.getElementById('scroll-down').addEventListener('click', () => {
//     // formの表示位置を取得
// 	    var form = document.getElementById('form');
//     // formまでスクロール
//         form.scrollIntoView({
//             behavior: "smooth",
//             block: "start",
//             inline: "start"
//         });
//     });
// });
