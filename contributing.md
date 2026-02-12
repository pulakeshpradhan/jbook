# How to Add New Content

To add a new Jupyter Notebook (`.ipynb`) to this book, follow these steps:

1. **Add the file**: Place your new `.ipynb` file in the root directory (or a subdirectory like `content/`).
2. **Update `_toc.yml`**: Open the `_toc.yml` file and add the filename (without the extension) under the `chapters` section.

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

The book will automatically rebuild if you have GitHub Actions set up.
