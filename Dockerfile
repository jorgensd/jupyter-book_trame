FROM ubuntu:22.04

RUN apt-get update && apt-get install -y python3-pip git
RUN apt-get install -y libgl1-mesa-glx libxrender1 xvfb
RUN python3 -m pip install pip setuptools -U
COPY requirements.txt .
ENV DEB_PYTHON_INSTALL_LAYOUT=deb_system
RUN python3 -m pip --no-cache-dir install -r requirements.txt --upgrade
ENV PYVISTA_TRAME_SERVER_PROXY_PREFIX='/proxy/'
ENV PYVISTA_TRAME_SERVER_PROXY_ENABLED="True"


ENTRYPOINT ["jupyter", "lab", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]
