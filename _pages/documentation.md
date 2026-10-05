---
permalink: /documentation/
layout: page
icon: book-open
window: workspace
title: Documentation
description: "Everything to learn and use Cuis."
---

{% assign source = "https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/blob/master/Documentation/" %}

<nav class="shelves">
  <a href="#get-started">Get started</a>
  <a href="#ideas">Ideas and history</a>
  <a href="#learn">Learn</a>
  <a href="#guides">Guides</a>
  <a href="#talks">Talks</a>
  <a href="#papers">Papers</a>
  <a href="#see-also">See also</a>
</nav>

## Get started {#get-started}

<p class="skip">Already running Cuis? Skip to <a href="#learn">Learn</a>.</p>

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
        <span data-method="git">Clone the latest stable release: <code class="copy">git clone https://github.com/Cuis-Smalltalk/Cuis7-8.git</code></span>
        <span data-method="zip"><a href="https://github.com/Cuis-Smalltalk/Cuis7-8/archive/refs/heads/main.zip">Download</a> the latest stable release and unzip it.</span>
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
    <h3>Rolling Release</h3>
    <p>Want the newest stuff, found a bug, or want to contribute? Go for the <a href="https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev">Cuis Rolling Release</a>. Same steps as above.</p>
  </div>
</div>

<div class="note" markdown="1">
<svg class="icon"><use href="{{ "/assets/icons.svg#info" | relative_url }}"></use></svg>

Cuis doesn't touch anything else on your system. Want to remove it? Just delete the Cuis folder. That's all.

</div>

## Ideas and history {#ideas}

The ideas behind Smalltalk and Cuis, and why they are the way they are.

<ul class="doc-list">
  <li>
    <a href="https://www.cs.virginia.edu/~evans/cs655/readings/smalltalk.html">Design Principles Behind Smalltalk</a>
    <p>The purpose of the Smalltalk project is to provide computer support for the creative spirit in everyone.</p>
  </li>
  <li>
    <a href="{{ "/overview" | relative_url }}">About Cuis Smalltalk</a>
    <p>What Cuis is, the philosophy behind it, and the origin of its name.</p>
  </li>
  <li>
    <a href="{{ "/documentation/why-smalltalk-80" | relative_url }}">Cuis is a Smalltalk-80 system. Why?</a>
    <p>So, {{ site.time | date: "%Y" | minus: 1980 }} years after Smalltalk-80, what does it mean to say that Cuis is a Smalltalk-80 system?</p>
  </li>
  <li>
    <a href="{{ source }}Philosophical/OnMakingDynabooksReal.md">Making Dynabooks Real</a>
    <p>A great email message from Alan Kay on the Dynabook.</p>
  </li>
  <li>
    <a href="{{ source }}CuisHistory.md">A short history of Cuis</a>
    <p>In 2003, Juan Vuletich, by then an active collaborator in the Squeak project, decided that a zoomable and scalable GUI was needed for Smalltalk.</p>
  </li>
  <li>
    <a href="{{ "/quotes" | relative_url }}">Nice comments about Cuis</a>
    <p>This is what the creators of Smalltalk and Morphic, and other prominent Smalltalk users have said about Cuis.</p>
  </li>
</ul>

## Learn {#learn}

<p class="skip">Already know Smalltalk? Skip to <a href="#guides">Guides</a>.</p>

<div class="row">
  <div class="col">
    <h3>The Cuis Book</h3>
    <img src="{{ "/assets/imgs/documentation/book.png" | relative_url }}" class="doc">
    <p><a href="https://DrCuis.github.io/TheCuisBook">The Cuis book.</a> It is all about programming Smalltalk with Cuis. Whether you want to learn programming or to discover what Smalltalk has to offer, the book guides you in a journey to learn both the language, the tools and to code a modest replica of the <em>Spacewar!</em> game. Written by Hilaire Fernandes with Ken Dickey and Juan Vuletich. You can also download the <a href="https://github.com/DrCuis/TheCuisBook/releases/latest/download/TheCuisBook.pdf">pdf version</a>.</p>
  </div>

  <div class="col">
    <h3>The Cuis Documentation Project</h3>
    <img src="{{ "/assets/imgs/documentation/wiki.png" | relative_url }}" class="doc">
    <p>If you are learning Smalltalk, the Cuis Documentation Project can help you.  The documentation is presented in Tutorials, How-to guides, References and Explanations.<br><a href="http://doc.cuis.st">read more</a></p>
  </div>

  <div class="col">
    <h3>More introductions</h3>
    <p>For an overview of Cuis, read the <a href="https://github.com/DrCuis/Learning-Cuis">Learning Cuis</a> page. Mark's <a href="https://mvolkmann.github.io/blog/smalltalk/01-quick-introduction/">blog</a> offers a quick introduction to Smalltalk that is well worth reading; be sure to also check out his other pages about Cuis Smalltalk.</p>
    <p>A great <a href="https://www.youtube.com/playlist?list=PLMkq_h36PcLCtLKrrdOKKFV2r267VFH_t">series of introductory videos</a> in Spanish by Hernán Wilkinson.</p>
    <p>An <a href="https://www.youtube.com/watch?v=8GRwNM3hBDA">introductory video</a> from Reykjavik University.</p>
  </div>
