FROM ghcr.io/blackshadev/garmin-connectiq-tools:8.2.3-2

COPY ./test.sh /connectiq/bin

ENTRYPOINT [ "/connectiq/bin/test.sh" ]