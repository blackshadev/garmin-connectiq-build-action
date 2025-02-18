FROM ghcr.io/blackshadev/garmin-connectiq-tools:1.0.0

COPY ./test.sh /connectiq/bin

ENTRYPOINT [ "/connectiq/bin/test.sh" ]