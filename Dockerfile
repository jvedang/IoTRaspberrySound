FROM resin/rpi-raspbian

#Install Utility

RUN apt-get -q update \
	&& apt-get -qy install \
 		wget \
		python python-dev python-pip python-virtualenv \
		build-essential  \
		curl \
        	git 

RUN apt-get install python3

RUN pip install --upgrade virtualenv
RUN virtualenv -p python3 test

RUN pip install paho-mqtt		

WORKDIR /usr/src/app/test

COPY app/ /usr/src/app/test
RUN source /bin/activate

CMD ["python3", "/usr/src/app/test/main.py"]
