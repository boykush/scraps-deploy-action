# Scraps Deploy Action

A GitHub Action to build and deploy [Scraps](https://github.com/boykush/scraps) sites to GitHub Pages.

## About

[Scraps](https://github.com/boykush/scraps) is a lightweight static site generator for documentation and knowledge bases.

## Usage

```yaml
- uses: boykush/scraps-deploy-action@v2
  env:
    TOKEN: ${{ secrets.GITHUB_TOKEN }}
    PAGES_BRANCH: gh-pages
```

## Documentation

See the [official deployment guide](https://boykush.github.io/scraps/scraps/deploy-to-github-pages.how-to.html) for detailed setup instructions.
