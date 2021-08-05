
FROM ubuntu:18.04

# Install dependencies
RUN apt-get update && \
  apt-get install -yq \	
    python3 \
    python3-pip	\	
  && apt-get clean && rm -rf /var/lib/apt/lists/*


RUN pip3 install --upgrade pip 
RUN pip3 install imutils
RUN pip3 install azure-iot-device
RUN pip3 install opencv-python-headless
RUN pip3 install --index-url https://google-coral.github.io/py-repo/ tflite_runtime
WORKDIR /PeopleCounterSSD/

COPY PeopleCounterSSD .

CMD ["python3", "/PeopleCounterSSD/main.py"]