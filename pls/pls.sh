#!/bin/bash
case $1 in
  open)
    arg=$2
    # Check if second argument is empty
    if [ -z $arg ]; then
      arg="."
    fi
    # Open with xdg-open
    xdg-open $arg > /dev/null 2>&1 | grep xdg-open: &
    # Exit with status code of xdg-open
    exit $?
    ;;
  rok)
    default_protocol="http"
    default_port=5173
    protocol=$2
    port=$3
    # If protocol is empty, set it to the default protocol
    if [ -z $protocol ]; then
      protocol=$default_protocol
    fi
    # If protocol is actually a port (protocol was only numbers)
    if [[ $protocol =~ ^[0-9]+$ ]]; then
      port=$protocol
      protocol=$default_protocol
    fi
    # If port is empty, set it to the default port
    if [ -z $port ]; then
      port=$default_port
    fi
    ngrok $protocol $port
    exit $?
    ;;
esac

echo "Usage: pls <alias>"
echo "Available aliases:"
echo "           open [path?] -- Open a file or directory with the default file manager. Silences output apart from xdg-open errors."
echo "rok [protocol?] [port?] -- Start ngrok with the specified protocol and port. Defaults to http and 5173 respectively."

