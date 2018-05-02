FROM jupyter/minimal-notebook

USER jovyan

RUN /opt/conda/bin/pip install --no-cache-dir bash_kernel
RUN /opt/conda/bin/python -m bash_kernel.install

USER root
