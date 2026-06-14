# pie-pan

A container for running the [pi-coding-agent](https://github.com/earendil-works/pi-coding-agent) against OpenAI compatible inference endpoints; specifically [llama.cpp](https://github.com/ggml-org/llama.cpp). The container provides the base tooling for Pi along with a custom entrypoint to discover models from the OpenAI endpoint and dynamically create a `models.json` file for them.

## Quick Start

```bash
# download the helper script
mkdir -p ~/.local/bin
curl -fsSL -o ~/.local/bin/pie-pan https://github.com/edepree/pie-pan/releases/latest/download/pie-pan
chmod +x ~/.local/bin/pie-pan

# start an interactive pi session in your current directory
pie-pan
```

## Usage

```
Usage: pie-pan [OPTIONS]

Run the pie-pan container from the current directory.

Version: latest
Container: ghcr.io/edepree/pie-pan:latest

Options:
      --command PROGRAM   Program to run inside the container (Default: pi)
      --container IMAGE   Container image to run
  -d, --detached          Run container in background
  -h, --help              Show this help message and exit
  -n, --name NAME         Container name suffix (creates pie-pan-NAME)
  -r, --router VALUE      Set MODEL_ROUTER inside the container (overrides PIE_PAN_MODEL_ROUTER)

Environment:
  PIE_PAN_MODEL_ROUTER    Default router to pass as MODEL_ROUTER inside the container
  PIE_PAN_VERSION         Override version used for container image tag

Examples:
  pie-pan
  pie-pan -n my-project
  pie-pan --detached
  pie-pan --command ghcr.io/example/pie-pan:latest --detached
```

## Building

### Build Locally

```bash
podman build -t localhost/pie-pan:dev .
```
