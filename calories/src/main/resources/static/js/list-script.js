const items = document.querySelectorAll('.item');

items.forEach(item => {
  item.addEventListener('click', event => {
    event.preventDefault();
    window.location.href = item.href;
  });
});
