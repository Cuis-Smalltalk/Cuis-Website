---
title: Additional packages for Cuis
description: "Where optional functionality for Cuis lives, and how to load it."
---

The Cuis base image includes only kernel functionality, very basic libraries, and development tools. Optional functionality, that can be loaded as needed, is stored in separate code Packages. The Cuis community develops and maintains several dozens of such Packages.

The main Cuis GitHub repository, at <https://github.com/Cuis-Smalltalk/Cuis-Smalltalk-Dev>, includes a `Packages` folder. Packages here include basic libraries and system extensions that are used by many other packages and applications. They are maintained and kept up to date in sync with the base Cuis image.

You can load them like this:

```smalltalk
Feature require: 'Sound'.
Feature require: 'WebClient'.
Feature require: 'JSON'.
```

The Cuis Smalltalk GitHub organization, at <https://github.com/Cuis-Smalltalk>, includes over 30 additional repositories with community developed and maintained code. Repos in the Cuis Smalltalk organization are meant for wide use. Most of them are of very high quality, well maintained and really useful. Explore them!

Some Cuis developers may prefer to host their packages in personal repos. This is usually best for code that is not yet ready for wide adoption. You're welcome to explore them and contact authors if you have questions.

Don't forget to check the [Packages]({{ "/packages" | relative_url }}) section when searching for useful packages for Cuis!
