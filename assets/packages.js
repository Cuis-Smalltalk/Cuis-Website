import MiniSearch from 'https://cdnjs.cloudflare.com/ajax/libs/minisearch/7.2.0/es/index.min.js';

const list = document.querySelector('#package-list .list');
const query = document.querySelector('#package-list .search');
const cards = [...list.children];
list.querySelectorAll('time').forEach(time => time.textContent = new Date(time.dateTime).toLocaleString(undefined, { dateStyle: 'medium', timeStyle: 'short', hourCycle: 'h23' }));
const name = card => card.querySelector('.name a').textContent;
const number = (card, selector, key) => Number(card.querySelector(selector).dataset[key]);
const orders = new Map([
  [document.querySelector('#package-list .name-sort'), (a, b) => name(a).localeCompare(name(b))],
  [document.querySelector('#package-list .stars-sort'), (a, b) => number(b, '.stars', 'stars') - number(a, '.stars', 'stars')],
  [document.querySelector('#package-list .activity-sort'), (a, b) => number(b, '.activity', 'commits') - number(a, '.activity', 'commits')]
]);
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
  const order = [...orders].find(([sort]) => sort.checked)?.[1];
  list.replaceChildren(...(order ? found.toSorted(order) : found));
};
orders.forEach((_, sort) => sort.addEventListener('change', () => {
  if (sort.checked) orders.forEach((_, other) => other.checked = other === sort);
  show();
}));
query.addEventListener('input', show);
show();
