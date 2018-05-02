FROM jupyter/minimal-notebook

USER root

# Install tools
RUN apt-get update && \
    apt-get -y install curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG COMPOSE_VERSION=1.16.1
ARG DOCKER_VERSION=17.12.1-ce

# Install docker-compose
RUN curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" \
    && chmod +x /usr/local/bin/docker-compose

# Install docker
RUN curl -L -o /tmp/docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz && \
    tar -xz -C /tmp -f /tmp/docker.tgz && \
    mv /tmp/docker/* /usr/bin

# Docker permissions
RUN groupadd docker -g 999 && usermod -aG docker jovyan

USER jovyan

# Install bash kernel
RUN /opt/conda/bin/pip install --no-cache-dir bash_kernel
RUN /opt/conda/bin/python -m bash_kernel.install

# Set config file and default notebook
COPY --chown=jovyan:users jupyter_notebook_config.py /home/jovyan/.jupyter/jupyter_notebook_config.py
COPY --chown=jovyan:users notebook.ipynb /home/jovyan/work/notebook.ipynb

# Set default notebook as readonly
RUN chmod a-w /home/jovyan/work/notebook.ipynb

# Start default notebook and start without password
CMD ["start-notebook.sh", "work/notebook.ipynb", "--ip=0.0.0.0", "--NotebookApp.token=''"]
