FROM python 
RUN apt update -y
RUN mkdir /new
COPY addition.py /new/
ENTRYPOINT [ 'python','/new/addition.py' ]
