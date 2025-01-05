FROM python 
RUN apt update -y
RUN mkdir /new
COPY addition.py /new/
CMD [ 'python','/new/addition.py' ]
