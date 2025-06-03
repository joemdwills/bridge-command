#!/bin/bash

ENVIRONMENT_EXPORT="ENVIRONMENT"

if [[ -z "${!ENVIRONMENT_EXPORT}" ]]; then
    echo "❌ Environment variable '$ENVIRONMENT_EXPORT' is not set."
    echo "Please add the following line to your ~/.zshrc file:"
    echo
    echo "export $ENVIRONMENT_EXPORT=\"work\"    # or \"personal\""
    echo
    exit 1
fi

echo "✅ Environment: ${!ENVIRONMENT_EXPORT}"