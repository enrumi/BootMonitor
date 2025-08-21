#!/bin/bash
# Script to initialize the Boot Monitor Xcode project

echo "Creating Boot Monitor Xcode project..."

# Check if Xcode command line tools are installed
if ! command -v xcodebuild &> /dev/null
then
    echo "Xcode command line tools not found. Please install Xcode from the App Store."
    exit 1
fi

# Create the Xcode project
mkdir -p BootMonitor.xcodeproj
echo "Xcode project directory created."

echo "Project structure is ready. Please open Xcode and create a new project, then add the existing files to it."

echo "Setup complete!"