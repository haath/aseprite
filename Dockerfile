FROM ubuntu:18.04

# install dependencies
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    libx11-6 libxcursor1 libfontconfig1 libglu1 libc++1-10 \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# copy aseprite binary and make it executable
COPY ./build/bin/aseprite /usr/local/bin/aseprite
RUN chmod +x /usr/local/bin/aseprite

# copy the data folder
COPY ./build/bin/data/ /usr/local/bin/data

CMD [ "aseprite", "-b" ]
