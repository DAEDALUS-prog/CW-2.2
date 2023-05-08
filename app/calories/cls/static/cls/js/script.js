const searchBox = document.querySelector('.search-txt');
const searchBtn = document.querySelector('.search-btn');
const suggestionBox = document.querySelector('.suggestions');

searchBox.addEventListener('keyup', () => {
  let input = searchBox.value;
  suggestionBox.innerHTML = '';
  if (input) {
    fetch(`https://api.spoonacular.com/food/ingredients/autocomplete?query=${input}&number=5&apiKey=c9ec5e68c1e841a59ae29be71d052a47`)
      .then(response => response.json())
      .then(data => {
        data.forEach(item => {
          const suggestion = document.createElement('div');
          suggestion.innerHTML = item.name;
          suggestionBox.appendChild(suggestion);
        })
      })
  }
})

searchBtn.addEventListener('click', () => {
  let input = searchBox.value;
  window.location.href = `https://api.spoonacular.com/food/products/search?query=${input}&number=50&apiKey=c9ec5e68c1e841a59ae29be71d052a47`;
})


const profileBtn = document.querySelector('.button-profile');
const modal = document.querySelector('.modal');
const closeBtn = document.querySelector('.close-btn');

profileBtn.addEventListener('click', () => {
  modal.classList.add('show');
});

closeBtn.addEventListener('click', () => {
  modal.classList.remove('show');
});
