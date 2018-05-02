FROM jupyter/minimal-notebook

USER jovyan

# Make sure not to create a cache dir else NB_UID switching
# will hit issues.
RUN /opt/conda/bin/pip install --no-cache-dir bash_kernel
RUN /opt/conda/bin/python -m bash_kernel.install

USER root
