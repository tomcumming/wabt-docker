from debian:stable-slim as builder

run apt-get update && apt-get upgrade -y
run apt-get install -y git cmake build-essential

workdir /var/opt
run git clone --recursive https://github.com/WebAssembly/wabt

workdir /var/opt/wabt/build
run cmake ..
run cmake --build .
workdir /var/opt/wabt/bin
run mv ../build/wasm* ../build/wat* .

# Second stage
from alpine
RUN apk add --no-cache gcompat libstdc++
copy --from=builder /var/opt/wabt/bin /usr/local/bin
workdir /data
