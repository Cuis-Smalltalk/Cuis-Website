import MiniSearch from 'https://cdnjs.cloudflare.com/ajax/libs/minisearch/7.2.0/es/index.min.js';

const list = document.querySelector('#package-list .list');
const query = document.querySelector('#package-list .search');
const sortByName = document.querySelector('#package-list .name-sort');
const sortByStars = document.querySelector('#package-list .stars-sort');
const cards = [...list.children];
list.querySelectorAll('time').forEach(time => time.textContent = new Date(time.dateTime).toLocaleString(undefined, { dateStyle: 'medium', timeStyle: 'short', hourCycle: 'h23' }));
const name = card => card.querySelector('.name a').textContent;
const stars = card => Number(card.querySelector('.stars').dataset.stars);
const texts = (card, selector) => [...card.querySelectorAll(selector)].map(element => element.textContent).join(' ');
const search = new MiniSearch({
  fields: ['name', 'owners', 'descriptions'],
  processTerm: term => Array.from(term, (_, i) => term.toLowerCase().slice(i)),
  searchOptions: { processTerm: term => term.toLowerCase(), prefix: true, fuzzy: 0.2, combineWith: 'AND', boost: { name: 2 } }
});
search.addAll(cards.map((card, id) => ({
  id,
  name: name(card),
  owners: texts(card, '.owner'),
  descriptions: texts(card, '.description')
})));

const show = () => {
  const found = query.value ? search.search(query.value).map(result => cards[result.id]) : cards;
  const sorted = sortByName.checked ? found.toSorted((a, b) => name(a).localeCompare(name(b)))
    : sortByStars.checked ? found.toSorted((a, b) => stars(b) - stars(a))
    : found;
  list.replaceChildren(...sorted);
};
const sortBy = (sort, other) => sort.addEventListener('change', () => {
  if (sort.checked) other.checked = false;
  show();
});
query.addEventListener('input', show);
sortBy(sortByName, sortByStars);
sortBy(sortByStars, sortByName);
show();