</div>
<div class="row">
  <div class="col">
    <h3>The Morph Books</h3>
    <p><a href="https://DrCuis.github.io/DesignGUI">The Morph Book vol. I - Designing Graphic User Interfaces.</a> Learn how to design simple graphic user interface with Morph objects. The book tutors you to learn both fundamental facets of Morph and design patterns applied to GUI developments.</p>
    <p><a href="https://DrCuis.github.io/TheArtOfMorph">The Morph Book vol. II - The Art of Morph.</a> Learn how to design from scratch your own morph with the Cuis' Morphic 3 framework.</p>
  </div>

  <div class="col">
    <h3>Smalltalk-80 books</h3>
    <p>Additionally, there are many tutorials and references for Smalltalk in the web. They apply quite well to Cuis, especially those written originally for Smalltalk-80 or Squeak. These books <a href="http://stephane.ducasse.free.fr/FreeBooks/BlueBook/Bluebook.pdf">“Smalltalk-80 the language and its implementation”</a> and <a href="http://stephane.ducasse.free.fr/FreeBooks/InsideST/InsideSmalltalk.pdf">“Inside Smalltalk volume I”</a> are great introductory texts, and they are also the reference for the language and basic class library. Both are freely available. Read other references from <a href="http://stephane.ducasse.free.fr/FreeBooks/">Stef’s Free Online Smalltalk Books</a> collection.</p>
    <p><strong>Inside Smalltalk volume I</strong> is an excellent introduction to Smalltalk-80. The browser and other tools look outdated, but all the concepts are fully up to date. Don’t pay much attention to chapters 9 and 10, though. Cuis is several generations more modern than the classic MVC GUI.</p>
    <p><strong>Smalltalk-80 the language and its implementation</strong>, the Blue Book, is the first book devoted to Smalltalk-80. It is a great introduction to OOP and Smalltalk. As above, MVC and Pen are outdated with respect to Cuis.</p>
  </div>
</div>

## Guides {#guides}

How to work with Cuis, from everyday tasks to its internals.

