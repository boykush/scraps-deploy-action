# Scraps Deploy Action

> [!WARNING]
> **This repository is archived and no longer maintained.**
>
> Starting with [Scraps](https://github.com/boykush/scraps) v1, the official deployment guide recommends using the standard [`actions/deploy-pages`](https://github.com/actions/deploy-pages) workflow instead of this action. See the [official deployment guide](https://boykush.github.io/scraps/scraps/how-to/deploy-to-github-pages.html) for the current setup.

A GitHub Action to build and deploy [Scraps](https://github.com/boykush/scraps) sites to GitHub Pages.

## About

[Scraps](https://github.com/boykush/scraps) is a lightweight static site generator for documentation and knowledge bases.

## Usage

```yaml
- uses: boykush/scraps-deploy-action@v3
  with:
    token: ${{ secrets.GITHUB_TOKEN }}
    pages-branch: gh-pages  # optional, defaults to 'gh-pages'
```

### Inputs

- `token` (required): GitHub token for authentication (e.g., `${{ secrets.GITHUB_TOKEN }}`)
- `pages-branch` (optional): Branch to deploy to (defaults to `gh-pages`)

## Documentation

See the [official deployment guide](https://boykush.github.io/scraps/scraps/how-to/deploy-to-github-pages.html) for detailed setup instructions.
