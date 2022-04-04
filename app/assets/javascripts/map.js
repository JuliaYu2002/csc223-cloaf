// <!--  script tag from: https://github.com/CJParkNW/valetbike/commit/f21be0e9c3e0b2a8e1dedffefbc207081902027b-->
var map = L.map('map').setView([42.32, -72.65], 13);
          
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);
          
L.marker([42.32, -72.65]).addTo(map)
 .bindPopup('Welcome to Northampton! We have Valetbike here!')
 .openPopup();