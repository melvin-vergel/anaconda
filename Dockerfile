FROM continuumio/anaconda3

COPY ./srv/anaconda/conf/requirements.txt /requirements.txt

RUN apt-get -y install gcc 
RUN pip install --upgrade setuptools 
RUN pip install -r requirements.txt
RUN mkdir -p /root/.jupyter
COPY ./srv/anaconda/conf/jupyter_notebook_config.json /root/.jupyter/jupyter_notebook_config.json

EXPOSE 8888

CMD ["/opt/conda/bin/jupyter notebook", "--notebook-dir=/opt/notebooks", "--ip='0.0.0.0'","--port=8888","--no-browser"," --allow-root"]