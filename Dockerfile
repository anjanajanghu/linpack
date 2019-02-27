FROM gcc:4.9.4
RUN mkdir -p /var/log/linpack
COPY . /usr/src/linpack
WORKDIR /usr/src/linpack
RUN gcc -o linpack -O3 -march=native -lm linpack.c
ENTRYPOINT ["./linpack"]
