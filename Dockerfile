FROM ghcr.io/blackshadev/garmin-connectiq-tools:8.3.0-test

COPY ./test.sh /connectiq/bin

ENTRYPOINT [ "/connectiq/bin/test.sh" ]