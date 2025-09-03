#!/bin/bash

# Build script to generate constants from JSON configuration
# This should be run before building the app

echo "Generating constants from config/api_constants.json..."

# Run the Dart code generator
dart tools/generate_constants.dart

if [ $? -eq 0 ]; then
    echo "✅ Constants generated successfully"
else
    echo "❌ Failed to generate constants"
    exit 1
fi
