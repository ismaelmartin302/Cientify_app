const dot = document.querySelector('img');
var size = 100
dot.style.width = size + 'px';
dot.style.height = size + 'px';
function mouseMove(event) {
    dot.style.left = event.clientX - size / 2 + 'px';
    dot.style.top = event.clientY - size / 2 + 'px';
}