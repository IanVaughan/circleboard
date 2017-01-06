# Setup
# docker-machine create --driver virtualbox circleboard
# docker-machine env circleboard
# eval "$(docker-machine env circleboard)"

# Build
# docker build --tag circleboard .
# docker run -d --name circleboard -p 8080 \
#   -v ~/config.coffee:/circleboard/config.coffee circleboard


# Debug
# docker run -it --rm circleboard bash

FROM ubuntu

# Install Node.js and other dependencies
RUN apt-get update && \
    apt-get -y install curl git vim && \
    curl -sL https://deb.nodesource.com/setup | sudo bash - && \
    apt-get -y install build-essential nodejs

RUN npm install -g coffee-script

RUN git clone https://github.com/Ephigenia/circleboard.git
WORKDIR /circleboard
RUN npm install
ADD config.coffee ./

# Expose port
EXPOSE  8080

# Run app using nodemon
CMD ["coffee", "server.coffee"]
