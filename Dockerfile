# BUILD-USING: docker build -t derbyjs/component-examples .
# RUN-USING: docker run -p 3330:3330 --name derby-component-examples --rm derbyjs/component-examples

# specify base docker image
FROM dockerfile/nodejs

# copy over dependencies
WORKDIR /var
RUN mkdir derby-component-examples

ADD package.json /var/derby-component-examples/
ADD server.coffee /var/derby-component-examples/
ADD index.coffee /var/derby-component-examples/
ADD index.html /var/derby-component-examples/
ADD index.styl /var/derby-component-examples/

# npm install all the things
WORKDIR /var/derby-component-examples
RUN npm install

# expose any ports we need
EXPOSE 3330
ENV PORT 3330
# the command that gets run inside the docker container
CMD ["/var/derby-component-examples/node_modules/coffee-script/bin/coffee", "/var/derby-component-examples/server.coffee"]
