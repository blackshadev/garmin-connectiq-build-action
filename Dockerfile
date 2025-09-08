FROM ghcr.io/blackshadev/garmin-connectiq-tools:8.2.3-1

COPY ./test.sh /connectiq/bin

ENTRYPOINT [ "/connectiq/bin/test.sh" ]