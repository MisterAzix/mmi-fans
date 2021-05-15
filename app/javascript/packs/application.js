// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.addEventListener('load', () => {
    const buttons = document.querySelectorAll('.more-com-btn')
    
    buttons.forEach(btn => {
        let count = 0
        btn.addEventListener('click', e => {
            e.preventDefault()
            let postID = btn.id.substr(9)
            Rails.ajax({
                url: btn.parentNode.action,
                type: "get",
                data: new URLSearchParams({ count: count }).toString(),
                success: function(data) {
                    document.getElementById('comment-' + postID).insertAdjacentHTML('beforeend', data.html)
                    document.getElementById('comment-' + postID).appendChild(btn.parentElement.parentElement)
                    count+=2
                }
            })
        })
    })
})