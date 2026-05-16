FROM alpine:3.22.4 AS build

ARG OPENRA_RELEASE=20250330
ARG TARGETARCH

RUN apk add make=4.4.1-r3 dotnet8-sdk=8.0.126-r0 freetype=2.13.3-r0 openal-soft-libs=1.24.2-r0 lua5.1-libs=5.1.5-r13 sdl2=2.32.8-r0

RUN mkdir /openra
RUN mkdir /source
WORKDIR /source

RUN wget -qO- "https://github.com/OpenRA/OpenRA/archive/refs/tags/release-${OPENRA_RELEASE}.tar.gz" | tar -xz --strip-components=1 -C /source
RUN make version VERSION=release-${OPENRA_RELEASE}
RUN case "$TARGETARCH" in \
        amd64) DOTNET_ARCH=x64 ;; \
        arm64) DOTNET_ARCH=arm64 ;; \
        *) echo "Unsupported arch: $TARGETARCH" && exit 1 ;; \
    esac && \
    make TARGETPLATFORM=linux-musl-${DOTNET_ARCH} prefix=/openra install

FROM alpine:3.22.4 AS openra

RUN apk add libgcc=14.2.0-r6 libstdc++=14.2.0-r6 icu-libs=76.1-r1

COPY --from=build /openra/lib/openra /lib/openra
RUN ln -s /lib/openra/OpenRA.Server /bin/openra-server
COPY entrypoint.sh /

WORKDIR /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["Engine.EngineDir=/lib/openra"]
