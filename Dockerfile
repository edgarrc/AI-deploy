FROM python:3.7-slim-stretch
LABEL maintener 'Edgar'

RUN apt-get update && apt-get install -y \
    curl \
    git \
    gnupg \ 
    apt-transport-https \
    wget && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
ENV ACCEPT_EULA=Y  
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && apt-get install --reinstall -y \
    gcc \
    build-essential \
    unixodbc \ 
    unixodbc-dev \
    msodbcsql17 && \
    cp /etc/odbc.ini /etc/odbcinst.ini /usr/local/etc/  && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
	
RUN pip install --upgrade pip && pip3 install --no-cache-dir \
    wheel \
    fastai \
    sklearn \
    scipy \
    scikit-learn \
    pandas \
    gensim \
    nltk \
    pypyodbc \
    pyramid 

RUN mkdir /app
WORKDIR /app
EXPOSE ${PORT}
CMD ["sh", "-c", "/usr/local/bin/python ${APPNAME} ${PORT}"]
