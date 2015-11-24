# docker-machine create --driver virtualbox circleboard
# docker-machine env circleboard
# eval "$(docker-machine env circleboard)"

# docker build --tag circleboard .
# docker run -d --name circleboard -p 8080 --link circileboard

FROM ubuntu

# Install Node.js and other dependencies
RUN apt-get update && \
    apt-get -y install curl git && \
    curl -sL https://deb.nodesource.com/setup | sudo bash - && \
    apt-get -y install python build-essential nodejs

# Install nodemon
RUN npm install -g nodemon

# Provides cached layer for node_modules
# ADD package.json /tmp/package.json
# RUN cd /tmp && npm install
# RUN mkdir -p /src && cp -a /tmp/node_modules /src/

# Define working directory
# WORKDIR /src
# ADD . /src

RUN git clone git@github.com:Ephigenia/circleboard.git
WORKDIR /circleboard
RUN npm install

# Expose port
EXPOSE  8080

# Run app using nodemon
# CMD ["nodemon", "/src/index.js"]
CMD ["coffee", "server.coffee"]
