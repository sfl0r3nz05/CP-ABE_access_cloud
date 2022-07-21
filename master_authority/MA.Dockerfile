FROM dreen/flask
RUN apt-get update
RUN apt-get install -y flex
RUN apt-get install -y bison
RUN apt-get install -y libglib2.0-dev
RUN apt-get install -y libgmp-dev
RUN apt-get install -y libssl-dev
RUN wget https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz
RUN tar zxvf pbc-0.5.14.tar.gz && cd pbc-0.5.14 && ./configure --prefix=/usr/local --with-pic && make && make install
RUN wget https://acsc.cs.utexas.edu/cpabe/libbswabe-0.9.tar.gz
RUN tar zxvf libbswabe-0.9.tar.gz && cd libbswabe-0.9 && ./configure --prefix=/usr/local && make CC="gcc -fPIC" && make install
RUN apt-get install -y swig
RUN apt install python-dev
COPY library/ .
RUN cd ./cpabe-sdk && make clean && make python
COPY src/ /beebit-cpabe-sdk/python
CMD [ "python","-u","/cpabe-sdk/python/app.py" ]