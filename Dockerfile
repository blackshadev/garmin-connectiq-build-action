FROM ghcr.io/blackshadev/garmin-connectiq-tools:8.1.1

COPY ./test.sh /connectiq/bin

ENTRYPOINT [ "/connectiq/bin/test.sh" ]