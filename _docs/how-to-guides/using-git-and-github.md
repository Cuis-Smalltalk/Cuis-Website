---
title: Using Git and GitHub to host and manage Cuis code
description: "How to host and version your Cuis packages with Git and GitHub."
---

Cuis doesn't do version control by itself: it doesn't handle Package versions, ancestries, etc. If versioning of Packages is desired, the best is to use an external versioning file repository, such as Git or Mercurial. This is not unlike using Git or GitHub with a file-based development environment such as Eclipse or a text editor. Like Cuis, these tools don't do version handling themselves, they just load and save files, and let Git do its magic.

The Cuis project is hosted on [GitHub](https://github.com), as most projects related to Cuis.

<div class="note" markdown="1">
<svg class="icon"><use href="{{ "/assets/icons.svg#lightbulb" | relative_url }}"></use></svg>

The recommendation is to use a GitHub repository with a name beginning with 'Cuis-Smalltalk-', so it will be easy for anybody to find it.

</div>

The guiding principle is to *not duplicate concepts and behavior*. We use GitHub to host, version, diff and merge external packages (.pck files), i.e. code that is maintained independently and outside Cuis.

Package files need to be simple text files. Cuis code files are uncompressed, encoded in UTF-8, and use the LF (ASCII 10) newline convention. This means they are Git friendly: Git/GitHub can diff versions, merge branches, and browse them with syntax highlighting.

## Hosting external packages

What follows is the suggested procedure for using Git/GitHub to host external packages, and store their version history. Usually do this every day.

1. Start with a standard (i.e. fresh) Cuis image. **Never save the image.**
2. Set up Git repositories for external packages (if not already done).
3. Install packages from Git repositories.
4. Develop. Modify and/or create packages.
5. Save own packages (to Git repositories).
6. Git add / commit / push as appropriate.
7. Save changes that are not part of any package. These are automatically captured in numbered ChangeSets, separated from changes to packages.
8. Exit the image. Usually without saving.
