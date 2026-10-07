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

document.querySelectorAll('.workspace .page-content a[href^="http"]').forEach(link => {
  if (link.hostname === 'cuis.st') return;
  link.target = '_blank';
  link.rel = 'noopener';
  if (!link.classList.contains('video')) link.insertAdjacentHTML('beforeend', icon('external-link', 'trailing'));
});
