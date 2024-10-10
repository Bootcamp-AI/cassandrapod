FROM ubuntu:latest

RUN pip install jupyter

RUN apt-get update && apt-get install cassandra -y

EXPOSE 8888 9042

EXPOSE 8888 9042

CMD [ "jupyter", "notebook", "--ip" , "0.0.0.0", "--port", "8888", "--allow-root", "&", "cassandra", "-f" ]


