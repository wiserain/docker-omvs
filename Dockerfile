FROM alpine:3.12 as builder

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
 	build-base \
 	git \
 	libpcap-dev \
 	gstreamer-dev \
 	gst-plugins-good \
 	gst-plugins-bad \
 	gst-plugins-ugly \
 	gst-libav && \
 echo "**** clone source ****" && \
 git clone https://bitbucket.org/ohhara/ohmulticastvideoscanner.git /tmp/ohmulticastvideoscanner && \
 echo "**** build and install omvs ****" && \
 cd /tmp/ohmulticastvideoscanner && \
 ./configure && \
 make && \
 make DESTDIR=/tmp/omvs-build install

FROM alpine:3.12
LABEL maintainer="wiserain"

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
 	libpcap \
 	gstreamer \
 	gst-plugins-good \
 	gst-plugins-bad \
 	gst-plugins-ugly \
 	gst-libav && \
 echo "***** cleanup ****" && \
 rm -rf \
 	/var/cache/apk/* \
	/tmp/*

COPY --from=builder /tmp/omvs-build/usr/ /usr/

VOLUME /omvs_out
