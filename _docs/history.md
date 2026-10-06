---
title: A short history of Cuis
description: "Landmarks of the project, from its start in 2003 to the latest releases."
---

In 2003, Juan Vuletich, by then an active collaborator in the Squeak project, decided that a zoomable and scalable GUI was needed for Smalltalk. This would require completely abandoning back compatibility with the existing Morphic in Squeak. So, the Cuis Smalltalk project was started, although it was named much later.

The focus has always been to develop a general-purpose Smalltalk system that doesn't include application-specific code by default, and only includes basic functionality. This makes it easy to evolve, and it doesn't mandate extra burden on the developer.

A friendly and enthusiastic community has formed around it, developing additional code packages and applications.

Some landmarks in the project are:

<div class="timeline" markdown="1">

## <span class="when">2004-09</span> Etoys free Morphic

This is the point where the Smalltalk image that would later be called Cuis started to diverge from Squeak 3.7. The initial objective was to remove Etoys and other applications, resulting in a bare Morphic Smalltalk system that would not include any application-specific code. Work started on September 2004, shortly after Squeak 3.7 was released.

- <https://lists.squeakfoundation.org/pipermail/squeak-dev/2005-February/087571.html>
- <https://lists.squeakfoundation.org/pipermail/squeak-dev/2005-February/087756.html>
- <https://lists.squeakfoundation.org/pipermail/squeak-dev/2005-February/088763.html>
- <https://lists.squeakfoundation.org/pipermail/squeak-dev/2005-February/088787.html>
- <https://www.jvuletich.org/Squeak/EToysFreeMorphic/EtoysFreeMorphic.html>

## <span class="when">2004-10</span> Morphic 3 project

After preparing a reasonable base for further development of Morphic, Juan started working on the "Morphic 3" project. It would take three years of study, pondering and experimentation to come up with something worth showing.

<https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev/blob/master/Documentation/Morphic/VectorGraphicsAndMorphic3.md>

## <span class="when">2007-04-26</span> Cheap, High-Quality Fonts in Squeak

Until this moment, Squeak, like Smalltalk-80, only had 1-bit bitmap fonts that used to look reasonably good on the old cathode ray displays, but looked extremely pixelated on any modern display. Juan developed the techniques to allow high-quality, anti-aliased, sub-pixel rendered bitmap fonts using only the existing VM support, including colored and alpha-blended text. He also built several font sets, which were enhanced over time. This work was developed for the reduced Squeak image, but was also adopted by Squeak and Pharo.

- <https://www.jvuletich.org/issues/Issue0010.htm>
- <https://lists.squeakfoundation.org/pipermail/squeak-dev/2007-April/115930.html>
- <https://lists.squeakfoundation.org/pipermail/squeak-dev/2007-April/115948.html>

## <span class="when">2007-12-12</span> Morphic 3 presentation at the Smalltalks 2007 conference

Morphic 3 ended up being a redesign of the Morphic framework using Floating Point local coordinates, Vector Graphics and high-quality rasterization. At the very first Smalltalks conference in Buenos Aires, Juan presented the preliminary results of three years of intense research and development.

Videos and additional details at: <https://www.jvuletich.org/Morphic3/Smalltalks2007/Smalltalks2007.html>

## <span class="when">2008-04-05</span> Numbered Updates to the Cuis image

A stream of numbered updates debuts, with update #001. Since this moment, the total number of updates per year shows sustained development activity, with an outstanding year in 2015, and significant increase in progress since 2018:

| Year | Number of Updates |
| :--- | :--- |
| 2008 | 105 |
| 2009 | 281 |
| 2010 | 357 |
| 2011 | 448 |
| 2012 | 337 |
| 2013 | 390 |
| 2014 | 222 |
| 2015 | 724 |
| 2016 | 156 |
| 2017 | 224 |
| 2018 | 320 |
| 2019 | 437 |
| 2020 | 509 |
| 2021 | 522 |
| 2022 | 578 |
| 2023 | 546 |
| 2024 | 805 |
| 2025 | 821 |

## <span class="when">2009-03-27</span> Cuis 1.0

[Ann] Cuis: A new Squeak distribution

When it started to be clear that neither Squeak nor Pharo would rebase their codebase on our reduced kernel image, Juan decided to turn it into an Open Source, Community Maintained, Smalltalk system, as a separate project.

<https://lists.squeakfoundation.org/pipermail/squeak-dev/2009-March/134986.html>

