FROM ubuntu:18.04

# install dependencies
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    libx11-6 libxcursor1 libfontconfig1 libglu1 libc++1-10 imagemagick \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# copy aseprite binary and make it executable
COPY ./build/bin/aseprite /usr/local/bin/aseprite
RUN chmod +x /usr/local/bin/aseprite
RUN aseprite --version

# copy the data folder
COPY ./build/bin/data/ /usr/local/bin/data

# copy aseprite-gen binary and make it executable
COPY aseprite-gen /usr/local/bin/aseprite-gen
RUN chmod +x /usr/local/bin/aseprite-gen
RUN aseprite-gen --version

CMD [ "aseprite", "-b" ]
