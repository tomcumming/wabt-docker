# WABT inside a Docker container

A minimal image for running the WABT utilities. Has all the WABT binaries in $PATH, and working directory set to `/data`.

## Usage

To build and name the image as `wabt`:

```bash
docker build -t wabt https://github.com/tomcumming/wabt-docker.git
```

To map the working directory to `/data` and compile a WASM file from `example.wat` in the current directory.

```bash
docker run --rm -v $(pwd):/data wabt wat2wasm example.wat
```

This will result in a file in the current directory named `example.wasm`.
