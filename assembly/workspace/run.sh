#!/usr/bin/env bash

set -euo pipefail

# Commands
cmd_download() {
    echo "Running download..."
    # Add your download logic here
}

cmd_start() {
    local image="localhost/genome-assembly"
    local container_runtime="podman"
    
    # Parse optional arguments
    shift  # Remove 'start' command
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --image)
                image="$2"
                shift 2
                ;;
            *)
                echo "Error: Unknown option '$1'"
                exit 1
                ;;
        esac
    done
    
    local full_image="${image}:latest"
    
    echo "Starting interactive container with GUI support..."
    echo "You can now run: igv, Bandage"
    
    if [ -f "$HOME/.Xauthority" ]; then
        $container_runtime run -it --rm \
            -v $(pwd):/data:Z \
            -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
            -v $HOME/.Xauthority:/root/.Xauthority:ro \
            -e DISPLAY=$DISPLAY \
            -e XAUTHORITY=/root/.Xauthority \
            --network=host \
            --security-opt label=disable \
            $full_image
    else
        echo "Warning: .Xauthority not found, using relaxed X11 access"
        xhost +local: 2>/dev/null || true
        $container_runtime run -it --rm \
            -v $(pwd):/data:Z \
            -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
            -e DISPLAY=$DISPLAY \
            --network=host \
            --security-opt label=disable \
            $full_image
    fi
}

cmd_help() {
    cat << EOF
Usage: $0 <command> [options]

Commands:
    download              Download required data/dependencies
    start [--image NAME]  Start the assembly container
                          --image: Docker/Podman image (default: bioinf-fi/assembly)
    help                  Show this help message

EOF
}

# Main
main() {
    if [ $# -eq 0 ]; then
        cmd_help
        exit 1
    fi

    case "$1" in
        download)
            cmd_download
            ;;
        start)
            cmd_start "$@"
            ;;
        help|--help|-h)
            cmd_help
            ;;
        *)
            echo "Error: Unknown command '$1'"
            echo ""
            cmd_help
            exit 1
            ;;
    esac
}

main "$@"
