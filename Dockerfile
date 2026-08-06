###########
# CRYSTAL #
###########

FROM alpine:3.24 AS crystal

RUN apk add --update --no-cache \
  make \
  # Deliberately loose on the patch level: this follows whatever Alpine 3.24
  # ships, which can differ from the exact version mise.toml pins for
  # development. Pinning `=~1.20.3` here would break the release build outright
  # the day Alpine's package moves, so the drift is accepted and recorded
  # rather than traded for a hard failure.
  crystal=~1.20 \
  shards \
  gc-dev \
  gc-static \
  git \
  libxml2-dev \
  libxml2-static \
  openssl-dev \
  openssl-libs-static \
  gmp-dev \
  gmp-static \
  pcre2-dev \
  pcre2-static \
  xz-dev \
  xz-static \
  yaml-dev \
  yaml-static \
  zlib-dev \
  zlib-static

#########
# BUILD #
#########

FROM crystal AS build-binary-file

# Fetch platforms variables from ARGS
ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

# Export them to build binary files with the right name: netbox-extractor-linux-amd64
ENV \
  TARGETPLATFORM=${TARGETPLATFORM} \
  TARGETOS=${TARGETOS} \
  TARGETARCH=${TARGETARCH} \
  TARGETVARIANT=${TARGETVARIANT}

# Set build environment
WORKDIR /build
COPY .git/ /build/.git/
COPY shard.yml shard.lock /build/
COPY Makefile.release /build/Makefile
COPY src/ /build/src/
COPY vendor/ /build/vendor/
COPY templates/ /build/templates/
RUN mkdir /build/bin

# Build the binary
RUN make release

# Extract binary from Docker image
FROM scratch AS binary-file
ARG TARGETOS
ARG TARGETARCH
COPY --from=build-binary-file /build/bin/netbox-extractor-${TARGETOS}-${TARGETARCH} /

###########
# RUNTIME #
###########

# Build distroless images \o/
FROM gcr.io/distroless/static-debian12 AS docker-image

# Fetch platforms variables from ARGS
ARG TARGETOS
ARG TARGETARCH

# Grab netbox-extractor binary from **binary-file** step and inject it in the final image
COPY --from=build-binary-file /build/bin/netbox-extractor-${TARGETOS}-${TARGETARCH} /usr/bin/netbox-extractor

# Set runtime environment
USER nonroot
ENV USER=nonroot
ENV HOME=/home/nonroot
WORKDIR /home/nonroot
ENTRYPOINT ["netbox-extractor"]
