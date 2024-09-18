FROM rust:latest as build

WORKDIR /src
COPY . /src/
RUN cargo build --release

FROM alpine:latest as output
COPY --from=build /src/target/ ./output/
RUN ls /output/release
