/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var data = [];
var curG;
function getData() {
    this.curG = document.getElementById('curG');

    var imageID = document.getElementsByName('imageID');
    var imageData = document.getElementsByName('imageData');


    for (var i = 0; i < imageID.length; i++) {
        var a = imageID[i];
        var b = imageData[i];

        data[i] = {
            "id": a,
            "img": b
        };
    }

}
let index = 0;
let userClick = 0;
var slideShow = setInterval(function () {
    if (userClick > 0) {
        clearInterval(slideShow);
    } else {
        index++;
        if (index >= data.length) {
            index = 0;
        }
        var html = '';
        html += '<div>';
        html += '<span class="content-img-span">';
        html += '<a href="Gallery?id=' + curG.value + '&img=' + data[index].id.value + '">';
        html += '<img src="data:image/png;base64,' + data[index].img.value + '" alt="lorem ipsum dolor sit amet"></a>';
        html += '</span">';
        html += '</div>';
        html += '<a class="prev" onclick="preSlide()">&#10094;</a><a class="next" onclick="nextSlides()">&#10095;</a>';
        document.getElementById("imgSlide").innerHTML = html;
    }

}, 2000);

function nextSlides() {
    index++;

    showSlides(index);

}

function preSlide() {
    index--;

    showSlides(index);
}

function showSlides(id) {
    userClick = 1;
    if (id >= data.length) {
        index = 0;

    }
    if (id < 0) {
        index = data.length - 1;
    }

    var html = '';
    html += '<div>';

    html += '<a href="Gallery?id=' + curG.value + '&img=' + data[index].id.value + '">';
    html += '<span class="main-img-span">';
    html += '<img src="data:image/png;base64,' + data[index].img.value + '" alt="lorem ipsum dolor sit amet">';
    html += '</span">';
    html += '</a>';

    html += '</div>';
    html += '<a class="prev" onclick="preSlide()">&#10094;</a><a class="next" onclick="nextSlides()">&#10095;</a>';
    document.getElementById("imgSlide").innerHTML = html;
    document.getElementById("imgSlide").innerHTML = html;

}
let perPage = 8;
let curPage = 1;
let start = (curPage - 1) * perPage;
let end = start + perPage;

function renderImages() {

    html = '';
    var index = 0;
    /*
     <div class="row">
     <div class="column">
     <img class="hover-shadow cursor">
     </div>
     <div class="column">
     <img class="hover-shadow cursor">
     </div>
     <div class="column">
     <img class="hover-shadow cursor">
     </div>
     <div class="column">
     <img class="hover-shadow cursor">
     </div>
     </div>
     */
//    html += '  <div class="row">';
    for (var i = start; i < data.length && i < end; i++) {
//        if (Math.floor(index % 4) == 0 && index != 0) {
//            html += '  </div>';
//            html += '  <div class="row">';
//        }
//        html += '<div class="column">';
        html += '<div class="content-div-left  hover-shadow cursor">';
        html += '<span class="content-img-span">';
        html += '<a href="Gallery?id=' + curG.value + '&img=' + data[i].id.value + '">';
        html += '<img class="content-img-left" src="data:image/png;base64,' + data[i].img.value + '" alt="lorem ipsum dolor sit amet">';
        html += '</span>';
        html += '</a>';
        html += '</div>';
//        html += ' </div>';

        index++;

    }
    ;


    document.getElementById("allImg").innerHTML = html;
}
function btnPageG() {

    var html = '';
    var num = Math.floor((data.length / 8) + (Math.floor(data.length % 8) === 0 ? 0 : 1));


    for (var i = 1; i <= num; i++) {

        html += '<button onclick="pagingGClick(' + i + ')">' + i + '</button>';

    }
    document.getElementById("btnPageG").innerHTML = html;
}
function pagingGClick(cur) {

    perPage = 8;
    curPage = cur;
    start = (curPage - 1) * perPage;
    end = start + perPage;
    renderImages();
}
