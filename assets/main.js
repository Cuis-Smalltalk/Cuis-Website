const icon = (name, modifier = '') => `<svg class="icon ${modifier}"><use href="/assets/icons.svg#${name}"></use></svg>`;

document.querySelectorAll('code.copy').forEach(code => {
  const button = document.createElement('button');
  button.title = 'Copy';
  button.innerHTML = icon('copy');
  button.onclick = async () => {
    await navigator.clipboard.writeText(code.textContent);
    button.innerHTML = icon('check');
    setTimeout(() => button.innerHTML = icon('copy'), 1500);
  };
  const wrapper = document.createElement('span');
  wrapper.className = 'copyable';
  code.replaceWith(wrapper);
  wrapper.append(code, button);
});

document.querySelectorAll('.page-content a[href^="http"]').forEach(link => {
  if (link.hostname === 'cuis.st') return;
  link.target = '_blank';
  link.rel = 'noopener';
  if (!link.classList.contains('video')) link.insertAdjacentHTML('beforeend', icon('external-link', 'trailing'));
});

document.querySelectorAll('.slideshow').forEach(slideshow => {
  const track = slideshow.querySelector('.slides');
  const slides = [...track.children];
  if (slides.length < 2) return;

  const button = (className, label, content = '') => {
    const button = document.createElement('button');
    button.className = className;
    button.setAttribute('aria-label', label);
    button.innerHTML = content;
    return button;
  };
  const current = () => Math.round(track.scrollLeft / track.clientWidth);
  const show = index => track.scrollTo({ left: index * track.clientWidth });

  const previous = button('step', 'Previous screenshot', icon('chevron-left'));
  const next = button('step', 'Next screenshot', icon('chevron-right'));
  const dots = slides.map((_, index) => button('dot', `Screenshot ${index + 1}`));
  previous.onclick = () => show(current() - 1);
  next.onclick = () => show(current() + 1);
  dots.forEach((dot, index) => dot.onclick = () => show(index));

  const update = () => {
    const index = current();
    previous.disabled = index === 0;
    next.disabled = index === slides.length - 1;
    dots.forEach((dot, i) => dot.setAttribute('aria-current', i === index));
  };
  track.addEventListener('scroll', update, { passive: true });
  update();

  const controls = document.createElement('div');
  controls.className = 'slide-controls';
  controls.append(previous, ...dots, next);
  slideshow.prepend(controls);
  slideshow.classList.add('enhanced');
});
