import MiniSearch from 'https://cdnjs.cloudflare.com/ajax/libs/minisearch/7.2.0/es/index.min.js';

const list = document.querySelector('#package-list .list');
const query = document.querySelector('#package-list .search');
const sortByName = document.querySelector('#package-list .name-sort');
const cards = [...list.children];
list.querySelectorAll('time').forEach(time => time.textContent = new Date(time.dateTime).toLocaleString(undefined, { dateStyle: 'medium', timeStyle: 'short', hourCycle: 'h23' }));
const name = card => card.querySelector('.name a').textContent;
const search = new MiniSearch({
  fields: ['name', 'descriptions'],
  processTerm: term => Array.from(term, (_, i) => term.toLowerCase().slice(i)),
  searchOptions: { processTerm: term => term.toLowerCase(), prefix: true, fuzzy: 0.2, combineWith: 'AND', boost: { name: 2 } }
});
search.addAll(cards.map((card, id) => ({
  id,
  name: name(card),
  descriptions: [...card.querySelectorAll('.description')].map(description => description.textContent).join(' ')
})));

const show = () => {
  const found = query.value ? search.search(query.value).map(result => cards[result.id]) : cards;
  list.replaceChildren(...(sortByName.checked ? found.toSorted((a, b) => name(a).localeCompare(name(b))) : found));
};
query.addEventListener('input', show);
sortByName.addEventListener('change', show);
show();
