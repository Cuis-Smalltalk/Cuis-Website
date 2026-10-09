---
permalink: /documentation/
layout: page
icon: book-open
window: workspace
title: Documentation
description: "Everything to learn and use Cuis."
---

## Get started {#get-started}

<p class="skip">Already running Cuis? Skip to <a href="{{ "/documentation/tutorials/" | relative_url }}">Tutorials</a>.</p>

<div class="kickstart">
  <div class="setup">
    <div class="choices" hidden>
      <div class="choice-group">
        <span id="choice-os">I’m on</span>
        <div class="choice" role="group" aria-labelledby="choice-os">
          <button type="button" data-set="os" value="mac">macOS</button>
          <button type="button" data-set="os" value="linux">Linux</button>
          <button type="button" data-set="os" value="windows">Windows</button>
        </div>
      </div>
      <div class="choice-group">
        <span id="choice-method">and I’ll use</span>
        <div class="choice" role="group" aria-labelledby="choice-method">
          <button type="button" data-set="method" value="git">Git</button>
          <button type="button" data-set="method" value="zip">Zip</button>
        </div>
      </div>
    </div>
    <ol>
      <li>
        <span data-method="git">Clone Cuis: <code class="copy">git clone --depth 1 https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev.git</code></span>
        <span data-method="zip"><a href="https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/archive/refs/heads/master.zip">Download</a> Cuis and unzip it.</span>
      </li>
      <li>
        <span data-os="mac" data-method="git">Double click <code>RunCuisOnFinder.command</code>, or run <code class="copy">./RunCuisOnMac.sh</code> in a Terminal.</span>
        <span data-os="mac" data-method="zip">Open a Terminal on the Cuis folder and run <code class="copy">./unquarantine.sh</code>, so macOS lets you run it. Then double click <code>RunCuisOnFinder.command</code>.</span>
        <span data-os="linux">Run <code class="copy">./RunCuisOnLinux.sh</code> from a terminal on the Cuis folder.</span>
        <span data-os="windows">Double click <code>RunCuisOnWindows.bat</code>.</span>
      </li>
      <li>Take the <a href="https://github.com/DrCuis/Tutorials/tree/main/100-Quick-Tour">Quick UI Tour</a> to find your way around.</li>
      <li>Open the Terse Guide, a handy guide and reference, from <kbd>World Menu</kbd> > <kbd>Help</kbd> > <kbd>Terse Guide to Cuis</kbd>.</li>
    </ol>
  </div>
</div>
<script>
(() => {
  const setup = document.querySelector('.setup');
  const platform = (navigator.userAgentData && navigator.userAgentData.platform) || navigator.platform || navigator.userAgent;
  const state = {
    os: /win(dows|32|64)/i.test(platform) ? 'windows' : /linux|x11|cros/i.test(platform) ? 'linux' : 'mac',
    method: 'git'
  };
  const render = () => {
    setup.querySelectorAll('[data-set]').forEach(button => button.setAttribute('aria-pressed', state[button.dataset.set] === button.value));
    setup.querySelectorAll('[data-os], [data-method]').forEach(variant => {
      variant.hidden = Boolean(variant.dataset.os && variant.dataset.os !== state.os) || Boolean(variant.dataset.method && variant.dataset.method !== state.method);
    });
  };
  setup.querySelectorAll('[data-set]').forEach(button => button.addEventListener('click', () => {
    state[button.dataset.set] = button.value;
    render();
  }));
  setup.querySelector('.choices').hidden = false;
  render();
})();
</script>

<div class="row">
  <div class="col versions-browser">
    <h3>Why the rolling release?</h3>
    <p>It's where Cuis evolves, with new features, bug fixes and package updates. <a href="{{ "/documentation/reference/release-process" | relative_url }}">Stable releases</a> only receive fixes for serious bugs, while packages keep moving forward with the rolling release, so using a stable release means knowing which version of each package matches it. That fits experienced users with specific needs, such as projects already built on one that don't need to follow ongoing development. Just starting? The rolling release is the way to go.</p>
  </div>
</div>

<div class="note" markdown="1">
<svg class="icon"><use href="{{ "/assets/icons.svg#lightbulb" | relative_url }}"></use></svg>

Cloned with Git? You only got the latest commit. Run <code class="copy">git fetch --unshallow</code> in the Cuis folder to get the full history.

</div>

<div class="note" markdown="1">
<svg class="icon"><use href="{{ "/assets/icons.svg#info" | relative_url }}"></use></svg>

Cuis doesn't touch anything else on your system. Want to remove it? Just delete the Cuis folder. That's all.

</div>

<div class="row contents">
  {%- assign sections = "tutorials how-to-guides reference explanation talks" | split: " " %}
  {%- for name in sections %}
  {%- assign url = "/documentation/" | append: name | append: "/" %}
  {%- assign section = site.docs | where: "url", url | first %}
  <a class="col" id="{{ name }}" href="{{ section.url | relative_url }}">
    <h2>{{ section.title }}</h2>
    {%- if section.description %}
    <p>{{ section.description }}</p>
    {%- endif %}
  </a>
  {%- endfor %}
</div>
