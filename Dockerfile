FROM ubuntu:22.10

# install dependencies
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    libx11-6 libgl1 libfontconfig1 libxcursor1 libc++1 \
    imagemagick \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# copy aseprite binary and make it executable
COPY ./build/bin/aseprite /usr/local/bin/aseprite
COPY ./build/bin/data/ /usr/local/bin/data
RUN chmod +x /usr/local/bin/aseprite
RUN aseprite --version

# copy aseprite-gen binary and make it executable
COPY aseprite-gen /usr/local/bin/aseprite-gen
RUN chmod +x /usr/local/bin/aseprite-gen
RUN aseprite-gen --version

CMD [ "aseprite", "-b" ]