## <span class="when">2009-11-21</span> The Cuis and Morphic 3 projects

First public presentation of Cuis at the Smalltalks conference in Buenos Aires. Also demoed Morphic 3 and LightWidgets.

<https://www.youtube.com/watch?v=G8HniJhVxlA>

You can see more about the early development of the projects at: [The Morphic 3 Project](https://www.jvuletich.org/Morphic3/Morphic3-200911.html), [Morphic 3 in action](https://www.jvuletich.org/Morphic3/Morphic3-201006.html)

## <span class="when">2010-01-04</span> Cuis 2.0

Support for true BlockClosures. Requires a newer, closures-enabled VM.

When full block closures were implemented in Squeak, and support added to the VM, we ported them to Cuis. At the same time, Cuis kept advancing towards our objectives, and many parts of the system continued to be cleaned and simplified.

## <span class="when">2011-01-14</span> Cuis 3.0

New, modern look. Themes. We keep improving Cuis usability, and make the development tools look better, including more conventional-looking (i.e. less colorful) Dark, Light and HighContrast UI themes.

## <span class="when">2012-04-21</span> Cuis 4.0

Code Packages. In addition to the ever-shrinking Kernel Image, we enable the development of code Packages that can be loaded as needed. This lets us decouple and better structure different parts of the system, and better distribute their development amongst developers. Over time, we developed over 30 packages that are distributed with Cuis, and over 20 GitHub repositories with additional packages developed and maintained by community members.

StyledTextEditor (<https://github.com/Cuis-Smalltalk/StyledTextEditor>) public release.

## <span class="when">2012-05-16</span> New Cuis mail list

We decided that a discussion forum specific for Cuis is a good idea. Still, most people are also active members of the Squeak and/or Pharo communities.

<https://lists.squeakfoundation.org/pipermail/squeak-dev/2012-May/164142.html>

## <span class="when">2013-07-14</span> GitHub Repo

Adopting GitHub as our code repository greatly eases project managing, gives us wider visibility, and protects the future of the project.

<https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev>

## <span class="when">2013-11-24</span> Publication of Vector Graphics engine techniques

A defensive disclosure on the techniques used in the project was published. This meant the code could now be open-sourced without worries of someone else trying to get a patent on it.

[Prefiltering Antialiasing for General Vector Graphics](https://www.researchgate.net/publication/267152327_Prefiltering_Antialiasing_for_General_Vector_Graphics), [(also here)](https://priorart.ip.com/IPCOM/000232657).

## <span class="when">2016-11-07</span> Cuis 5.0 - Spur Image Format

The [OpenSmalltalk](https://www.opensmalltalk.org) project keeps developing modern VMs for Open Source Smalltalk systems. We add Cuis images in the new Spur 32 and 64 bit formats to be used with them, in addition to the existing V3 32-bit image for existing VMs.

At this point, Cuis is the only Smalltalk system that runs with exactly the same source code for the whole system, on 32 and 64 bits, and with many VM flavors and platforms, including:

- Cog Spur 64 (High Performance 64 bits, jitted, for Intel)
- Cog Spur 32 (High Performance 32 bits, jitted, for Intel)
- Cog V3 (Good performance 32 bits, jitted, for Intel)
- V3 Classic Interpreter (32 bits, portable code. Runs on any processor)
- SqueakJS (32 bits, runs in a web browser on any platform)

So we can run in at least one VM flavor in macOS, Linux (Intel, ARM), Windows and Web Browsers. With some effort it is possible to run on Android, iOS, RISC OS. In the past, we have also run on Solaris, OS/2, and bare metal.

All this also means that we don't need to maintain forked code bases to support this wide array of VMs and platforms. Developers of applications and tools need to focus on a single code base and always get platform independence for free.

## <span class="when">2017-01-10</span> CuisUniversity is born

[CuisUniversity](https://sites.google.com/view/cuis-university) is a Cuis Distribution prepared by Hernán Wilkinson with built-in support for Test Driven Design, Automated Refactorings, LiveTyping and DenotativeObjects. It is used for teaching at Universidad de Buenos Aires - FCEN (School of Sciences) and FIUBA (School of Engineering), and at Universidad de Quilmes.

## <span class="when">2018-12-15</span> Erudite

Mariano Montone's Erudite repo <https://github.com/Cuis-Smalltalk/Erudite>

## <span class="when">2019-01-23</span> Numerics, Geographic Information Systems, SVG

New repos:

- <https://github.com/Cuis-Smalltalk/Numerics>
- <https://github.com/Cuis-Smalltalk/GeographicInformationSystems>
- <https://github.com/Cuis-Smalltalk/SVG>

## <span class="when">2019-01-23</span> Aconcagua and Chalten

Hernán Wilkinson's Aconcagua and Chalten for Cuis (Measures and Calendars) projects moved to the Cuis-Smalltalk GitHub organization.

- <https://github.com/Cuis-Smalltalk/Measures>
- <https://github.com/Cuis-Smalltalk/Calendars>

## <span class="when">2019-05-10</span> TrueType font support

100% Smalltalk code. Top visual quality, surpassing the native font rasterizers used by macOS, Windows and Linux. No need for FreeType or any other external library.

<https://lists.cuis.st/mailman/archives/cuis-dev/2019-May/000184.html>

## <span class="when">2020-03-22</span> Cuis Website

Jorge Sanz starts the website with the [first commit](https://github.com/Cuis-Smalltalk/Cuis-Website/commit/fd2dafa96551d50cc805abbef1b3f93d65980feb) of its [repo](https://github.com/Cuis-Smalltalk/Cuis-Website).

## <span class="when">2020-04-16</span> DrGeo

Hilaire Fernandes started the port of [Dr. Geo](https://gnu-drgeo.blogspot.com/) to Cuis. Welcome Hilaire and Dr. Geo!

## <span class="when">2020</span> The Cuis Book

Hilaire Fernandes led the creation of a book written specifically for people learning about Cuis and Smalltalk. Its original site, [cuis-smalltalk.github.io/TheCuisBook](https://web.archive.org/web/20241003210108/https://cuis-smalltalk.github.io/TheCuisBook/) ([pdf](https://web.archive.org/web/20240219184319/https://github.com/Cuis-Smalltalk/TheCuisBook/releases/download/latestpdfbuild/TheCuisBook.pdf)), survives in the Wayback Machine. The book now lives at [drcuis.github.io/TheCuisBook](https://drcuis.github.io/TheCuisBook/) ([pdf](https://github.com/DrCuis/TheCuisBook/releases/latest/download/TheCuisBook.pdf)).

## <span class="when">2020-07-15</span> Cuis Website preview

Mariano Montone [shares a preview](https://lists.cuis.st/mailman/archives/cuis-dev/2020-July/002124.html) of the new website at [mmontone.github.io/Cuis-Website](https://mmontone.github.io/Cuis-Website/).

## <span class="when">2020</span> Vector Graphics and SVG

While the redesign of Morphic had always been done in the Cuis image, the experiments with VectorGraphics were done separately. Now, the implementation of the VectorGraphics Morphic Canvas and Engine matured, and they were added as optional packages to the main Cuis Smalltalk repo. This also enabled support for SVG morphs and files in Cuis.

<https://lists.cuis.st/mailman/archives/cuis-dev/2020-August/002157.html>

## <span class="when">2021</span> Vector Graphics Engine

Later, the VectorEngine was added to the official OpenSmalltalk VMs. VectorGraphics became reliable and performant, and can now be used as the main UI for Cuis and applications developed with it.

<https://lists.cuis.st/mailman/archives/cuis-dev/2021-March/002849.html>

## <span class="when">2021-11-24</span> New Cuis website is live

Mariano Montone [announces](https://lists.cuis.st/mailman/archives/cuis-dev/2021-November/004448.html) that the new website is live at [www.cuis-smalltalk.org](https://web.archive.org/web/20220128200909/http://www.cuis-smalltalk.org/) (first copy in the Wayback Machine, from 2022-01-28), the same day its [domain is configured](https://github.com/Cuis-Smalltalk/Cuis-Website/commit/fdd8b0cfc9b754402ba53077347af859def70fab).

## <span class="when">2021-12-31</span> Cuis 6.0

The hierarchy of fundamental Morph classes was reorganized. As this could affect compatibility, a new major version release was done.

## <span class="when">2022-05-10</span> Unicode

Unicode support in Text Editors, Files and Smalltalk selectors and variables. Now, after selecting 'Preferences / Use Unicode text', the full range of Unicode characters can be used anywhere, and files are saved in UTF-8 format, including Smalltalk code.

<https://lists.cuis.st/mailman/archives/cuis-dev/2022-May/005654.html>

New <https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-UI> repo.

## <span class="when">2022-07-21</span> New cuis.st domain

Juan Vuletich [announces](https://lists.cuis.st/mailman/archives/cuis-dev/2022-July/006124.html) the new <https://cuis.st/> domain for the website, and [configures it](https://github.com/Cuis-Smalltalk/Cuis-Website/commit/3174daeb1adcc5d330ee85ec5fbd001cf5f8e130) the same day. Until then, the domain only showed a [hosting placeholder](https://web.archive.org/web/20201026045059/http://cuis.st/). The [first copy of the website at cuis.st](https://web.archive.org/web/20220726233500/https://cuis.st/) in the Wayback Machine is from 2022-07-26.

## <span class="when">2022-10-28</span> Unicode enabled by default

All code files are UTF-8. All Strings and code in the image can hold Unicode. All text is rasterized by our Vector Graphics engine from TrueType font definitions.

## <span class="when">2023</span> Bootstrap and Dynamic Libraries

A new framework for bootstrapping Smalltalk images in the Spur format. A new binary, precompiled format for Smalltalk libraries that can be dynamically bound to a running image.

<https://lists.cuis.st/mailman/archives/cuis-dev/2023-October/008099.html>

## <span class="when">2023-12-29</span> Cuis 6.2 Stable Release, Cuis 6.3 Rolling Release

First release of Cuis following a new Release Process: Cuis 6.2 Stable Release. Traditional Rolling Release is now 6.3.

<https://lists.cuis.st/mailman/archives/cuis-dev/2023-December/008269.html>

## <span class="when">2024-05-13</span> Cuis 7.0 Stable Release, Cuis 7.1 Rolling Release

- Single immediate Character class.
- Abandoned the old v3 image format.
- Usability improvements.
- Enhancements in Numerics.

## <span class="when">2024-12-06</span> Cuis 7.2 Stable Release, Cuis 7.3 Rolling Release

- New Menu and Keyboard Shortcuts Specs. Simpler. More flexible.
- Updated Morph hierarchy.
- Modal Dialogs.
- Enhancements to Layouts.
- Process-specific state.
- Usability improvements. Find with Scope Tool for convenient searching of text in source code.
- Improved Robustness.

## <span class="when">2025-05-30</span> Cuis 7.4 Stable Release, Cuis 7.5 Rolling Release

- Updates to Vector Graphics:
    - Clipping to the arbitrary convex shape of multiple nested containers. Correct clipping in SVG Morphs.
    - Fast dashed strokes with a convenient, easy-to-use API.
    - Support for UTF-32 and ASCII text output (in addition to the UTF-8 text that Cuis uses).
    - Big performance improvements.
- Ephemerons. New Ephemeron-based FinalizationRegistry. New Ephemeron-based ActionMaps and Property Tables.
- New WeakSet. New Symbol table.
- Debugger enhancements.
- Updated Random Number Generator.
- Enhancements: Usability. Performance. Robustness.

## <span class="when">2025-12-19</span> Cuis 7.6 Stable Release, Cuis 7.7 Rolling Release

- Completed the support for the Sista Bytecode set.
- Debugger robustness against non-reentrant code. #effectiveProcess.
- Allow adding instance variables to ClassDescription.
- New Layout strategy: FormLayout and LayoutSizeSpec.
- New better implementation of User Events dispatching to Morphs.
- Improved handling of Keyboard Focus and ClickToFocus.
- Bubbling up on unhandled Keyboard Shortcuts.
- Ongoing work on Bootstrap and Compiled Libraries:
    - Support the Sista Bytecode Set, and use it by default.
    - Lifted all restrictions on class reshaping and merge of class definitions.
    - Lifted all restrictions on remap of instance variable access in CompiledMethods.
- Enhancements in Usability. Performance. Robustness.

## <span class="when">2026-05-29</span> Cuis 7.8 Stable Release, Cuis 7.9 Rolling Release

- OKLCH Color model.
- Better ChangeSet capture of moving classes and methods to and from packages
- Automatic creation of a new package when creating classes in a new system hierarchy
- Updates to Bootstrap
- Various bug fixes
- Enhancements in Usability. Performance. Robustness.

## <span class="when">Since 2026-05-29</span> Included in the Cuis 7.9 Rolling Release

- Performance improvements in Vector Graphics Plugin
- Arbitrary Method Properties
- Ephemeron fixes
- Method timestamps saved in UTC time, displayed in local time
- Fast StaticImageMorph
- Bug Fixes, Cleanup, Refactors

</div>
