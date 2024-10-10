FROM python:3.8-slim

# Install Cassandra
RUN apt-get update && apt-get install -y openjdk-8-jdk && \
    wget https://downloads.apache.org/cassandra/3.11.10/apache-cassandra-3.11.10-bin.tar.gz && \
    tar -xzf apache-cassandra-3.11.10-bin.tar.gz -C /usr/local/ && \
    rm apache-cassandra-3.11.10-bin.tar.gz

# Set the working directory
WORKDIR /workspace

# Install Jupyter Notebook
RUN pip install notebook

# Expose the necessary ports
EXPOSE 8888 9042

# Start Cassandra and Jupyter Notebook
CMD ["/bin/bash", "-c", "cd /usr/local/apache-cassandra-3.11.10/bin && ./cassandra -f & jupyter notebook --ip=0.0.0.0 --no-browser --allow-root"]