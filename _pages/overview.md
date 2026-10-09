---
permalink: /overview
layout: page
icon: compass
window: package-downloader
title: Overview
description: "What Cuis is, and what sets it apart from other Smalltalks."
---

Cuis is an Open Source, multiplatform [Smalltalk-80](https://en.wikipedia.org/wiki/Smalltalk) system.

<div class="overview" markdown="1">

<div class="row summary" markdown="1">
<div markdown="1">

### Above all, it is

- Small
- Clean
- Appropriable

</div>
<div markdown="1">

### Like any Smalltalk system, it is also

- A complete development environment written in itself
- A pure, dynamic Object Oriented language

</div>
</div>

Cuis assumes very little on the underlying platform, and this lets it run **out-of-the-box** on **Windows, macOS, Linux, ChromeOS and web browsers**. Cuis runs on the [OpenSmalltalk Virtual Machine](https://opensmalltalk.org).

</div>

## Highlights

<div class="row">
  <div class="col">
    <h3>Package</h3>
    <img src="./assets/imgs/features/package.png" class="doc">
    <p>Code management in Cuis is done with its package system and your preferred VCS. Cuis development is done on GitHub.<br><a href="{{ "/documentation/how-to-guides/managing-your-code" | relative_url }}">read more</a></p>
  </div>

  <div class="col">
    <h3>Refactoring tools</h3>
    <img src="./assets/imgs/features/refactoring.png" class="doc">
    <p>The Cuis source code browser comes equipped with a set of refactoring features.<br><a href="https://github.com/hernanwilkinson/Cuis-Smalltalk-Refactoring">read more</a></p>
  </div>
</div>

<div class="row">
  <div class="col">
    <h3>Morphic 3 / Vector Graphics</h3>
    <img src="./assets/imgs/features/morphic3.png" class="doc">
    <p>The Morphic framework in Cuis has been redesigned to make building zoomable, vector graphics based GUIs easier than ever. Morphs are drawn by its high quality <em>Vector Graphics</em> back-end. It's entirely written with Cuis and accelerated with a plug-in.<br><a href="https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/tree/master/Documentation/Presentations/2021-01-FAST-VectorGraphicsInCuisSmalltalk">read more</a></p>
  </div>

  <div class="col">
    <h3>Small & Simple</h3>
    <img src="./assets/imgs/features/small.png" class="doc">
    <p>Smalltalk is a small and consistent language. Cuis is a very compact implementation of Smalltalk. The user's ability to understand the system is one of the major concerns of the Cuis community.</p>
  </div>
</div>

<section class="section dark" markdown="1">

## Philosophy

What sets Cuis apart from other Smalltalk systems is the focus on the original values of the Smalltalk project at Xerox PARC, and an active attitude towards system complexity:
{: .lead}

<div class="columns" markdown="1">

Unbound complexity growth, together with development strategies focused only in the short term, are the worst long term enemies of all software systems. As systems grow older, they usually become more complex. New features are added as layers on top of whatever is below, sometimes without really understanding it, and almost always without modifying it. Complexity and size grow without control. Evolution slows down. Understanding the system becomes harder every day. Bugs are harder to fix. Codebases become huge for no clear reason. At some point, the system can't evolve anymore and becomes "legacy code".

Complexity puts a limit to the level of understanding of the system a person might reach, and therefore limits the things that can be done with it. Dan Ingalls says all this in ["Design Principles Behind Smalltalk"](https://www.cs.virginia.edu/~evans/cs655/readings/smalltalk.html). Even if you have already done so, please go and read it again!

This presentation by Rich Hickey, ["Simple Made Easy"](https://www.infoq.com/presentations/Simple-Made-Easy/), is also an excellent reflection on these values.

</div>

<div class="columns" markdown="1">

We follow a set of ideas that started with Jean Piaget's [Constructivism](https://en.wikipedia.org/wiki/Constructivism_(philosophy_of_education)), and were further developed in Seymour Papert's [Mathland](https://en.wikipedia.org/wiki/Experiential_learning). These led to Alan Kay's Learning Research Group's [Personal Computer for Children of All Ages](https://www.vpri.org/pdf/hc_pers_comp_for_children.pdf), [Personal Dynamic Media](https://www.vpri.org/pdf/m1977001_dynamedia.pdf), i.e. the [Dynabook](https://www.vpri.org/pdf/hc_what_Is_a_dynabook.pdf), and to [Smalltalk-80](https://en.wikipedia.org/wiki/Smalltalk). To us, a Smalltalk system is a Dynabook. A place to experiment and learn, and a medium to express and register the knowledge we acquire. We understand software development as the activity of learning and documenting knowledge, for us and others to use, and also to be run on a computer. The fact that the computer run is useful is a consequence of the knowledge being sound and relevant. (Just making it work is _not_ the important part!)

</div>

<div class="columns" markdown="1">

Cuis Smalltalk is our attempt at this challenge. Furthermore, we believe we are doing something else that no other Smalltalk, commercial or open source, does. We attempt to give a true Smalltalk-80 experience, and keep Smalltalk-80 not just as legacy software of historic significance, but as a live, evolving system. We feel we are the keepers of this Smalltalk heritage, and enablers of the Dynabook experience.

As Cuis evolves, we keep on these values. Every update, be it a bug fix or a feature enhancement, is reviewed carefully to avoid adding unneeded complexity to the system. Every opportunity to remove unneeded complexity is followed. As we go, features are enhanced, and any reported bugs fixed. We also engage in discussion and share code and knowledge with the wider Smalltalk community.

</div>

</section>

## About the name

Cuis is the common name of a [small animal](https://en.wikipedia.org/wiki/Southern_mountain_cavy) that lives in Argentina's countryside. Cuis Smalltalk was originally forked from Squeak Smalltalk, so picking the onomatopoeia of the voice of a mouse for the name makes sense. As the project was started in Buenos Aires, 'Cuis' (essentially 'Squeak' in Rioplatense Spanish) was the obvious choice.

## License

Cuis is distributed subject to the [MIT License](https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/blob/master/LICENSE). Any contribution must also be under the MIT License.

<div class="fine-print" markdown="1">

Portions of Cuis are:

Copyright (c) Xerox Corp. 1981, 1982

Copyright (c) Apple Computer, Inc. 1985-1996

Copyright (c) Contributors to Squeak Project. 1997-2026

Copyright (c) Contributors to Cuis Smalltalk Project. 2009-2026

</div>
