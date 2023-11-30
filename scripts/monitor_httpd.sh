#!/bin/bash

# Define the httpd service name
service_name="httpd"

# Check if the httpd service is running
if systemctl is-active --quiet $service_name; then
    echo "The $service_name service is running."
else
    echo "The $service_name service is not running."

    # Start the httpd service
    if systemctl start $service_name; then
        echo "The $service_name service has been started."
    else
        echo "Failed to start the $service_name service."
    fi
fi