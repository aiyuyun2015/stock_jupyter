FROM python:3

RUN apt-get update && apt-get install -y python3-pip

COPY requirements.txt .

RUN pip install -r requirements.txt

# Install jupyter
RUN pip3 install jupyter
RUN git clone https://github.com/ipython-contrib/jupyter_contrib_nbextensions.git

RUN pip3 install -e jupyter_contrib_nbextensions
# Create a new system user
RUN useradd -ms /bin/bash demo

# Change to this new user
USER demo

# Set the container working directory to the user home folder
WORKDIR /home/demo

# Start the jupyter notebook
# RUN jupyter contrib nbextension install --user
# RUN jupyter nbextension enable toc2/main
# RUN jupyter nbextensions_configurator enable --user

ENTRYPOINT ["jupyter", "contrib", "nbextension", "install", "--user"]
ENTRYPOINT ["jupyter", "nbextension", "enable", "toc2/main"]
ENTRYPOINT ["jupyter", "nbextensions_configurator", "enable --user"]
ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--port=7777", "--allow-root"]

#ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0"]
