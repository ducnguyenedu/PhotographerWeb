/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var data = [];

function getData() {

    var homePageDisplayID = document.getElementsByName('homePageDisplayID');
    var homePageDisplayName = document.getElementsByName('homePageDisplayName');
    var homePageDisplayDescription = document.getElementsByName('homePageDisplayDescription');
    var homePageDisplayImg = document.getElementsByName('homePageDisplayImg');

    for (var i = 0; i < homePageDisplayID.length; i++) {
        var a = homePageDisplayID[i];
        var b = homePageDisplayName[i];
        var c = homePageDisplayDescription[i];
        var d = homePageDisplayImg[i];
        data[i] = {
            "id": a,
            "name": b,
            "description": c,
            "img": d

        };
    }

}
let perPage = 3;
let curPage = 1;
let start = (curPage - 1) * perPage;
let end = start + perPage;

function renderGallery() {

    html = '';
    var count = 1;
    for (var i = start; i < data.length && i < end; i++) {
        
        html += '<div class="content-div-left">';
        html += ' <img class="content-img-left" src="data:image/png;base64,' + data[i].img.value + '"/>';
        html += '<h2><a href="Gallery?id=' + data[i].id.value + '">View ' + data[i].name.value + '</a></h2>';
        html += ' <p>' + data[i].description.value + '</p>';
        html += '</div>';
        console.log(data[i].name.value);
        count++;
    }
    ;

    document.getElementById("galleryDisplay").innerHTML = html;


}
function btnPage() {

    var html = '';
    var num = Math.floor((data.length / 3) + (Math.floor(data.length % 3) === 0 ? 0 : 1));


    for (var i = 1; i <= num; i++) {

        html += '<button onclick="pagingClick(' + i + ')">' + i + '</button>';

    }
    document.getElementById("btnPage").innerHTML = html;
}
function pagingClick(cur) {
    perPage = 3;
    curPage = cur;
    start = (curPage - 1) * perPage;
    end = start + perPage;
    renderGallery();
}
