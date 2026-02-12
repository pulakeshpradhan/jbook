# How to Add New Content

To add a new Jupyter Notebook (`.ipynb`) to this book, follow these steps:

1. **Create the file**: Place your new `.ipynb` or `.md` file in the root directory. **Important:** The filename must literally match what you type in the next step.
2. **Update `_toc.yml`**: Open the `_toc.yml` file and add the filename (without the extension) under the `chapters` section.
    * **WARNING**: Use the key `file:`, not `fuke:` or `name:`.
    * **WARNING**: If you add a file to `_toc.yml` but haven't created the actual file yet, the build will fail and the website will show a "404 Not Found" or a blank page.

    Example:

    ```yaml
    chapters:
    - file: xarray_aggregating_time_series
    - file: your_new_notebook_filename
    ```

3. **Commit and Push**:

    ```bash
    git add .
    git commit -m "Add new notebook: your_new_notebook_filename"
    git push origin main
    ```

## Safety & Security Measures

To keep the repository clean and secure, follow these guidelines:

1. **Never commit secrets**: Do not include API keys, passwords, or personal credentials in your notebooks. Use environment variables or GitHub Secrets instead.
2. **Ignored files**: A `.gitignore` has been added to prevent building artifacts (like `_build/`) and temporary cache files from being pushed to GitHub.
3. **Environment isolation**: It is recommended to work within a virtual environment (`venv`).
4. **GitHub Actions**: The deployment workflow uses `${{ secrets.GITHUB_TOKEN }}` which is a short-lived, secure token provided by GitHub. No manual tokens are stored in the code.

The book will automatically rebuild if you have GitHub Actions set up.