<div class="split">
  <div>
    <h3>Basics</h3>
    <ul class="doc-list">
      <li>
        <a href="{{ source }}CuisDirectoryStructure.md">Directory Structure of Cuis Smalltalk</a>
        <p>The Cuis Rolling Release Repo includes a 64 bit Cuis image, a selection of optional packages, and a Virtual Machine to let it run on the main PC platforms.</p>
      </li>
      <li>
        <a href="{{ "/documentation/managing-your-code" | relative_url }}">Managing your code in Cuis</a>
        <p>Code that is not part of the Cuis Core image itself, like applications, frameworks and libraries, should be stored in Packages.</p>
      </li>
      <li>
        <a href="{{ "/documentation/managing-your-code#using-git-and-github" | relative_url }}">Using Git and GitHub to host and manage Cuis code</a>
        <p>Cuis doesn't do version control by itself. Instead, we suggest using external VCS tools.</p>
      </li>
      <li>
        <a href="{{ "/documentation/code-recovery" | relative_url }}">Code Recovery in Cuis</a>
        <p>To recover our code, the [recent changes] button in FileList will open a ChangeList on the selected file.</p>
      </li>
      <li>
        <a href="{{ source }}AdditionalPackagesForCuis.md">Additional Packages for Cuis</a>
        <p>Optional functionality, that can be loaded as needed, is stored in separate code Packages.</p>
      </li>
      <li>
        <a href="{{ source }}CuisReleaseProcess.md">The Cuis Smalltalk Release Process</a>
        <p>This document describes the Process to handle Stable Releases for Cuis.</p>
      </li>
      <li>
        <a href="{{ "/documentation/getting-help" | relative_url }}">Getting help with Cuis</a>
        <p>In the Cuis community, questions are most welcome. The main place for them is our mail list.</p>
      </li>
      <li>
        <a href="https://github.com/nmingotti/The-Cuis-CookBook/wiki">The Cuis CookBook Wiki</a>
        <p>The community is gathering various pieces of advice and information at The Cuis CookBook Wiki.</p>
      </li>
    </ul>
  </div>
  <div>
    <h3>Advanced</h3>
    <ul class="doc-list">
      <li>
        <a href="{{ source }}Technical/VM/TheOpenSmalltalkVM.md">The Open Smalltalk VM</a>
        <p>Cuis runs on the Open Smalltalk VM. The latest release of this VM is included in the CuisVM.app folder.</p>
      </li>
      <li>
        <a href="{{ source }}Technical/VM/BuildYourOwnVM.md">Build your own VM</a>
        <p>If you are comfortable using Linux tools (gcc, make, ld), you can build the OpenSmalltalk VM yourself.</p>
      </li>
      <li>
        <a href="{{ source }}Technical/VM/HowToBuildMacUnifiedVM.md">How to create a Mac Unified VM</a>
        <p>This procedure builds a Mac VM that includes both the Apple Silicon and Intel binaries and runs natively on both flavors of Mac hardware.</p>
      </li>
      <li>
        <a href="{{ source }}Technical/VM/HowToBuildCuisVMBundle.md">How to build the CuisVM.app multiplatform VM bundle</a>
        <p>This procedure bundles together the VMs for various platforms. The result is the VM we include with Cuis.</p>
      </li>
      <li>
        <a href="{{ source }}Technical/FFI/AQuickOrientationToFFIFromSmalltalk.md">A Quick Orientation To FFI From Smalltalk</a>
        <p>So you want to interact with some library written in C from Smalltalk, and you want the convenience of interfacing from the image itself.</p>
      </li>
      <li>
        <a href="{{ source }}Technical/FFI/CuisFFIPrimer.md">Cuis FFI Primer</a>
        <p>Cuis has the ability to interoperate with foreign code that conforms to a given platform's Application Binary Interface (ABI) specification.</p>
      </li>
      <li>
        <a href="{{ source }}Technical/FFI/FFIorVMPluginsWhatToUse.md">FFI or VM Plugins, what to use?</a>
        <p>There are two main ways to call external code in the Cuis / Squeak world.</p>
      </li>
      <li>
        <a href="{{ source }}Technical/ASemanticsForEphemerons.md">A semantics for Ephemerons (& Weak Referrers)</a>
        <p>A Smalltalk system is composed of a live object graph, which is the transitive closure of the objects reachable from the roots.</p>
      </li>
      <li>
        <a href="{{ source }}Technical/UsefulTips.md">Some useful tips to keep in mind</a>
        <p>VM dump of Smalltalk processes: the VM will dump the stack traces of all processes to stdout.</p>
      </li>
    </ul>
  </div>
</div>

## Talks {#talks}

Presentations and podcasts on Cuis Smalltalk.

{% assign talks = site.data.talks | sort: 'date' | reverse %}
{% include videos.html videos=talks %}

## Papers {#papers}

Papers on aspects of Cuis Smalltalk.

<ul class="doc-list">
  <li>
    <a href="{{ source }}Papers/2013-09-PrefilteringAntiAliasingForGeneralVectorGraphics.pdf">Prefiltering Antialiasing for General Vector Graphics</a>
    <p>This work presents a simple and practical technique for the rasterization of general vector graphics with correct prefiltering antialiasing.</p>
    <p>Juan Vuletich · 2013-09</p>
  </li>
  <li>
    <a href="{{ source }}Papers/2022-11-UnicodeSupportInCuisSmalltalk.pdf">Unicode support in Cuis Smalltalk</a>
    <p>It describes the approach used to support Unicode in Smalltalk source code and generally in Text objects.</p>
    <p>Juan Vuletich · 2022-11 · FAST Workshop 2022</p>
  </li>
</ul>

## See also {#see-also}

- A [playlist of videos about Cuis](https://www.youtube.com/playlist?list=PLbevs6Mp0MMMaR5gSYzJQXQ56OplFSCJk).
- The [Monthly Community Meetings]({{ "/community#past-meetings" | relative_url }}), recorded in video.
