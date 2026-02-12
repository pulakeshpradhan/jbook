# OpenGIS Jupyter Book

This repository contains the source code for the OpenGIS project documentation, built with [Jupyter Book](https://jupyterbook.org/).

## 🚀 Live Site

The book is published at: [https://pulakeshpradhan.github.io/jbook/](https://pulakeshpradhan.github.io/jbook/)

## 🛠️ How to Contribute

Please refer to [contributing.md](./contributing.md) for instructions on adding new notebooks and content.

## 🔒 Security & Safety

- **.gitignore**: Configured to exclude build artifacts, caches, and sensitive local files.
- **GitHub Actions**: Automated deployment using secure GitHub tokens.
- **Secrets**: Never commit API keys or credentials. Use GitHub Secrets for environment-specific data.

## 🏗️ Build Locally

To build the book on your local machine:

1. Install dependencies: `pip install jupyter-book`
2. Run build: `jupyter-book build .`
3. View the book: Open `_build/html/index.html` in your browser.
