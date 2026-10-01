# Cuis-Website

A web site for Cuis Smalltalk.

This is a Jekyll site that uses a template and some instructions for running Github Pages with the [`minima` theme][minima]. 

* Frontpage that includes your last blog posts: `_pages/frontpage.md`
* Archive for all your posts: `_pages/archive.md`
* About page: `_pages/about.md`
* Minimum 404 page: `_pages/404.md`
* Minimum metadata in the `_config.yml`
* Example CSS change inside `assets/main.scss`
* Custom footer template `_includes/footer.html`

Check out the excellent [`minima` theme][minima] documentation for further details and customization and the [official docs][gh] for more details on how Github Pages work.

For more details on how to create content, use Github interface, etc. feel free to browse [the website][web] or the source code here.

## Run and develop

GitHub Pages builds the site with the versions listed at [pages.github.com/versions](https://pages.github.com/versions/) (Ruby 3.3.4, `github-pages` 232). To run it locally with the same versions, use Docker:

```
docker compose up
```

The site is served at http://localhost:4000 and rebuilds on every change.

Without Docker, with Ruby 3.3.4 installed:

```
bundle install
bundle exec jekyll serve --livereload
```

## References

- [gh-site](https://pages.github.com)
- [jk](https://jekyllrb.com)
- [minima](https://github.com/jekyll/minima/tree/2.5-stable)
- [gh](https://help.github.com/en/github/working-with-github-pages)
- [gh-settings](https://help.github.com/en/github/working-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)
- [web](https://jsanz.github.io/gh-pages-minima-starter/)
