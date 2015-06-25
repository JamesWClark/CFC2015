







window.onload = changeSlide;

function displayTime() {
	var element = document.getElementById('clock');
	var now = new Date();
	var options = {
		hour: '2-digit',
		minute: '2-digit',
		second: '2-digit'
	}
	element.innerHTML = 
		now.toLocaleString(navigator.language, options);
	setTimeout(displayTime, 1000);
}

















//an array of references to images
var images = [
	'img/skyrim1.jpg',
	'img/skyrim2.jpg',
	'img/skyrim3.jpg'
];

var delay = 3000; //milliseconds
var img = document.getElementById('slides');
var count = 0;
function changeSlide(number) {
	img.src = images[count];
	if(count < images.length - 1) {
		count++;
	} else {
		count = 0;
	}
	setTimeout(changeSlide, delay);
}


function showImage(path) {
	console.log(path);
	img.src = path;
	return false;
}