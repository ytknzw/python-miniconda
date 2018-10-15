FROM continuumio/miniconda3

# Grab requirements.txt.
ADD ./webapp/requirements.txt /tmp/requirements.txt

# Install dependencies
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
#RUN pip install --upgrade distribute
#RUN pip install --upgrade wsgiref
RUN pip install -qr /tmp/requirements.txt

# Add our code
ADD ./webapp /opt/webapp/
WORKDIR /opt/webapp

RUN conda install scikit-learn

CMD gunicorn --bind 0.0.0.0:$PORT wsgi
