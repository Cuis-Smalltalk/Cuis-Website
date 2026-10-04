---
---

const icon = name => `<svg class="icon"><use href="{{ "/assets/icons.svg" | relative_url }}#${name}"></use></svg>`;

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
