## Jupyter-book with Trame

This mini-repository has been made to illustrate that `pyvista` with the `trame` backend does not render plots
when used in conjunction with `jupyter-book`.

To run this locally, I recommend using the supplied `Dockerfile`.
```bash
docker build -t trame_test .
```

To use the dockerfile with shared directories and a terminal interface call:
```bash
docker run -ti  -v $(pwd):/root/shared -w /root/shared --rm  --entrypoint=/bin/bash trame_test
```
To use the JupyterLab notebook interface call
```bash
docker run -ti  -v $(pwd):/root/shared -w /root/shared --rm trame_test
```

By executing 
```bash
PYVISTA_JUPYTER_BACKEND="panel" jupyter book build .
```
or
```bash
PYVISTA_JUPYTER_BACKEND="trame" jupyter book build .
```
you can generate the book with each backend and consider the differences.

These commands is also executed on CI and uploaded as Artifacts.