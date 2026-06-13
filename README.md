# pie-pan

A containerized coding agent powered by [pi-coding-agent](https://github.com/earendil-works/pi-coding-agent). Run an AI-powered coding assistant in an isolated container with your entire project attached.

## Quick Start

```bash
# download the helper script
mkdir -p ~/.local/bin
curl -fsSL -o ~/.local/bin/pie-pan https://github.com/edepree/pie-pan/releases/latest/download/pie-pan
chmod +x ~/.local/bin/pie-pan

# start an interactive session in your current directory
pie-pan
```

## Usage

### Helper Script (`pie-pan`)

The `pie-pan` wrapper makes it easy to run the container from any project directory:

```bash
# interactive session (default)
pie-pan

# named container
pie-pan -n my-project

# detached session (for background work)
pie-pan --detached

# Specify a model router
pie-pan -r http://localhost:11434

# Use a custom container image
pie-pan -c ghcr.io/edepree/pie-pan:1.0.0
```

#### Options

| Flag | Description |
|------|-------------|
| `-n, --name NAME` | Container name suffix (creates `pie-pan-NAME`) |
| `-r, --router VALUE` | Set `MODEL_ROUTER` inside the container |
| `-c, --container IMAGE` | Custom container image to run |
| `-d, --detached` | Run in background (`sleep infinity`) |
| `-h, --help` | Show help message |

## Configuration

### Model Router

`pie-pan` connects to an OpenAI-compatible model router at startup. The entrypoint automatically fetches the list of available models and configures the pi-coding-agent.

Set the router URL via:
- CLI Flag: `--router http://localhost:11434`
- Environment Variable: `MODEL_ROUTER=http://localhost:11434`
- Default Environment Variable: `PIE_PAN_MODEL_ROUTER`

## Building

### Build Locally

```bash
podman build -t localhost/pie-pan:dev .
```
