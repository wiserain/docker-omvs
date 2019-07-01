FROM alpine:3.10

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
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
 	libpcap \
 	gstreamer \
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
 make install && \
 echo "***** cleanup ****" && \
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/tmp/*

VOLUME /omvs_out
