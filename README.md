# Scraps Deploy Action

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

See the [official deployment guide](https://boykush.github.io/scraps/scraps/deploy-to-github-pages.how-to.html) for detailed setup instructions.
